using System;
using Microsoft.Azure.Devices.Client;
using Newtonsoft.Json;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.IO;
using System.Globalization;
using ChoETL;
//using Sense.RTIMU;

namespace simulated_device
{
    class SimulatedDevice
    {
        private static DeviceClient s_deviceClient;

        // The device connection string to authenticate the device with your IoT hub.
        private readonly static string s_connectionString = "<Your IoT Hub Connnection String>";

        // Async method to send simulated telemetry
        private static async void SendDeviceToCloudMessagesAsync()
        {
            string dirPath = Path.GetFullPath(Directory.GetCurrentDirectory());
            string sFilePath = dirPath+"/data/201502-hubway-tripdata.csv";

            Console.WriteLine( sFilePath ); 

            var reader = new ChoCSVReader(sFilePath).WithFirstLineHeader();
            dynamic rec;
 
            while ((rec = reader.Read()) != null)
            {
                string json = Newtonsoft.Json.JsonConvert.SerializeObject(rec);
                //Console.WriteLine(json);

                var message = new Message(Encoding.ASCII.GetBytes(json));

                // Add a custom application property to the message.
                // An IoT hub can filter on these properties without access to the message body.
                message.Properties.Add("RoutingProperty", "Hubway");

                // Send the telemetry message
                await s_deviceClient.SendEventAsync(message);
                Console.WriteLine("{0} > Sending message: {1}", DateTime.Now, json);                

                await Task.Delay(1000);
            }
        }

        private static void Main(string[] args)
        {
            Console.WriteLine("Boston Hubway Data - Simulated device. Ctrl-C to exit.\n");

            // Connect to the IoT hub using the MQTT protocol
            s_deviceClient = DeviceClient.CreateFromConnectionString(s_connectionString, TransportType.Mqtt);
            SendDeviceToCloudMessagesAsync();
            Console.ReadLine();
        }
    }
}
