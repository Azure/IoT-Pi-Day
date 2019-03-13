# Lab 2.4 - Create Function App and Update EventHubTrigger

In this lab, you will create an Azure Function to host the neccessary functions for this application. You will then update the triggers and storage connections to allow Azure services to respond to an event sent to an event hub event stream.

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)
2. The Resource Configuation Lab is completed, see [Lab 2.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.0%20-%20Resource%20Configuration)
3. Completion of Lab 2.1 through 2.3 must be done.

## Estimated time to complete
- 45 min

## Create a function app from the Azure portal

Use the following steps to create an Azure Function:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

3. In the **Search the Marketplace** textbox, type **Function** and press **Enter**.

    ![Image](/images/lab-2.4-image1.png)

4. Select **Function App** from the list.

    ![Image](/images/lab-2.4-image2.png)

5. Click **Create** to create a Function App.

6. Fill in the fields:

   - **App Name**, type in the name for your Function App. This name must be globally unique, type **<*lastname*>-piday-functionapp**.

    - **Subscription**, select the subscription to use for your Function App.

    - **Resource Group**, choose **Use existing** and select the one created already, i.e. **<*lastname*>-piday-rg**.
   
    - **Location**, choose the same one you already selected.

    - **OS** We are using **Windows** for these labs.

    - **Hosting Plan**, Select **Consumption plan**.
        > Hosting plan that defines how resources are allocated to your function app. In the default Consumption Plan, resources are added dynamically as required by your functions. In this serverless hosting, you only pay for the time your functions run. When you run in an App Service plan, you must manage the scaling of your function app.
   
    - **Location**, choose the same one you already selected.

    - **Runtime Stack** Select **.NET**

    - **Storage**, select **Create new** storage account for your function app, type **<*lastname*>pidayfuncstorage**.

        > Storage account names must be between 3 and 24 characters in length and may contain numbers and lowercase letters only.
   
    - **Application Insights**, select **Enable**.
   
        - **Application Insights Location**, select same location as before.

        ![Image](/images/lab-2.4-image3.png) 

7. Select **Create** to provision and deploy the function app.

## Azure Credentials

This is only required if it's the first time you're logging into Azure from Visual Studio Code.

1. From Visual Studio Code, press **Cntl-Shift-P**
2. Enter **Azure** and select **Sign in to Azure Cloud**
3. Authenticate to Azure when the dialog box appears.

    > Note: Once you are signed in, close the web page and return to Visual Studio Code.

## Develop the EventHubTrigger Function code

We use the Event Hubs trigger to respond to an event sent to an event hub event stream. You must have read access to the event hub to set up the trigger. When an Event Hubs trigger function is triggered, the message that is passed into the function is a string type. We will be using Visual Studio Code and the Azure Functions Extension.

1. Open up a Command Prompt or PowerShell as an Administrator.
2. Navigate to the Workspace created in [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).
    - Simply Copy the following line and Paste at the command prompt:

        **```CD C:\Workspace\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Solution\HubwayFunctions```**

3. Confirm you are sitting in the correct folder.

    > C:\Workspace\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Solution\HubwayFunctions

