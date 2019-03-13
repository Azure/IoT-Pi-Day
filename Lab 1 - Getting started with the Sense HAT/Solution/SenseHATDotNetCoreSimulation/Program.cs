using System;
using Microsoft.Azure.Devices.Client;
using Newtonsoft.Json;
using System.Text;
using System.Threading.Tasks;

namespace SenseHATDotNetCoreSimulation
{
    class Program
    {
        static void Main()
        {
            Console.WriteLine();
            Console.WriteLine("================================================================");
            Console.WriteLine("Welcome to the RaspberryPi SenseHAT Simulation - Ctrl-C to exit.");
            Console.WriteLine("================================================================");
            Console.WriteLine();

            // Collect Simulated Sensor Data and send to IoT hub
            SendDeviceToCloudMessagesAsync();
            Console.ReadLine();
        }

        private static DeviceClient s_deviceClient;

        // The device connection string to authenticate the device with your IoT hub.
        // This is found on the (Azure IoT Hub |  IoT Devices | <devicename> | Connection String primary)
        private const string s_connectionString = "<Your IoT Hub Connnection String with Device Id>";
        private static async void SendDeviceToCloudMessagesAsync()
        {
            Console.WriteLine("=== Serializing the Simulated Sensor Data to JSON format ===========");

            // Connect to the IoT hub using the MQTT protocol
            s_deviceClient = DeviceClient.CreateFromConnectionString(s_connectionString, TransportType.Mqtt);

            // Initial telemetry values
            double minTemperature = 50;
            double minHumidity = 30;
            double minPressure = 500;
            double currentTemperature = 0;
            double currentHumidity = 0;
            double currentPressure = 0;

            Random rand = new Random();

            while (true)
            {
                currentTemperature = Math.Round(minTemperature + rand.NextDouble() * 15, 2);
                currentHumidity = Math.Round(minHumidity + rand.NextDouble() * 20, 2);
                currentPressure = Math.Round(minPressure + rand.NextDouble() * 5, 2);

                // Display Simulated sensor data
                Console.WriteLine();
                Console.WriteLine($"Pressure: {currentPressure}");
                Console.WriteLine($"Humidity: {currentHumidity}");
                Console.WriteLine($"Temperature: {currentTemperature}"); 
                Console.WriteLine();

                // Create JSON message
                Telemetry telemetryRow = new Telemetry();
                telemetryRow.DeviceId = "<Your Raspberry Pi Device Name>"; // i.e. raspberrypi-det-01
                telemetryRow.MessageId = 314;
                telemetryRow.CreatedDate = DateTime.UtcNow;
                telemetryRow.Temperature = Convert.ToDecimal(currentTemperature);
                telemetryRow.Humidity = Convert.ToDecimal(currentHumidity);
                telemetryRow.Pressure = Convert.ToDecimal(currentPressure);

                // Serialize sensor data to JSON format
                string messageString = JsonConvert.SerializeObject(telemetryRow);

                // Encode the characters into a sequence of bytes.
                var message = new Message(Encoding.ASCII.GetBytes(messageString));

                Console.WriteLine("=== Sending data to IoT Hub ==============================");

                // Send the telemetry message
                await s_deviceClient.SendEventAsync(message).ConfigureAwait(false);

                Console.WriteLine($"=== {DateTime.Now}, {messageString}");
                Console.WriteLine();

                // Wait 5 secs
                await Task.Delay(5000).ConfigureAwait(false);
            }
        }

        public class Telemetry
        {
            public string DeviceId { get; set; }
            public int MessageId { get; set; }
            public DateTime CreatedDate { get; set; }
            public decimal Temperature { get; set; }
            public decimal Humidity { get; set; }
            public decimal Pressure { get; set; }
        }


    }
}
