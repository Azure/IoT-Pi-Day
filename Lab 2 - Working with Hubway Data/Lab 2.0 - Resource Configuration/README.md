# Lab 2.0 - Resource Configuration
TBD - We need to document the scenario here

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)


## Estimated time to complete
- TBD

## Create an Event Hub namespace

Use the following steps to create an Event Hub Namespace:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

    ![Image](/images/lab-0-image1.png)

3. Click **Integration** under Azure Marketplace and click **See All**.

    ![Image](/images/lab-0-image10.png)

4. Click **Events Hubs**.

    ![Image](/images/lab-0-image11.png)

5. Click **Create** on the first screen for creating an Event Hub.

    ![Image](/images/lab-0-image12.png)

6. On the Create namespace page, fill in the fields.
   * **Name** Enter a name for the namespace. Consider **LastName-pi-day-EventHub**.
   * **Pricing Tier** Choose the pricing tier **Standard**.
   * **Subscription** Select the subscription in which you want to create the namespace.
   * **Resource Group**, select previously created resource group name, **<*lastname*>-piday-rg**.
   * **Location**, select **East US** for your location.
    > Note: You may have to wait a few minutes for the system to fully provision the resources.

    ![Image](/images/lab-0-image13.png)

7. Click **Create** to create an Event Hub.

8. Refresh the Event Hubs page to see the event hub namespace. You can check the status of the event hub creation in the alerts. 

## Create an Event Hub

1. Select the namespace. You see the home page for your Event Hubs namespace in the portal.

    ![Image](/images/lab-0-image14.png)

2.  On the Event Hubs Namespace page, select **Event Hubs** in the left menu, then click **+ Event Hub**.

    ![Image](/images/lab-0-image16.png)

3.  Type a name for your event hub, then click **Create**.  Consider **hubwaytelemetry** as an Event Hub Name.

    ![Image](/images/lab-0-image17.png)

4.  You can check the status of the event hub creation in alerts.

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
6. **Resource Group**, select previously created resource group name, **<*lastname*>-piday-rg**.
7. The Account Name must be a globally unique name to identify your Azure Cosmos DB account, type **<*lastname*>-piday-cosmosdb**.
8. Select **Core(SQL)** for document databases.
9. For the location, select **East US** to host your Azure Cosmos DB account
10. Select **Review+Create**.

    ![Image](/images/lab-0-image21.png)

11. Select **Create** on the Validate Success page.

    ![Image](/images/lab-0-image22.png)

    ![Image](/images/lab-0-image23.png)

## Add a Collection to CosmosDB
You can now use the Data Explorer tool in the Azure portal to create a database and collection.

1. From the Azure Portal menu, select **Azure CosmosDB**.
2. Select your CosmosDB account created earlier, **<*lastname*>-piday-cosmosdb**, from the list.

    ![Image](/images/lab-2.4-image1.png)

3.  From the **Overview** tab, Click **Data Explorer**.

    ![Image](/images/lab-2.4-image2.png)

3. Click on **New Collection**.
4. On the **Add Collection** page, enter the settings for the new collection.
    - Enter **Hubway** as the name for the **Database Id**.
    - Enter **Tripdata** as the name for **Collection Id**.
    - Enter **/startstationid** as the **Partition key**.
    - Change the **Throughput** to **400** request units per second (RU/s).
        > Note: If you want to reduce latency, you can scale up the throughput later.
9.  Click **OK**.

    ![Image](/images/lab-2.4-image3.png)

## Create an Azure Map

Use the following steps to create an Azure Map:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).
2. In the Azure portal click **+Create a resource** at the top left of the screen.
3. Click **Internet of Things** under Azure Marketplace and click **See All**.

    ![Image](/images/lab-0-image30.png)

4. Under **Data analytics and Visualizations**, click **More**.
5. Click **Maps** from the list on the right, click **Create**.

    ![Image](/images/lab-0-image31.png)

6. On the **Create Azure Maps Account** page, enter the basic settings for the new Azure Maps account.
7. Select the **Azure subscription** that you want to use.
8. **Resource Group**, select previously created resource group name, **<*lastname*>-piday-rg**.
9. The **Account Name** must be a globally unique name to identify your Azure Maps account, type **<*lastname*>-piday-azuremaps**
10. Select **Standard S0** for pricing tier.
11. Check the box **I confirm...**.
12. Select **Review+Create**.
13. Select **Create**.

    ![Image](/images/lab-0-image32.png)

## Create the Storage Account

Use the following steps to create a Storage Account:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

3. Click **Storage** under Azure Marketplace.

4. Click **Storage Account** from the list on the right. You will see the first screen for creating a Storage Account.

    ![Image](/images/lab-2.6-image1.png)

5. On the **Create Storage Account** page, fill in the fields:
   - **Subscription** Select your subscription.
8. **Resource Group**, select previously created resource group name, **<*lastname*>-piday-rg**.
   - The **Storage Account Name** must be a globally unique name for your storage account type **<*lastname*>pidayhubwaydatastorage**
   - For Location, select **East US**.
   - For Performance, select **Standard**.
   - For Account Kind select **StorageV2 (general purpose v2)**.
   - For Replication, select **locally-redundant storage (LRS)**.
   - For Access tier, select **Hot**.

    ![Image](/images/lab-2.6-image2.png) 

6. Select **Review + Create**.
7. Select **Create**.
8. Click **Go to resource** when the deployment is complete.

    ![Image](/images/lab-2.6-image3.png)

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
