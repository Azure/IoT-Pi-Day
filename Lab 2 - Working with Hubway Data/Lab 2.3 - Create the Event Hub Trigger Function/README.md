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

    ![Image](/images/lab-2.3-image3.png) 

## Create the EventHubTrigger Function Project

Use the Event Hubs trigger to respond to an event sent to an event hub event stream. You must have read access to the event hub to set up the trigger. When an Event Hubs trigger function is triggered, the message that is passed into the function a string type.

We will be using Visual Studio Code and the Azure Functions Extension.
1. Navigate to the Workspace created in [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).
2. Open up a **Command Prompt** or **PowerShell** as an **Administrator**.
    - Type **```CD C:\Workspace\IoT-Pi-Day-master\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Workspace\HubwayFunctions```**
3.  Enter **```code .```** and press return.
    > This brings up an instance on Visual Studio Code with HubwayFunctions selected as the working folder.
3.  Press **Ctrl-Shift-P**.
4.  Enter Azure Functions and select **Create New Project** from the list.

    ![Image](/images/lab-2.3-image4.png) 

5.  Select the folder that will contain your function app, **HubwayFunctions** and press **Enter**.

    ![Image](/images/lab-2.3-image5.png) 

6.  Select the project language -- in this case, **C#**

    ![Image](/images/lab-2.3-image6.png)

    > You should see the message Finshed creating project.
    Select the **Restore** button on the lower right corner when it pops up.

    ![Image](/images/lab-2.3-image7.png)

10.  Select the **HubwayFunctions.csproj** from the left panel and change the TargetFramework to **netcoreapp2.2**.


       ![Image](/images/lab-2.3-image8.png) 

9.  **Save** and **Close** the file.

## Create the Event Hub Trigger

1. From **Visual Studio Code**, press **Ctrl-Shift-P**.
2. Enter **Azure Functions** and select **Create Function** from the list.

    ![Image](/images/lab-2.3-image9.png) 

3. Select the folder containting your function app, **HubwayFunctions**.

    ![Image](/images/lab-2.3-image10.png) 

4. Select a function Template and select **All**.

    ![Image](/images/lab-2.3-image11.png) 
    ![Image](/images/lab-2.3-image12.png) 

5. Select **EventHubTrigger**

    ![Image](/images/lab-2.3-image13.png) 

6. Change the name from EventHubTriggerCSharp to **HubwayEventHubTrigger**.

    ![Image](/images/lab-2.3-image14.png) 

7. Select the default nameaspace **Company.Function**.

    ![Image](/images/lab-2.3-image15.png)

8.  Select an App Setting for your Event Hub:
    - Select **+ New App Setting**.
    - Enter the key **Hubway_EVENTHUB** for your Event Hub key and press **Enter**
    
    ![Image](/images/lab-2.3-image16.png)

    - Paste in the connection string for your event hub and press **Enter**.

        > This can be found in the Azure Portal by selecting the Event Hub namespace  Go to **Shared Access policies** and select the **RootManageSharedAccessKey**.  Copy the **Connection string-primary key**.

    ![Image](/images/lab-2.3-image17.png)

    - Enter the name of the event hub you created earlier, **hubwaytelemetry**.

    ![Image](/images/lab-2.3-image18.png)

