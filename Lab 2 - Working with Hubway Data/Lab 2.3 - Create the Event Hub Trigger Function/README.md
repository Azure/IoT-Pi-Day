# Lab 2.3 - Create a Function App and Event Hub Trigger Function
We need to document the scenario here

## Prerequisites
1. The Event Hub Namespace must already be created, see [Lab 0 - Resource Configuration, section Create an Event Hub namespace](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-an-event-hub-namespace)
2. The Event Hub must already be creaated, see [Lab 0 - Resource Configuration, section Create an Event Hub](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-an-event-hub-namespace)
3. The CosmosDB Account must already be created, see [Lab 0 - Resource Configuration, section Create a CosmosDB Account](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-a-cosmosdb-account)
4. The Laptop is setup correctly, see [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).

## Create a function app from the Azure portal

Use the following steps to create an Azure Function:    
1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

1. In a new browser window, sign in to the [Azure Portal][Azure-Portal].

2. Click **+ Create a resource**.
3. Click **Compute**.
3. Select **Function App** on the right panel.

    ![Image](/images/lab-2.3-image1.png)

<!-- Randy left off HERE -->

4. Fill in the fields:
   - **App name**, enter **<**LastName**>-pi-day-functionapp**
   - **Subscription**  Select your subscription.
   - **Resource Group**  Select your resource Group.
   - **OS** We are using Windows for these labs.
   - **Hosting Plan**  Ensure **Consumption plan** is selected.
        > Hosting plan that defines how resources are allocated to your function app. In the default Consumption Plan, resources are added dynamically as required by your functions. In this serverless hosting, you only pay for the time your functions run. When you run in an App Service plan, you must manage the scaling of your function app.
   * **Location**  Select the same location as before.
   * **Runtime Stack** Select **.NET**
   * **Storage** Create a storage account used by your function app, consider **functionappstorage**.
        > Storage account names must be between 3 and 24 characters in length and may contain numbers and lowercase letters only.
   * **Application Insights**, select On.
   * **Application Insights Location**, select same location as before.
5. Select **Create** to provision and deploy the function app.

    ![Image](/images/lab-2.3-image2.png) 

## Azure Credentials

1. From **Visual Studio Code**, login to your Azure account.
2. Press **Ctrl-Shift-P**.
2. Enter **Azure** and select **Sign in to Azure Cloud**.

    ![Image](/images/lab-2.3-image8.png) 

## Create the EventHubTrigger Function Project

Use the Event Hubs trigger to respond to an event sent to an event hub event stream. You must have read access to the event hub to set up the trigger. When an Event Hubs trigger function is triggered, the message that is passed into the function a string type.

We will be using Visual Studio Code and the Azure Functions Extension.
1. Navigate to the Workspace created in [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).
2. Open up a **Command Prompt** or **PowerShell** as an **Administrator**.
    - Type **CD C:\Workspace\IoT-Pi-Day-master\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Solution\HubwayFunctions**
3.  Enter **code .** and press return.
    > This brings up an instance on Visual Studio Code with HubwayFunctions selected as the working folder.
3.  Press **Ctrl-Shift-P**.
4.  Enter Azure Functions and select **Create New Project** from the list.

    ![Image](/images/lab-2.3-image3.png) 

5.  Select the folder that will contain your function app, **HubwayFunctions**.

    ![Image](/images/lab-2.3-image4.png) 

7.  Select the project language -- in this case, **C#**

    ![Image](/images/lab-2.3-image6.png)

8.  Select the **Yes** button to overwrite existing files.

9.  Select the **Restore** button on the lower right corner when it pops up.

10.  Select the **HubwayFunctions.csproj** from the left panel and change the TargetFramework to **netcoreapp2.2**.

        ![Image](/images/lab-2.3-image7.png) 

9.  **Save** and **Close** the file.

## Create the Event Hub Trigger

1. Press **Ctrl-Shift-P**.
2. Enter **Azure Functions** and select **Create Function** from the list.

    ![Image](/images/lab-2.3-image9.png) 

3. Select the folder containting your function app, **HubwayFunctions**.

    ![Image](/images/lab-2.3-image4.png) 

4. Select a function Template.
    > Change the template filter to All

    ![Image](/images/lab-2.3-image10.png) 

5. Select EventHubTrigger

    ![Image](/images/lab-2.3-image11.png) 

6. Change the name from EventHubTriggerCSharp to **HubwayEventHubTrigger**.

## 🚨 --------------------------------   🚨
## 🚨 Tim Brown to review step #6.   🚨
- Error: HubwayEventHubTrigger already exists.

    This image TBD - ![Image](/images/lab-2.3-image12.png) 

## 🚨 --------------------------------   🚨

7. Select the default nameaspace **Company.Function**.

    ![Image](/images/lab-2.3-image13.png)

8.  Select an App Setting for your Event Hub:
    * Select **+ New App Setting**.
    * Enter the key **Hubway_EVENTHUB** for your Event Hub key and press **Enter**
    
    ![Image](/images/lab-2.3-image13.5.png)

    * Paste in the connection string for your event hub and press **Enter**.
        > This can be found in the Azure Portal by selecting the Event Hub namespace  Go to **Shared Access policies** and select the **RootManageSharedAccessKey**.  Copy the **Connection string-primary key**.

    ![Image](/images/lab-2.3-image14.png)

    * Enter the name of the event hub you created earlier -- **hubwaytelemetry**.

    ![Image](/images/lab-2.3-image15.png)

## Test the Function
1.  Press F5 from within VS Code
2.  TBD : You should see...

## Add the CosmosDB Binding

1.  First decorate the function with the CosmosDB Binding -- refer to the Solution provided as a reference.
2.  Update the Event Hub Trigger -- add ConsumerGroup = "hubwaycg".

## Update the code

## 🚨 Content below this line is Under Construction 🚨

1.  Change the body of the code to map the incoming JSON string to an output document for inserting into CosmosDB.

## Test the Function
1.  Press F5 from within VS Code



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