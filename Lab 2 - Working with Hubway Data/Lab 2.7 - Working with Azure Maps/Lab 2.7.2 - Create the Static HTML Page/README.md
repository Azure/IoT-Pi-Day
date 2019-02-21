# Lab 2.7.2 - Create the Static HTML Page
We need to document the scenario here


## Prerequisites
1. Azure Storage Explorer must already be created, see [Lab 0 - Resource Configuration, section Create a CosmosDB Account](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-a-cosmosdb-account)
2. Lab 2.4 is completed, see [Lab 2.4 - Setting up CosmosDB](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.4%20-%20Setting%20up%20CosmosDB)

## Update the Code

## 🚨 Content below this line is Under Construction 🚨

1. Copy the HubwayMap folder from solution to workspace
2. From a command prompt, change directory to \workspace\Hubwaymap
3. type code . and hit enter
4. Enter your Azure Maps Subscription key atlas.setSubscriptionKey('Azure Maps subscription');
   * From the Azure Portal, navigate to your Maps Deployment --> Map Service
   * Select the Authentication menu item on the left
   * Copy the Primary Key
5.  Save the file


3.  🚨 Update your Azure Maps Subscription Key
    * From the Azure Portal, navigate to your Maps Deployment --> Map Service
    * Select the Authentication menu item on the left
    * Copy the Primary Key
    * Replace with your key atlas.setSubscriptionKey('Azure Maps subscription');

    > For reference, refer to the file **HubwayHttpTrigger.cs** found under the [Lab 2 - Working with Hubway Data/Solution](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Solution/HubwayFunctions) folder.



## Azure Storage Explorer

1.  Bring up Azure Storage Explorer
2.  Add your account
3.  Connect to Azure Storage
    *  Select Add an Azure Account
    *  Sign-In with your Azure credentials
    *  OR
    *  Select Use a Connection String
    *  Enter a Display Name
    *  Copy the Connection String from the Access Keys in the Azure Storage settings of the Portal
4.  Apply
5.  Select the Explorer Icon in the top left
6.  Browse into Storage Accounts
7.  Select your storage account that you previously created in Lab 2.6
    - i.e. **hubwaydatastorage**
8.  Open the Blob Containers
9.  Select $web
10. Upload the hubwayplot.html file into $web

## View the Page

1.  Navigate to your storage account in the Azure Portal
2.  Select Static website under Settings
3.  Copy the primary endpoint
    * https://mystorage.z20.web.core.windows.net/
    * Append hubwayplot.html
    * https://mystorage.z20.web.core.windows.net/hubwayplot.html
4.  If you have data in CosmosDB, you should see that information plotted on the map


## Reference Sites

