using Microsoft.Azure.WebJobs;
using Newtonsoft.Json.Linq;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;

namespace Company.function
{
    public static class HubwayEventHubTrigger
    {
        [FunctionName("HubwayEventHubTrigger")]
        public static void Run([EventHubTrigger("hubwaytelemetry", Connection = "Shared_Access_Key_EVENTHUB", ConsumerGroup = "hubwaycg")]string myEventHubMessage, [CosmosDB(databaseName: "Hubway",collectionName: "Tripdata",ConnectionStringSetting = "Shared_Access_Key_DOCUMENTDB")] out dynamic outputDocument, ILogger log)
        {
            log.LogInformation($"C# Event Hub trigger function processed a message: {myEventHubMessage}");
            
            dynamic msg = JObject.Parse(myEventHubMessage);

                outputDocument = new  {startTime = msg.GetValue("starttime").ToString(), 
                           stopTime = msg.GetValue("stoptime").ToString(),
                           tripDuration = msg.GetValue("tripduration").ToString(),
                           startStationID = msg.GetValue("start_station_id").ToString(),
                           startStationName = msg.GetValue("start_station_name").ToString(),
                           startStationLatitiude = msg.GetValue("start_station_latitude").ToString(),
                           startStationLongitude = msg.GetValue("start_station_longitude").ToString(),
                           endStationID = msg.GetValue("end_station_id").ToString(),
                           endStationName = msg.GetValue("end_station_name").ToString(),
                           endStationLatitude = msg.GetValue("end_station_latitude").ToString(),
                           endStationLongitude = msg.GetValue("end_station_longitude").ToString(),
                           bikeID = msg.GetValue("bikeid").ToString(),
                           userType = msg.GetValue("usertype").ToString(),
                           gender = msg.GetValue("gender").ToString()};

        }
    }
}
