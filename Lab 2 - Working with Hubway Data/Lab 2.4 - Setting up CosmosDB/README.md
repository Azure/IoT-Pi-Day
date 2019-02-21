# Lab 2.4 - Setting up CosmosDB
We need to document the scenario here

## Prerequisites
- The CosmosDB Account must already be created, see [Lab 0 - Resource Configuration, section Create a CosmosDB Account](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-a-cosmosdb-account)

## Estimated time to complete
- TBD

## Add a Collection
You can now use the Data Explorer tool in the Azure portal to create a database and collection.

1. From the Azure Portal menu, select **Azure CosmosDB**.
2. Select your CosmosDB account created earlier.
    - i.e. **<**Lastname**>-pi-day-cosmosdb** from the list.

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

## Reference Sites

[CosmosDB Introduction][CosmosDB-Introduction]

[CosmosDB Documentation][CosmosDB-Documentation]

[.Net Core Tutorial][.Net-Core-Tutorial]


[Azure-Portal]: https://portal.azure.com/ 

[.Net-Core-Tutorial]: https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnetcore-get-started

[CosmosDB-Documentation]: https://docs.microsoft.com/en-us/azure/cosmos-db/

[CosmosDB-Introduction]: https://docs.microsoft.com/en-us/azure/cosmos-db/introduction
