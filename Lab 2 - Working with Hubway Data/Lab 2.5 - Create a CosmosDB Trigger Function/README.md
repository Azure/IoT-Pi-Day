# Lab 2.5 - Update the CosmosDB Trigger Function

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)
2. The Resource Configuation Lab is completed, see [Lab 2.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.0%20-%20Resource%20Configuration)
3. Completion of Lab 2.1 through 2.4 must be done.

## Develop the CosmosDBTrigger Function code

🚨 In this section, we will use a CosmosDB trigger function to respond to an event everytime a ??? We will be using Visual Studio Code and the Azure Functions Extension.

<!--
1. From **Visual Studio Code**, press **Ctrl-Shift-P**.
2. Enter **Azure Functions** and select **Create Function** from the list.

    ![Image](/images/lab-2.5-image1.png) 

3. Select the folder containting your function app, **HubwayFunctions**.

    ![Image](/images/lab-2.5-image2.png) 

4. Select a function Template and select **All**.

    ![Image](/images/lab-2.5-image3.png) 
    ![Image](/images/lab-2.5-image4.png) 

5. Select **CosmosDBTrigger**

    ![Image](/images/lab-2.5-image5.png) 

6. Change the name from CosmosDBTriggerCSharp to **HubwayCosmosDBTrigger**.

    ![Image](/images/lab-2.5-image6.png) 

7. Select the default namespace **Company.Function**.

    ![Image](/images/lab-2.5-image7.png)

8.  Select an App Setting for your Event Hub:
    - Select **+ New App Setting**.
    - Enter the key **Hubway_COSMOSDB** for your Event Hub key and press **Enter**
    
    ![Image](/images/lab-2.5-image8.png)

9.  Enter the name of the **CosmosDB Account** you created in **Lab 2.4**.
    > i.e. **<**LastName**>-pi-day-functionapp**.

    ![Image](/images/lab-2.5-image9.png)

11. Enter the **database name** you created in **Lab 2.4**.
    > i.e. **Hubway**.

    ![Image](/images/lab-2.5-image10.png)

10. Enter the **collection name** you created in **Lab 2.4**.
    > i.e. **Tripdata**.

    ![Image](/images/lab-2.5-image11.png)

-->

The body of the code is used to map the incoming JSON string to an output document for inserting into CosmosDB.

1. Navigate to the resource group.

    - From the Azure Portal from the left menu, click on **Resource Groups**.
    - Select the resource group created previously, i.e. **<*lastname*>-piday-rg**.
    - Click on the Azure Maps Account created earlier, i.e. **<*lastname*>-piday-azuremaps**.

        ![Image](/images/lab-0-imagex.png)

2. Copy the **Azure Maps Subscription Key** connection string.

    - Under **Settings**, click on **Authentication**.
    - Under **Shared Key Authentication**, copy the **Primary Key**.

        ![Image](/images/lab-2.5-imagex.png)

3. Update the **Azure Maps Subscription Key** connection string.

    - Confirm you have the project **HubwayFunctions.csproj** opened in Visual Studio Code.
    - From **Visual Studio Code**, double-click on the file **HubwayCosmosDBTrigger.cs** in the editor to open it.

        ![Image](/images/lab-2.3-imagex.png)

    - Scroll down and to the right and highlight **Subscription-Key**

        ![Image](/images/lab-2.5-image19.png)

    - **Paste** in your **Subscription-Key** with your **Azure Maps Subscription Key**.

        ![Image](/images/lab-2.5-image20.png) 

    - Press **Ctrl-S** to save the file.

## Deploy your Function App Project

1. From Visual Studio Code, press **Ctrl-Shift-P**, enter **Azure Functions** and select **Deploy to Function App**.

    ![Image](/images/lab-2.3-imagex.png) 
 
2. Select the **Function App name** created in the above section **Create a function app from the Azure portal**.
    > i.e. **<**lastname**>-piday-functionapp**.

    ![Image](/images/lab-2.5-image23.png) 

3. For the message **Are you sure...**, click **Deploy**.

    ![Image](/images/lab-2.5-image24.png)

4. After a successful deployment, click **Stream Logs**.

    ![Image](/images/lab-2.5-image25.png)

5. If everything worked, you will see the following in the Visual Studio Code output window.

    ![Image](/images/lab-2.5-image26.png)


## Reference Sites

[How to Create a Function App using the Azure Portal][Create-FunctionApp]

[Azure Functions Documentation][Functions-Documentation]

[Triggers and Bindings Concepts][Triggers-Bindings]

[Event Hub Trigger][EventHubTrigger]

[CosmosDB Binding][CosmosDB-Binding]

[Azure-Portal]: https://portal.azure.com/ 

[Create-FunctionApp]: https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-function-app-portal

[Functions-Documentation]: https://docs.microsoft.com/en-us/azure/azure-functions/

[Triggers-Bindings]: 
https://docs.microsoft.com/en-us/azure/azure-functions/functions-triggers-bindings

[EventHubTrigger]: 
https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-event-hubs

[CosmosDB-Binding]: 
https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-cosmosdb-v2
