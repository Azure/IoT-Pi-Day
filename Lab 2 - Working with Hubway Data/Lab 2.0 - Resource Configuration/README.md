# Lab 2.0 - Resource Configuration

In this lab, we are setting up the Azure components needed to complete all of the Lab 2.x sections.  This includes an Event Hub Namespace and Event Hub, an Azure CosmosDB account and collection, an Azure Map account and a storage account.  We will review what each of these components are for in subsequent labs.

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)


## Estimated time to complete
- 20 min

## Create an Event Hubs Namespace
In this section, you will be creating a Event Hubs Namespace. An Event Hubs namespace provides a unique scoping container, referenced by its fully qualified domain name, in which you create one or more event hubs.

Use the following steps to create an Event Hubs Namespace:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

3. In the **Search the Marketplace** textbox, type **Event** and press **Enter**.

    ![Image](/images/lab-2.0-image1.png)

4. Select **Event Hubs** from the list.

    ![Image](/images/lab-2.0-image2.png)

5. Click **Create** to create an Event Hub.

6. Fill in the fields.

    - **Name**, type in the name for your Event Hub Namespace. This name must be globally unique.
        - Type **<*lastname*>-piday-eventhub**.

    - **Pricing Tier**, choose the pricing tier **Standard**.

    - **Subscription**, select the subscription to use for your Event Hub.

    - **Resource Group**, choose the one created already, i.e. **<*lastname*>-piday-rg**.
   
    - **Location**, choose the same one you already selected.

        ![Image](/images/lab-2.0-image3.png)

   - Click **Create**.
  
    > You can watch the notification pane to validate that it created successfully.

## Create an Event Hub
In this section, we will be creating an Azure Event Hub. An Event Hub is a highly scalable publish-subscribe service that can ingest millions of events per second and stream them into multiple applications. This lets you process and analyze the massive amounts of data produced by your connected devices and applications.

After the Event Hub deployment is complete, navigate to the Event Hub Namespace.

1. In the left side menu, click on **Resource Groups**.
2. Select the resource group created previously. i.e. **<*lastname*>-piday-rg**.
3. Click on the **Event Hub Namespace** that was just created.

    ![Image](/images/lab-2.0-image4.png)

4. Click on **Event Hubs** in the left menu under **Entities**.
5. Click **+ Event Hub** to add a new Event Hub to this namespace.

    ![Image](/images/lab-2.0-image5.png)

6. Type **hubwaytelemetry** for the name for your event hub.

    ![Image](/images/lab-2.0-image6.png)

7. Click **Create**.

## Create a CosmosDB Account
In this section, we will be creating a CosmosDB account that we will use to store the data collected during the labs.

Use the following steps to create an Azure CosmosDB account:    

1. In the Azure portal click **+Create a resource** at the top left of the screen.

2. In the **Search the Marketplace** textbox, type **CosmosDB** and press **Enter**.

    ![Image](/images/lab-2.0-image7.png)

3. Select **Azure Cosmos DB** from the list.

    ![Image](/images/lab-2.0-image8.png)

4. Click **Create** to create a CosmosDB account.

5. Fill in the fields.

    - **Subscription**, select the subscription to use for your Azure Cosmos DB Account.

    - **Resource Group**, choose the one created already, i.e. **<*lastname*>-piday-rg**.

    - **Account Name**, type in the name for your Azure Cosmos DB Account. This name must be globally unique.
        - Type **<*lastname*>-piday-cosmosdb**.

    - **API**, select **Core(SQL)** for document databases.

    - **Location**, choose the same one you already selected.

    ![Image](/images/lab-2.0-image9.png)

6. Click **Review+Create**, then **Create** to create your Azure Cosmos DB Account.

    > You can watch the notification pane to validate that it created successfully.

## Add a Collection to CosmosDB
In this section we will be configuring the CosmosDB so that we can add data to it. You can now use the Data Explorer tool in the Azure portal to create a database and collection.

After the CosmosDB deployment is complete, navigate to the Cosmos DB Account.

1. In the left side menu, click on **Resource Groups**.
2. Select the resource group created previously. i.e. **<*lastname*>-piday-rg**.
3. Click on the Cosmos DB Account created earlier, i.e. **<*lastname*>-piday-cosmosdb**.

    ![Image](/images/lab-2.0-image10.png)