4. Type **```code .```** (that's **code space dot**) to open **HubwayFunctions.csproj** with **Visual Studio Code**.

5. Click **Restore** for the message about unresolved dependencies.

6. Navigate to the resource group.

    - From the Azure Portal from the left menu, click on **Resource Groups**.
    - Select the resource group created previously, i.e. **<*lastname*>-piday-rg**.
    - Click on the Event Hub namespace created earlier, i.e. **<*lastname*>-piday-eventhub**.

    ![Image](/images/lab-2.4-image4.png)

7. Update the **Event Hub** connection string.

    - Under **Settings**, click on **Shared access policies**.
    - Click **RootManageSharedAccessKey**.
    - Copy the **Connection string-primary key**.

        ![Image](/images/lab-2.4-image5.png)

    - From Visual Studio Code, open the file **local.settings.json** and **Paste** in the connection string between the quotes on the **Shared_Access_Key_EVENTHUB** line.

        ![Image](/images/lab-2.4-image6.png) 

    - Press **Ctrl-S** to save the file.

8. Update the **AzureWebJobsStorage** connection string.

    - From the Azure Portal in the left menu, click on **Resource Groups**.
    - Select the resource group created previously. i.e. **<*lastname*>-piday-rg**.
    - Click on the Storage Account created earlier, i.e. **<*lastname*>pidaydatastorage**.

    ![Image](/images/lab-2.4-image7.png)

    - Under **Settings**, click on **Access Keys**.
    - Copy the **Connection String** under **key1**.

        ![Image](/images/lab-2.4-image8.png)  

    - From Visual Studio Code, open the file **local.settings.json** and **Paste** in the connection string between the quotes on the **AzureWebJobsStorage** line.

        ![Image](/images/lab-2.4-image9.png) 
    
    - Press **Ctrl-S** to save the file.

## Configure CosmosDB Trigger Bindings

In this section, we are updating the trigger connection string to going to CosmosDB

1. Navigate to the resource group.

    - From the Azure Portal from the left menu, click on **Resource Groups**.
    - Select the resource group created previously, i.e. **<*lastname*>-piday-rg**.
    - Click on the CosmosDB created earlier, i.e. **<*lastname*>-piday-cosmosdb**.

    ![Image](/images/lab-2.4-image10.png) 

2.  Copy the connection string from the CosmosDB Account.

    - Click on **Keys** under Settings.
    - Copy the **Primary Connection String** on the **Read-write keys** tab.

        ![Image](/images/lab-2.4-image11.png)

3. Update the **CosmosDB** connection string.

    - In Visual Studio Code, open the file **local.settings.json** and **Paste** in the connection string between the quotes on the **Shared_Access_Key_DOCUMENTDB** line.

        ![Image](/images/lab-2.4-image12.png)

    - Press **Ctrl-S** to save the file.

## Test the Function Locally
Let's test the Event Hub trigger to ensure it's firing and ready to process data.

1. From **Visual Studio Code**, double-click on file **HubwayEventHubTrigger.cs** to open in the editor.

    - To execute the code, press **F5**.

2. Run the code on the device.

    - Run **PuTTY** or **Windows 10 SSH** to Telnet into the Raspberry Pi Device using SSH.

    - Enter the **IP address** of the Raspberry Pi Device.

    - Enter <**pi1**> as the logon name, and **Password.1.!!** as the password.

    - Once you are logged in, type **```cd SimulatedDevice```**

    - To execute the code, type **```./simulated-device```**

        > Refer to Lab 2.2 - Send Hubway data to Iot Hub, section [Run the code from the Raspberry PI](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.2%20-%20Send%20Hubway%20Data%20to%20Iot%20Hub)

3. If all went well, you should see each record in JSON format being sent up to the IoT Hub from Visual Studio Code.

    ![Image](/images/lab-2.4-image12.5.png)

4. From **Visual Studio Code**, press **Ctrl-C** to stop.

## Deploy your Function App Project

In this section, we will be deploying the Azure Function App. A function app is the container that hosts the execution of individual functions. A functions is a solution for easily running small pieces of code, or "functions," in the cloud.

1. From Visual Studio Code, click on the **Azure** icon in the left menu.

2. Click on the **Subscription** to expand it and expose the Function App created earlier, i.e. **<*lastname*>-piday-functionapp**.

    ![Image](/images/lab-2.4-image13.1.png) 

4. Right-click and select **Deploy to Function App**.

    ![Image](/images/lab-2.4-image13.2.png) 

5. For the message **Are you sure...**, click **Deploy**.

    ![Image](/images/lab-2.4-image13.3.png) 

4. After a successful deployment, click **View Output**.

    ![Image](/images/lab-2.4-image13.4.png) 

## Update Connection Strings in Azure

1. Right-click on **Application Settings** and select **Upload Local Settings**.

    ![Image](/images/lab-2.4-image13.5.png)  
  
2. Select **local.settings.json** file.

    ![Image](/images/lab-2.4-image13.6.png) 

3. For the **Confirmation** message, click **Yes to all**.

    ![Image](/images/lab-2.4-image13.7.png) 


## Test the Function in Azure

Let's test the Event Hub trigger to ensure it's firing in Azure.

1. Start the Streaming Output

    - Click on **Functions** to expand the functions list.
    
    - Click on **HubwayEventHubTrigger** to select it.

        ![Image](/images/lab-2.4-image20.png)  

    - Right-click on **HubwayEventHubTrigger** and select **Start Streaming Logs** to open the output window.

        ![Image](/images/lab-2.4-image21.png)  


2. Run the code on the device.

    - Run **PuTTY** or **Windows 10 SSH** to Telnet into the Raspberry Pi Device using SSH.

    - Enter the **IP address** of the Raspberry Pi Device.

    - Enter <**pi1**> as the logon name, and **Password.1.!!** as the password.

    - Once you are logged in, type **```cd SimulatedDevice```**

    - To execute the code, type **```./simulated-device```**

        > Refer to Lab 2.2 - Send Hubway data to Iot Hub, section [Run the code from the Raspberry PI](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.2%20-%20Send%20Hubway%20Data%20to%20Iot%20Hub)

3. If all went well, from the Visual Studio Code output window, you will see each record in JSON format being sent up to the IoT Hub.

    ![Image](/images/lab-2.4-image22.png) 

4. From **PuTTY** or **Windows 10 SSH**, press **Ctrl-C** to stop.

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
