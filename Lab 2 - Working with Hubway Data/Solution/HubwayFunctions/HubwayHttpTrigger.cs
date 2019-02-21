using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System;

namespace Company.Function
{
    public static class HubwayHttpTrigger
    {
        [FunctionName("HubwayHttpTrigger")]
        //public static IActionResult Run(
            public static TripDataGeoJson Run(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", "post",  Route = null)]HttpRequest req,
            [CosmosDB(
                databaseName: "Hubway",
                collectionName: "Tripdata",
                ConnectionStringSetting = "Shared_Access_Key_DOCUMENTDB",
                SqlQuery = "SELECT * FROM c order by c.startStationID")]
                IEnumerable<TripItems> tripItems,
            ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");

            // based on http://geojson.org/
            // https://tools.ietf.org/html/rfc7946#section-1.3

            // return GeoJson object
            TripDataGeoJson tdGeoJson = new TripDataGeoJson();

            // create the list of features            
            tdGeoJson.features = new List<LocalFeatures>();

            LocalFeatures myFeatures = null;

            string sStartStationName = null;
            double dStartStationLatitiude = 0.0;
            double dStartStationLongitude = 0.0;

            string sCurrentStationID = null;
            string sLastStationID = null;
            int iCounter = 1;
            
            // process each item in the list
            foreach (var doc in tripItems)
            {
                // grab the stationID from the list
                sCurrentStationID = doc.startStationID;

                //compare station ID's
                if ( sCurrentStationID == sLastStationID )
                {
                    // they are in the same array
                    //log.LogInformation("Station id's match: "+ sCurrentStationID );

                    // increment the counter
                    iCounter += 1;
                }
                else
                {
                    // they do not match
                    //log.LogInformation("Station id's do NOT match: "+ sCurrentStationID );

                   // create the Properties object
                   Properties prop = new Properties();
                   prop.numberOfStations = iCounter;
                   prop.startStationID = sLastStationID;
                   prop.startStationName = sStartStationName;

                   LocalGeometry geo = new LocalGeometry();
                   geo.coordinates = new List<double>();
                   geo.coordinates.Add(dStartStationLongitude);
                   geo.coordinates.Add(dStartStationLatitiude);

                   myFeatures = new LocalFeatures();
                   myFeatures.properties = prop;
                   myFeatures.geometry = geo;

                   tdGeoJson.features.Add(myFeatures);
                                       
                    // reset the counter
                    iCounter = 1;

                }

                // set for comparison
                sLastStationID  = doc.startStationID;
                sStartStationName = doc.startStationName;
                dStartStationLatitiude = Convert.ToDouble(doc.startStationLatitiude);
                dStartStationLongitude = Convert.ToDouble(doc.startStationLongitude);
                
            }

            // remove the first record -- null references first time thru loop
            tdGeoJson.features.RemoveAt(0);

            return tdGeoJson;
        }
    }

    public class TripItems
    {
     
       public string startStationID{ get; set; }
       public string startStationName{ get; set; }

        public string startStationLatitiude{ get; set; }

        public string startStationLongitude{ get; set; }

    }    

    public class LocalGeometry
    {
        private string _type = "Point";

        public string type 
        { 
            get { return _type; }
        }
        public List<double> coordinates { get; set; }
    }

    public class Properties
    {
        public int numberOfStations{ get; set; }

        public string startStationID{ get; set; }
        public string startStationName{ get; set; }
    }

    public class LocalFeatures
    {
        private string _type = "Feature";

        public string type 
        { 
            get { return _type; }
        }
        public Properties properties { get; set; }
        public LocalGeometry geometry { get; set; }

    }

    public class TripDataGeoJson
    {
        private string _type = "FeatureCollection";

        public string type 
        { 
            get { return _type; }
        }
        public List<LocalFeatures> features { get; set; }
    }    
}