4. From the **Overview** tab, click **Data Explorer**.
5. Click on **New Collection**.

    ![Image](/images/lab-2.0-image11.png)

6. On the **Add Collection** page, enter the settings for the new collection.
    - Select **Create New**, and enter **Hubway** for **Database Id**.

    - Enter **Tripdata** as the name for **Collection Id**.

    - Enter **/startstationid** as the **Partition key**.

    - Change the **Throughput** to **400** request units per second (RU/s).
        > Note: If you want to reduce latency, you can scale up the throughput later.

    ![Image](/images/lab-2.0-image12.png)

7.  Click **OK**.

    > You can watch the notification pane to validate that it created successfully.

## Create an Azure Map Account
Azure Maps is a portfolio of geospatial services that include service APIs for Maps, Search, Routing, Traffic and Time Zones. We will be using Azure Maps for visualization of the data in one of the labs. In this section, you will create the Azure Map component so we can use it later.

Use the following steps to create an Azure Map:    

1. In the Azure portal click **+Create a resource** at the top left of the screen.

2. In the **Search the Marketplace** textbox, type **Azure Maps** and press **Enter**.

    ![Image](/images/lab-2.0-image13.png)

3. Select **Maps** from the list.

    ![Image](/images/lab-2.0-image14.png)

4. Click **Create** to create a Maps Account.

5. Fill in the fields.

    - **Subscription**, select the subscription to use for your Azure Maps Account.

    - **Resource Group**, choose the one created already, i.e. **<*lastname*>-piday-rg**.

    - **Name**, type in the name for your Azure Maps Account. This name must be globally unique.
        - Type **<*lastname*>-piday-azuremaps**.

    - **Pricing Tier**, select **Standard S0**.

    - Check the box **I confirm...**.

        ![Image](/images/lab-2.0-image15.png)

    - Select **Review+Create**, then **Create**.

    > You can watch the notification pane to validate that it created successfully.

## Create the Storage Account

Use the following steps to create a Storage Account:    

1. In the Azure portal click **+Create a resource** at the top left of the screen.

2. In the **Search the Marketplace** textbox, type **Storage** and press **Enter**.

    ![Image](/images/lab-2.0-image16.png)

3. Select **Storage Account** from the list.

    ![Image](/images/lab-2.0-image17.png)

4. Click **Create** to create a Storage Account.

5. Fill in the fields.

    - **Subscription**, select the subscription to use for your Storage Account.

    - **Resource Group**, choose the one created already, i.e. **<*lastname*>-piday-rg**.

    - **Storage Account Name**, type in the name for your Storage Account. This name must be globally unique, type **<*lastname*>pidaydatastorage**.

        > Name can only be lowercase letters and numbers, no special chars, no caps.

    - **Location**, choose the same one you already selected.

   - **Performance**, select **Standard**.

   - **Account Kind**, select **StorageV2 (general purpose v2)**.

   - **For Replication**, select **locally-redundant storage (LRS)**.

   - **Access tier**, select **Hot**.

    ![Image](/images/lab-2.0-image18.png) 

6. Select **Review + Create**, then **Create** to create Storage Account.

    > You can watch the notification pane to validate that it created successfully.

## Validate Your Resources
During this lab, you should have placed all items in a single resource group. We did this so that you can easily access all of your resources and so that you can manage them as a group.

1. In the left side menu, click on **Resource Groups**.
2. Select the resource group created previously. i.e. **<*lastname*>-piday-rg**.

    > This will show you all the resources you created that you will use throughout the day.
    
    ![Image](/images/lab-2.0-image20.png)

## Reference Sites

[Azure-Portal](https://portal.azure.com/)

[Create-iot-hub]( https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-through-portal)

[IotHub-Documentation](https://docs.microsoft.com/en-us/azure/iot-hub/)

[Azure-Portal](https://portal.azure.com/)

[Tutorial: Build a .NET Core app to manage data stored in a SQL API account](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnetcore-get-started)

[.Net-Core-Tutorial](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnetcore-get-started)

[CosmosDB-Documentation](https://docs.microsoft.com/en-us/azure/cosmos-db/)

[CosmosDB-Introduction](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction)
