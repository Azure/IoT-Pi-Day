# Lab 2.0 - Resource Configuration
TBD - We need to document the scenario here

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)


## Estimated time to complete
- 20 min

## Create an Event Hub Namespace
In this section, you will be creating a Event Hubs Namespace. An Event Hubs namespace provides a unique scoping container, referenced by its fully qualified domain name, in which you create one or more event hubs.

Use the following steps to create an Event Hub Namespace:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

3. In the **Search the Marketplace** textbox, type **Event Hubs** and press **Enter**.

    ![Image](/images/lab-0-imagex.png)

3. Select **Event Hubs** from the list.
4. Click **Create** to create a IoT Hhub.

    ![Image](/images/lab-0-imagex.png)

4. Fill in the fields.

   - **Name**, type in the name for your Event Hub Namespace. This name must be globally unique, type **<*lastname*>-piday-eventhub**.

    - **Pricing Tier**, choose the pricing tier **Basic**.

  - **Subscription**, select the subscription to use for your Event Hub.

   - **Resource Group**, choose the one created already, i.e. **<*lastname*>-piday-rg**.
   
   - **Region**, choose the same one you already selected.

![Image](/images/lab-0-imagex.png)

   - Click **Create**.
  
   - Refresh the Event Hubs page to see the event hub namespace. You can check the status of the event hub creation in the alerts. 

## Create an Event Hub
In this section, we will be creating an Azure Event Hub. An Event Hub is a highly scalable publish-subscribe service that can ingest millions of events per second and stream them into multiple applications. This lets you process and analyze the massive amounts of data produced by your connected devices and applications.

After the Event Hub deployment is complete, navigate to the Event Hub Namespace.

1. In the left side menu, click on **Resource Groups**.
2. Select the resource group created previously. i.e. **<*lastname*>-piday-rg**.
3. Click on the Event Hub Namespace that was just created.

    ![Image](/images/lab-0-imagex.png)

4. Click on **Event Hubs** in the left menu under Entities
5. Click **+ Event Hub** to add a new Event Hub to this namespace.
<!--4. Click on the **Refresh** button to refresh the Event Hubs page to see the event hub namespace. -->

6. Type **hubwaytelemetry** for the name for your event hub.
7. Click **Create**.

    ![Image](/images/lab-0-image17.png)

## Create a CosmosDB Account
In this section, we will be creating a CosmosDB account that we will use to store the data collected during the labs.

> Note:  If you already created your account, skip to the section **Add a Collection**.

Use the following steps to create an Azure Cosmos account:    

1. In the **Search the Marketplace** textbox, type **CosmosDB** and press **Enter**.

    ![Image](/images/lab-0-imagex.png)

2. Select **Azure Cosmos DB** from the list.
3. Click **Create** to create a IoT Hhub.

    ![Image](/images/lab-0-imagex.png)

4. Fill in the fields.

    - **Subscription**, select the subscription to use for your Azure Cosmos DB Account.

    - **Resource Group**, choose the one created already, i.e. **<*lastname*>-piday-rg**.

    - **Account Name**, type in the name for your Azure Cosmos DB Account. This name must be globally unique, type **<*lastname*>-piday-cosmosdb**.

    - **API**, select **Core(SQL)** for document databases.

    - **Location**, choose the same one you already selected.

5. Click **Review+Create**, then **Create** to create your Azure Cosmos DB Account.

    > This may take a few minutes for deployment to finish.

## Add a Collection to CosmosDB
In this section we will be configuring the CosmosDB so that we can add data to it. You can now use the Data Explorer tool in the Azure portal to create a database and collection.

After the CosmosDB deployment is complete, navigate to the Cosmos DB Account.

1. In the left side menu, click on **Resource Groups**.
2. Select the resource group created previously. i.e. **<*lastname*>-piday-rg**.
3. Click on the Cosmos DB Account that was just created, i.e. **<*lastname*>-piday-cosmosdb**.

    ![Image](/images/lab-0-imagex.png)