## Test the Function
1. To execute the code, from **Visual Studio Code**, press **F5**.
2. Telnet into the Raspberry Pi using SSH and login.
3. Once you are logged in, type **cd SimulatedDevice**.
4. Exectute the code, type **./simulated-device**.

    > Refer to Lab 2.1.1 - Send Hubway data to Iot Hub, section [Run the code from the Raspberry PI](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.1%20-%20IoT%20Hub/Lab%202.1.1%20-%20Send%20Hubway%20Data%20to%20Iot%20Hub#run-the-code-from-the-raspberry-pi)

    <!--  ![Image](/images/missing-image.png) -->

6. If all went well, you should see each record in JSON format being sent up to the IoT Hub from Visual Studio Code.

![Image](/images/lab-2.3-image20.png)

5. From **Visual Studio Code**, press **Cntl-C** to stop.


## Configure Trigger Bindings

1. From **Visual Studio Code**, double-click on file **HubwayEventHubTrigger.cs** to open in the editor, if it's not alreday opened.

    ![Image](/images/lab-2.3-image21.png)

2. Add the following using statement to the top of the file, **using Newtonsoft.Json.Linq;**.

    ![Image](/images/lab-2.3-image21.5.png) 

2. Decorate the function with the CosmosDB Bindings.
3. From **Visual Studio Code**, click on file **Snippets.txt** to open in editor.
4. Highlight the entire line under **Snippet One:**

    ![Image](/images/lab-2.3-image22.png)

5. Click on the file **HubwayEventHubTrigger.cs** in the editor, if it's not alreday opened.
6. Scroll the file to the right and highlight **EventData[] events**

    ![Image](/images/lab-2.3-image23.png)

7. Paste in the code copied from the **Snippet One:** section above.

    ![Image](/images/lab-2.3-image24.png)

    > For reference, refer to the file **HubwayEventHubTrigger.cs** found under the [Lab 2 - Working with Hubway Data/Solution](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Solution/HubwayFunctions) folder.

8.  Update the Event Hub Trigger by adding **```, ConsumerGroup = "hubwaycg"```** right after Connection = "Hubway_EVENTHUB".
    > Don't forget to add the comma.

    ![Image](/images/lab-2.3-image25.png)

9. From Visual Studio Code, press **Cntl-Shift-`** to open a new Terminal window
10. Press **Enter** to get the prompt.

11. To  resolve dependancies, type the following at the terminal command prompt.
    - **``dotnet add package Microsoft.Azure.WebJobs.Extensions.CosmosDB --version 3.0.3``**

<!-- ## 🚨 Content below this line is Under Construction 🚨 -->

## Update the code for CosmosDB

1.  Change the body of the code to map the incoming JSON string to an output document for inserting into CosmosDB.

3. From **Visual Studio Code**, click on file **Snippets.txt** to open in editor.
4. Highlight the entire section under **Snippet Two:**

    ![Image](/images/lab-2.3-image26.png)

5. Click on the file **HubwayEventHubTrigger.cs** in the editor, if it's not alreday opened.
6. Highlight everything between the **{** and **}** braces.

    ![Image](/images/lab-2.3-image27.png)

7. Paste in the code copied from the **Snippet Two:** section above.

    ![Image](/images/lab-2.3-image28.png) 

    > For reference, refer to the file **HubwayEventHubTrigger.cs** found under the [Lab 2 - Working with Hubway Data/Solution](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Solution/HubwayFunctions) folder.

3. Modify the **Public static** trigger by removing the keywords **async Task** and adding **void**.
    
    ![Image](/images/lab-2.3-image30.png)
    ![Image](/images/lab-2.3-image31.png)

## Deploy your Project
In order to properly deploy Dot Net Core 2.2 code, the settings file must be updated.
1. From **Visual Studio Code**, open the **settings.json** file found under **.vscode**.
2. Change the **azureFunctions.deploySubpath** to **netcoreapp2.2**.

    ![Image](/images/lab-2.3-image31.5.png) 

3. Press **Ctrl-S** to save the file.
4. Press **Ctrl-Shift-P**, enter **Azure Functions** and select **Deploy to Function App**.

    ![Image](/images/lab-2.3-image32.png) 

5. Select the **Function App name** created in the above section **Create a function app from the Azure portal**.
    > i.e. **<**LastName**>-pi-day-functionapp**.

    ![Image](/images/lab-2.3-image33.png) 

6. For the message **Are you sure...**, click **Deploy**.

    ![Image](/images/lab-2.3-image34.png)

7. After a successful deployment, click **Stream Logs**.

    ![Image](/images/lab-2.3-image35.png)

8. Telnet into the Raspberry Pi using SSH and login.
9. Once you are logged in, type **cd SimulatedDevice**.
10. Exectute the code, type **./simulated-device**.

    > Refer to Lab 2.1.1 - Send Hubway data to Iot Hub, section [Run the code from the Raspberry PI](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.1%20-%20IoT%20Hub/Lab%202.1.1%20-%20Send%20Hubway%20Data%20to%20Iot%20Hub#run-the-code-from-the-raspberry-pi)

11. If all went well, you should see each record in JSON format being sent up to the IoT Hub from Visual Studio Code.

    ![Image](/images/lab-2.3-image36.png)
    ![Image](/images/lab-2.3-image20.png)

12. From **Visual Studio Code**, press **Cntl-C** to stop.


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
