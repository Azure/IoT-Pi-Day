# Lab 0 - Resource Configuration
TBD - We need to document the scenario here

## Prerequisites
1.  Azure Subscription [Microsoft Azure Portal](https://portal.azure.com).

## Estimated time to complete
- TBD

## Download the Repo
The **Azure IoTPiDay Workshop** is setup to build out a real-life IoT scenario by capturing IoT data and ingesting it into the Azure Cloud.

- Open up a **Command Prompt** as an **Administrator**.
- Create a working area on the c: drive.
    - Type **CD C: root**. i.e c:\Workspace
- Open a browser and navigate to [github.com/Azure/IoT-Pi-Day](https://github.com/Azure/IoT-Pi-Day).
- Click the button **Clone or download**.
- Click **Download Zip**, **Save As** to Workspace folder.
- When download is complete, click **Open Folder**.
- **Right-Click** on **Iot-Pi-Day-master.zip**.
- Select **Extract All**, click **Extract** to default folder.

    ![Image](/images/settingupthelaptop-1.png)

## Create an Iot Hub

Use the following steps to create an Iot Hub:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

![Image](/images/lab-0-image1.png)

3. Click **Internet of Things** under Azure Marketplace.

3. Click **Iot Hub** from the list on the right. You see the first screen for creating an IoT hub.

![Image](/images/lab-0-image2.png)

4. Fill in the fields.
   * **Subscription**: Select the subscription to use for your IoT hub.
   * **Resource Group**: You can create a new resource group or use an existing one. To create a new one, click Create new and fill in the name you want to use. To use an existing resource group, click Use existing and select the resource group from the dropdown list.
   * **Region**: This is the region in which you want your hub to be located. Select the location closest to you from the dropdown list.
   * **IoT Hub Name**: Put in the name for your IoT Hub. This name must be globally unique. A recommendation is LastName-pi-day-IoT-Hub.

![Image](/images/lab-0-image3.png)

5. Click Next: Size and scale to continue creating your IoT hub.

![Image](/images/lab-0-image3.2.png)

6. On this screen, you can take the defaults and just click Review + create at the bottom.  
    * **Pricing and scale tier**: You can choose from several tiers depending on how many features you want and how many messages you send through your solution per day. The free tier is intended for testing and evaluation. It allows 500 devices to be connected to the IoT hub and up to 8,000 messages per day. Each Azure subscription can create one IoT Hub in the free tier.

![Image](/images/lab-0-image4.png)

7.  Click Review + create to review your choices. 

![Image](/images/lab-0-image5.png)


## Create an Event Hub namespace

Use the following steps to create an Event Hub Namespace:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

![Image](/images/lab-0-image1.png)

3. Click **Integration** under Azure Marketplace and click **See All**.

![Image](/images/lab-0-image10.png)

3. Click **Events Hubs**.

![Image](/images/lab-0-image11.png)

3. Click **Create** on the first screen for creating an Event Hub.

![Image](/images/lab-0-image12.png)

4. On the Create namespace page, fill in the fields adn click **Create**.
   * **Name** Enter a name for the namespace. Consider LastName-pi-day-Event-Hub.
   * **Pricing Tier** Choose the pricing tier (Basic or Standard).
   * **Subscription** Select the subscription in which you want to create the namespace.
   * **Resource Group** Select a location for the namespace.
    > Note: You may have to wait a few minutes for the system to fully provision the resources.

![Image](/images/lab-0-image13.png)

5. Refresh the Event Hubs page to see the event hub namespace. You can check the status of the event hub creation in the alerts. 

## Create an Event Hub

1. Select the namespace. You see the home page for your Event Hubs namespace in the portal.

![Image](/images/lab-0-image14.png)

2.  On the Event Hubs Namespace page, select **Event Hubs** in the left menu, then click **+ Event Hub**.

![Image](/images/lab-0-image16.png)

4.  Type a name for your event hub, then click **Create**.  Consider hubwaytelemetry as an Event Hub Name.

![Image](/images/lab-0-image17.png)

5.  You can check the status of the event hub creation in alerts.

![Image](/images/lab-0-image18.png)

## Create a CosmosDB Account

> Note:  If you already created your account, skip to the section **Add a Collection**.

Use the following steps to create an Azure Cosmos account:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

3. Select **Databases**, then **Azure Cosmos DB**.

![Image](/images/lab-0-image20.png)

4. On the **Create Azure Cosmos DB Account** page, enter the basic settings for the new Azure Cosmos DB account.
5. Select the Azure subscription that you want to use for this Azure Cosmos DB account.
6. Ener the **resource-group name**.
7. Enter an **Account Name** that is a unique name to identify your Azure Cosmos DB account. Consider LastName-pi-day-cosmosdb as an example.
8. Select **Core(SQL)** for document databases.
9. Select a geographic **Location** to host your Azure Cosmos DB account.
10. Select **Review+Create**.

![Image](/images/lab-0-image21.png)

11. Select **Create** on the Validate Success page.

![Image](/images/lab-0-image22.png)

![Image](/images/lab-0-image23.png)

<!--
## Add a Collection
You can now use the Data Explorer tool in the Azure portal to create a database and collection.

1.  Click on **Go to Resource** when deployment is complete.

![Image](/images/lab-0-image24.png)

2.  From the **Overview** tab, Click **Data Explorer**.

![Image](/images/lab-0-image25.png)

3. Click on **New Collection**.

![Image](/images/lab-0-image26.png)

4.  On the **Add Collection** page, enter the settings for the new collection.
   
5.  Enter **Hubway** as the name for the **Database Id**.
   
6.  Enter **Tripdata** as the name for **Collection Id**.
   
7.  Enter **/startstationid** as the **Partition key**.
   
8.  Change the **Throughput** to **400** request units per second (RU/s).
    > Note: If you want to reduce latency, you can scale up the throughput later.
   
9.  Click **OK**.

![Image](/images/lab-0-image27.png)
-->

## Create Favorites

1. Select All services in the left menu, and select star (*) next to Event Hubs in the Analytics category. Confirm that Event Hubs is added to FAVORITES in the left navigational menu.
2. Feel free to repeat this to make IoT Hub & CosmosDB a favorite.

![Image](/images/lab-0-image15.png)

## Reference Sites

[Azure-Portal](https://portal.azure.com/)

[Create-iot-hub]( https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-through-portal)

[IotHub-Documentation](https://docs.microsoft.com/en-us/azure/iot-hub/)

[Azure-Portal](https://portal.azure.com/)

[Tutorial: Build a .NET Core app to manage data stored in a SQL API account](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnetcore-get-started)

[.Net-Core-Tutorial](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnetcore-get-started)

[CosmosDB-Documentation](https://docs.microsoft.com/en-us/azure/cosmos-db/)

[CosmosDB-Introduction](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction)
