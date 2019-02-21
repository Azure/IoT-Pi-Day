# Lab 2.7.2 - Create the Static HTML Page
We need to document the scenario here

## Prerequisites
1. Azure Storage Explorer must already be created, see [Lab 0 - Resource Configuration, section Create an Azure Map](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-an-azure-map)
2. Lab 2.4 is completed, see [Lab 2.4 - Setting up CosmosDB](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.4%20-%20Setting%20up%20CosmosDB)

## Update the Code

1. Using File Explorer, **<*Right-Click*>** and **Copy** the **HubwayMap** folder from solution.

    ![Image](/images/lab-2.7.2-image1.png) 

2. Using File Explorer, **Paste** into your workspace folder.
    > Refer to **Lab 0 - Resource Configuration** section **[Download the Repo](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#download-the-repo)**.

    ![Image](/images/lab-2.7.2-image2.png)

3. Open up a **Command Prompt** as an **Administrator**.
4. Type **cd C:\Workspace\IoT-Pi-Day-master\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Workspace\HubwayMap** to change to the Hubwaymap folder.
5. Type **code .** and press enter.
6. Open file **hubwayplot.html** an update the **Azure Maps subscription** key Azure Maps Subscription key.

    ![Image](/images/lab-2.7.2-image3.png)

    > From the Azure Portal, navigate to your Azure Maps Account deployment. Click on **Authentication** under **Settings**.  Locate and copy to clipboard, **Primary** key

8. Press **Ctrl+S** to save the file.


## 🚨 Content below this line is Under Construction 🚨


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

