# Lab 2.7.2 - Static HTML Page

In this lab, you will be setting up an Azure Function to communicate with Azure Maps so that it can create a map instance.

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)
2. The Resource Configuation Lab is completed, see [Lab 2.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.0%20-%20Resource%20Configuration)
3. Completion of Lab 2.1 through 2.7.1 must be done.

## Estimated time to complete
- 15 min

## Develop the Static HTML Page code

1. Open up a Command Prompt or PowerShell as an Administrator.
2. Navigate to the Workspace created in [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).
    - Simply Copy the following line and Paste at the command prompt:

        **```CD C:\Workspace\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Solution\HubwayMap```**

3. Confirm you are sitting in the correct folder.

    > C:\Workspace\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Solution\HubwayMap

4. Type **```code .```** (that's **code space dot**) to open Visual Studio Code.

5. Select the resource group.

    - From the Azure Portal from the left menu, click on **Resource Groups**.
    - Select the resource group created previously, i.e. **<*lastname*>-piday-rg**.
    - Click on the Azure Maps Account created earlier, i.e. **<*lastname*>-piday-azuremaps**.

        ![Image](/images/lab-2.7.2-image1.png)

6. Copy the **Azure Maps Subscription Key** connection string.

    - Under **Settings**, click on **Authentication**.
    - Under **Shared Key Authentication**, copy the **Primary Key**.

        ![Image](/images/lab-2.7.2-image2.png)

7. Update the **Azure Maps Subscription Key** connection string.

    - From **Visual Studio Code**, double-click on the file **hubwayplot.html** in the editor to open it.

    - Scroll down and highlight **Azure Maps subscription**

        ![Image](/images/lab-2.7.2-image3.png)

    - **Paste** in your **Azure Maps subscription** with your **Azure Maps Subscription Key**.

        ![Image](/images/lab-2.7.2-image4.png) 

    - Press **Ctrl-S** to save the file.

8. Update the HttpTrigger API.

    - Update the **hubwayFeed** variable with your **HubwayHttpTrigger** URL.

        ![Image](/images/lab-2.7.2-image4.2.png)  

    - **Paste** in your **URL** from [Lab 2.7.1](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.7%20-%20Working%20with%20Azure%20Maps/Lab%202.7.1%20-%20Function%20Trigger%2C%20HTTP%20Endpoint#view-the-hubwayhttp-endpoint) with your **HubwayHttpTrigger URL**.

        > This is the one you kept open in the browser from previous Lab.

        ![Image](/images/lab-2.7.2-image4.4.png) 

        > For reference, see [Lab 2.7.1 - Function Trigger, HTTP Endpoint, View the HubwayHTTP Endpoint](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.7%20-%20Working%20with%20Azure%20Maps/Lab%202.7.1%20-%20Function%20Trigger%2C%20HTTP%20Endpoint#view-the-hubwayhttp-endpoint)

    - Press **Ctrl-S** to save the file.

## Upload file to Storage account

**Option 1 - Storage Explorer from the Azure Portal**

1. Navigate to the resource group.

    - From the Azure Portal from the left menu, click on **Resource Groups**.
    - Select the resource group created previously, i.e. **<*lastname*>-piday-rg**.
    - Click on the Storage Account created earlier, i.e. **<*lastname*>pidaydatastorage**.

        ![Image](/images/lab-2.7.2-image5.png) 

2. Upload the file.
    - Click **Storage Explorer (preview)**.
    - Click **BLOB CONTAINERS** to expand the tree structure.
    - Click on the **$web** container.
    - Click on **Upload** button.

        ![Image](/images/lab-2.7.2-image6.png)

    - Select the file **hubwayplot.html**.

        > The file will be in the folder C:\Workspace\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Solution\HubwayMap

    - Click **Upload**.

    ![Image](/images/lab-2.7.2-image7.png)

**Option 2 - Storage Explorer from the Desktop**

1. To get started, see [Install Azure Storage Explorer](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop)

## View the Page

1. Navigate to the resource group.

    - Under **Settings**, click **Static website**.
    - Click copy button to **Copy** the Primary endpoint URL.

        ![Image](/images/lab-2.7.2-image8.png) 

2. Open up a new browser window and paste in the URL, do not press enter.
3. Append **hubwayplot.html** to the end of it.

    > The URL should look something like this:
    **```https://mystorage.xyz.web.core.windows.net/hubwayplot.html```**

4. Press **Enter** to see the data points on the map.

    ![Image](/images/lab-2.7.2-image9.png)  

5. Verify you have data in CosmosDB, you should see that information plotted on the map. Yeah!!! :smiley:

<!--
## 🚨 Content below this line is Under Cons***truction 🚨
-->


## Reference Sites

[GeoJSON](http://geojson.org/) specification.