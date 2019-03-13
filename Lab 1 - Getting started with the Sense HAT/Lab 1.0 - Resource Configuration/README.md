# Lab 1.0 - Resource Configuration
TBD - We need to document the scenario here

## Prerequisites
1. Azure Subscription [Microsoft Azure Portal](https://portal.azure.com) with rights to create a Resource group and resources.

## Estimated time to complete
- 15 min

## Download the Repo
The **Azure IoTPiDay Workshop** is setup to build out a real-life IoT scenario by capturing IoT data and ingesting it into the Azure Cloud. The GitHub repo contains all the lab files and code components we will be using for this full lab. As you work through the lab, you will need to reference the documents and items from this repo.  As such, it will be easier for you to download the repo contents onto your local computer for reference.

1. Use Windows Explorer or open up a **Command Prompt** as an **Administrator**.
2. From the Command promopt, create a working area on the hard drive.
    - Type **MKDIR C:\Workspace**.
    - Type **CD C:\Workspace**.
- Open a browser and navigate to [github.com/Azure/IoT-Pi-Day](https://github.com/Azure/IoT-Pi-Day).
- Click the button **Clone or download**.

    ![Image](/images/settingupthelaptop-1.png)

**Option 1 - Download ZIP to your Desktop**

- Click **Download Zip**, **Save As** to the **Desktop** or **Downloads** folder.
- When download is complete, click **Open Folder**.
- **Right-Click** on **Iot-Pi-Day-master.zip**.
- Select **Extract All**, click **Extract** to **C:\Workspace**.

**Option 2 - Clone to your Desktop**
    
> Note: This requires Git + GitHub Desktop to be installed first. If not already done, click [Install Git](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop#optional-install-git) and [Install GitHub Desktop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop#optional-install-git-desktop).

- Click **Open in Desktop**.

## Create an IoT Hub

In this section, we will be creating an IOT Hub that we will use to connect to the Raspberry Pi device. An IoT Hub is the gateway to Azure IoT, a service that handles device management, security, and communication among the connected devices.  We will be using an IoT Hub throughout this lab. Use the following steps to create an Iot Hub:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

3. In the **Search the Marketplace** textbox, type **IoT** and press **Enter**.

    ![Image](/images/lab-1.0-image1.png) 

3. Select **Iot Hub** from the list.
4. Click **Create** to create a IoT Hhub.

    ![Image](/images/lab-1.0-image2.png) 

4. Fill in the fields.
   - **Subscription**, select the subscription to use for your IoT Hub.

   - **Resource Group**, click **Create new** and type **<*lastname*>-piday-rg**
   
        > A resource group acts as a logical boundary for all the resources that we create for this Lab.

   - **Region**, This is the region in which you want your IoT Hub to be located. Select the location closest to you from the dropdown list and take note as you will use this region for all components through the day.

   - **IoT Hub Name**:, type in the name for your IoT Hub. This name must be globally unique, type **<*lastname*>-piday-iothub**.

        ![Image](/images/lab-1.0-image3.png) 

   - Click **Review + create**.
   - If there are no issues, click **Create** to create your IoT hub.

## Add your Device to IoT Hub

1. Once your IoT Hub deployment is complete, click **Go To Resource**.

2.  Click **IoT devices** under Explorers.
3.  Click **Add**.

    ![Image](/images/lab-1.0-image4.png)

4. Fill in the fields for the IoT Device as follows.
    - **Device ID**, use the hostname of your IoT Device, type **raspberrypi-<**cityabbrev>**-<**number**>**.

        > i.e. raspberrypi-det-00

    - Ensure **Auto Generate Keys** is selected.

        ![Image](/images/lab-1.0-image5.png)

    - Click **Save**

## Reference Sites

[Azure-Portal](https://portal.azure.com/)

[Create-iot-hub]( https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-through-portal)

[IotHub-Documentation](https://docs.microsoft.com/en-us/azure/iot-hub/)

[Azure-Portal](https://portal.azure.com/)

[Tutorial: Build a .NET Core app to manage data stored in a SQL API account](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnetcore-get-started)

[.Net-Core-Tutorial](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnetcore-get-started)

[CosmosDB-Documentation](https://docs.microsoft.com/en-us/azure/cosmos-db/)

[CosmosDB-Introduction](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction)
