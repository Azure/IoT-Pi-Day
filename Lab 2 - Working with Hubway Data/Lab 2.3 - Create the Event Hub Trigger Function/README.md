# Lab 2.1 - Create a Function App and Event Hub Trigger Function
We need to document the scenario here


## Prerequisites
1.  The Event Hub Namespace and Event Hub instance must already be created.
2.  CosmosDB implementing the SQL APi and Tripdata collection mu already be created.
3.  Visual Studio Code and listed extenstions are installed.

## Create a function app from the Azure portal

Note:  If you already created your account, skip to the section Configuration and Settings

Use the following steps to create an Iot Hub:    

1. In a new browser window, sign in to the [Azure Portal][Azure-Portal].

2. Choose +Create a resource, then choose Compute.
3. Select Function App on the right.
4. Fill in the fields:
   * **App name** Enter LastName-pi-day-Function-Apps
   * **Subscription**  Select your subscription.
   * **Resource Group**  Select your resource Group.
   * **OS** We are using Windows for these labs.
   * **Hosting Plan**  Ensure Consumption plan is selected.  Hosting plan that defines how resources are allocated to your function app. In the default Consumption Plan, resources are added dynamically as required by your functions. In this serverless hosting, you only pay for the time your functions run. When you run in an App Service plan, you must manage the scaling of your function app.
   * **Location**  Select the same location as before.
   * **Runtime Stack** Select .NET
   * **Storage** Create a storage account used by your function app. Storage account names must be between 3 and 24 characters in length and may contain numbers and lowercase letters only.  
   * **Application Insights**  Select On.
   * **Application Insights Location**  Same location.
5. Select Create to provision and deploy the function app.


## Create the EventHubTrigger Function

Use the Event Hubs trigger to respond to an event sent to an event hub event stream. You must have read access to the event hub to set up the trigger.

When an Event Hubs trigger function is triggered, the message that is passed into the function a string type.

We will be using Visual Studio Code and the Azure Functions Extension.

1.  From a command line / powershell, change directory to \Workspace\HubwayFunctions.
2.  Enter code . and press return.  This brings up an instance on Visual Studio Code with HubwayFunctions selected as the working folder.
3.  Press Control Shift P
4.  Enter Azure Functions and select Create New Project from the list.
5.  Select the folder that will contain your function app - HubwayFunctions.
6.  Select the project language -- in this case, C#.
7.  Select the Restore button on the lower right corner when it pops up.
8.  Select the HubwayFunctions.csproj and change the TargetFramework to netcoreapp2.2
9.  Save and close the file.

`Azure Credentials`

1.  Press Control Shift P
2.  Enter Azure and select Sign in to Azure Cloud
3.  







## Reference Sites

[How to Create a Function App using the Azure Portal][Create-FunctionApp]

[Azure Functions Documentation][Functions-Documentation]

[Triggers and Bindings Concepts][Triggers-Bindings]

[Event Hub Trigger][EventHubTrigger]

[Azure-Portal]: https://portal.azure.com/ 

[Create-FunctionApp]: https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-function-app-portal

[Functions-Documentation]: https://docs.microsoft.com/en-us/azure/azure-functions/

[Triggers-Bindings]: 
https://docs.microsoft.com/en-us/azure/azure-functions/functions-triggers-bindings

[EventHubTrigger]: 
https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-event-hubs