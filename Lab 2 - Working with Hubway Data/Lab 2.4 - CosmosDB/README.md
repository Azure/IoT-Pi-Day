# Lab 2.4 - Setting up CosmosDB
We need to document the scenario here


## Prerequisites
Document here

## Create a CosmosDB Account

Note:  If you already created your account, skip to the section Add a Collection

Use the following steps to create an Azure Cosmos account:    

1. In a new browser window, sign in to the [Azure Portal][Azure-Portal].

2. Select Create a resource > Databases > Azure Cosmos DB.
   
3. On the Create Azure Cosmos DB Account page, enter the basic settings for the new Azure Cosmos DB account.
4. Select the Azure subscription that you want to use for this Azure Cosmos DB account.
5. Ener the resource-group name.
6. Enter a unique name to identify your Azure Cosmos DB account. Consider LastName-pi-day-cosmosdb as an example.
7. Select Core(SQL) for document databases.
8. Select a geographic location to host your Azure Cosmos DB account.
9. Select Review+Create. 

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

<!--
## Add a Collection
You can now use the Data Explorer tool in the Azure portal to create a database and collection.

1.  Click Data Explorer > New Collection.
   
2.  The Add Collection area is displayed on the far right, you may need to scroll right to see it.

3.  In the Add collection page, enter the settings for the new collection.
   
4.  Enter Hubway as the name for the new database.
   
5.  Enter Tripdata as the name for your new collection.
   
6.  Enter the partition key /startstationid.
   
7.  Change the throughput to 400 request units per second (RU/s). If you want to reduce latency, you can scale up the throughput later.
   
8.  Click OK.
-->

## Reference Sites

[CosmosDB Introduction][CosmosDB-Introduction]

[CosmosDB Documentation][CosmosDB-Documentation]

[.Net Core Tutorial][.Net-Core-Tutorial]


[Azure-Portal]: https://portal.azure.com/ 

[.Net-Core-Tutorial]: https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnetcore-get-started

[CosmosDB-Documentation]: https://docs.microsoft.com/en-us/azure/cosmos-db/

[CosmosDB-Introduction]: https://docs.microsoft.com/en-us/azure/cosmos-db/introduction