4. From the **Overview** tab, Click **Data Explorer**.

    ![Image](/images/lab-2.4-image2.png)

5. Click on **New Collection**.
6. On the **Add Collection** page, enter the settings for the new collection.
    - Enter **Hubway** as the name for the **Database Id**.

    - Enter **Tripdata** as the name for **Collection Id**.

    - Enter **/startstationid** as the **Partition key**.

    - Change the **Throughput** to **400** request units per second (RU/s).
        > Note: If you want to reduce latency, you can scale up the throughput later.

    ![Image](/images/lab-2.4-image3.png)

7.  Click **OK**.

    > You can watch the notification pane to validate that it created successfully.

## Create an Azure Map
Azure Maps is a portfolio of geospatial services that include service APIs for Maps, Search, Routing, Traffic and Time Zones. We will be using Azure Maps for visualization of the data in one of the labs. In this section, you will create the Azure Map component so we can use it later.

Use the following steps to create an Azure Map:    

1. In the **Search the Marketplace** textbox, type **Azure Maps** and press **Enter**.

    ![Image](/images/lab-0-imagex.png)

2. Select **Maps** from the list.
3. Click **Create** to create a IoT Hhub.

    ![Image](/images/lab-0-imagex.png)

4. Fill in the fields.

    - **Subscription**, select the subscription to use for your Azure Maps Account.

    - **Resource Group**, choose the one created already, i.e. **<*lastname*>-piday-rg**.

    - **Name**, type in the name for your Azure Maps Account. This name must be globally unique, type **<*lastname*>-piday-azuremaps**.

    - **Pricing Tier**, select **Standard S0**.

    - Check the box **I confirm...**.

    - Select **Review+Create**.

    - Select **Create**.

    ![Image](/images/lab-0-image32.png)

    > You can watch the notification pane to validate that it created successfully.

## Create the Storage Account

Use the following steps to create a Storage Account:    

1. In the **Search the Marketplace** textbox, type **Storage** and press **Enter**.

    ![Image](/images/lab-0-imagex.png)

2. Select **Storage Account** from the list.
3. Click **Create** to create a Storage Account.

    ![Image](/images/lab-0-imagex.png)

4. Fill in the fields.

    - **Subscription**, select the subscription to use for your Storage Account.

    - **Resource Group**, choose the one created already, i.e. **<*lastname*>-piday-rg**.

    - **Storage Account Name**, type in the name for your Storage Account. This name must be globally unique, type **<*lastname*>pidaydatastorage**.

        > Name can only be lowercase letters and numbers, no special chars, no caps.

    - **Location**, choose the same one you already selected.

   - **Performance**, select **Standard**.

   - **Account Kind**, select **StorageV2 (general purpose v2)**.

   - **For Replication**, select **locally-redundant storage (LRS)**.

   - **Access tier**, select **Hot**.

    ![Image](/images/lab-2.6-image2.png) 

6. Select **Review + Create**, then **Create** to create Storage Account.

    > You can watch the notification pane to validate that it created successfully.

## Validate Your Resources
During this lab, you should have placed all items in a single resource group. We did this so that you can easily access all of your resources and so that you can manage them as a group.

1. In the left side menu, click on **Resource Groups**.
2. Select the resource group created previously. i.e. **<*lastname*>-piday-rg**.

    > This will show you all the resources you created that you will use through the day.
    
    ![Image](/images/lab-0-imagex.png)

## Reference Sites

[Azure-Portal](https://portal.azure.com/)

[Create-iot-hub]( https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-through-portal)

[IotHub-Documentation](https://docs.microsoft.com/en-us/azure/iot-hub/)

[Azure-Portal](https://portal.azure.com/)

[Tutorial: Build a .NET Core app to manage data stored in a SQL API account](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnetcore-get-started)

[.Net-Core-Tutorial](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnetcore-get-started)

[CosmosDB-Documentation](https://docs.microsoft.com/en-us/azure/cosmos-db/)

[CosmosDB-Introduction](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction)
