# Lab 2.7.1 - Create the HTTP Trigger Function

## Prerequisites
1. The CosmosDB Account must already be created, see [Lab 0 - Resource Configuration, section Create a CosmosDB Account](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-a-cosmosdb-account)
2. Lab 2.4 is completed, see [Lab 2.4 - Setting up CosmosDB](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.4%20-%20Setting%20up%20CosmosDB)

## Create the HTTPTrigger Function

From within Visual Studio Code:

1. From **Visual Studio Code**, press **Ctrl-Shift-P**.
2. Enter **Azure Functions** and select **Create Function** from the list.

    ![Image](/images/lab-2.7.1-image1.png) 

3. Select the folder containting your function app, **HubwayFunctions**.

    ![Image](/images/lab-2.7.1-image2.png) 

4. Select **HttpTrigger**

    ![Image](/images/lab-2.7.1-image3.png) 

5. Change the name from HttpTriggerCSharp to **HubwayHTTPTrigger**.

    ![Image](/images/lab-2.7.1-image4.png) 

6. Select the default namespace **Company.Function**.

    ![Image](/images/lab-2.7.1-image5.png)

7.  Set the access rights to **Anonymous**.

    ![Image](/images/lab-2.7.1-image6.png)

## Update the code with CosmosDB bindings


## Update the code Azure Maps
1. Update the code from the solution.
2. Open **HubwayHTTPTrigger.cs**, if it's not already opened.

    ![Image](/images/lab-2.7.1-image7.png)

## Explaination of what's about to change

Need to point out 2 things before updating this code; Return value and Input bindings for this function.  Scroll down and notice the following two things.

3. The original function **Return Value** is returning a **Static Task**, this will change.

![Image](/images/lab-2.7.1-image10.png)

4. The original function **Input Bindings** is empty, this will change.

![Image](/images/lab-2.7.1-image11.png) 

5. Using the files icon, navigate to the **solution** folder and open the file **HubwayHttpTrigger.cs**.
6. Press "Ctrl+A** to hightlight all the code, then **copy** to the clipboard.
7. Select the **HubwayHttpTrigger.cs** file that was just created.
8. Press **Ctrl+A** to hightlight all the code, then **paste** from the clipboard.

    ![Image](/images/lab-2.7.1-image7.5.png)

9. The function's **Return Value** is now returning a **Static Geo Object** formatted to [GeoJSON](http://geojson.org/).

![Image](/images/lab-2.7.1-image12.png) 

10. The function's **Input Bindings** is reading the data from **CosmosDB** from the **TripData** collection.
    > Notice that **tripItems** is populated from CosmosDB.

![Image](/images/lab-2.7.1-image13.png) 

> For reference, refer to the file **HubwayHttpTrigger.cs** found under the [Lab 2 - Working with Hubway Data/Solution](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Solution/HubwayFunctions) folder.


11. Replace the ConnectionStringSetting = "**Shared_Access_Key_DOCUMENTDB**" with your CosmosDB connection string you created in **Lab 2.???**.

    > i.e. **<**LastName**>-pi-day-CosmosDB_DOCUMENTDB**.


## 🚨 Content below this line is Under Construction 🚨



    * In the Azure Portal, navigate to your CosmosDB Account
    * Select the Keys menu item
    * Copy the PRIMARY READ-ONLY KEY from the Read-Only Keys tab


3.  🚨 Update your Azure Maps Subscription Key
    * From the Azure Portal, navigate to your Maps Deployment --> Map Service
    * Select the Authentication menu item on the left
    * Copy the Primary Key
    * Replace with your key atlas.setSubscriptionKey('Azure Maps subscription');

    > For reference, refer to the file **HubwayHttpTrigger.cs** found under the [Lab 2 - Working with Hubway Data/Solution](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Solution/HubwayFunctions) folder.

4.  Review the code.

## Deploy the Function App

From within Visual Studio Code:

1.  Press Control Shift P
2.  Type Azure Functions
3.  Select Deploy to Function App
4.  Choose Deploy if prompted


