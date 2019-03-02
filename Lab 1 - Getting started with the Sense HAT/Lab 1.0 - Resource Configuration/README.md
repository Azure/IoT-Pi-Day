# Lab 1.0 - Resource Configuration
TBD - We need to document the scenario here

## Prerequisites
1. Azure Subscription [Microsoft Azure Portal](https://portal.azure.com).

## Estimated time to complete
- TBD

## Download the Repo
The **Azure IoTPiDay Workshop** is setup to build out a real-life IoT scenario by capturing IoT data and ingesting it into the Azure Cloud.

- Open up a **Command Prompt** as an **Administrator**.
- Create a working area on the hard drive.
*    - Type **MKDIR C:\Workspace**.
*    - Type **CD C:\Workspace**.
- Open a browser and navigate to [github.com/Azure/IoT-Pi-Day](https://github.com/Azure/IoT-Pi-Day).
- Click the button **Clone or download**.

    ![Image](/images/settingupthelaptop-1.png)

**Option 1 - Download ZIP to your Desktop**

- Click **Download Zip**, **Save As** to Workspace folder.
- When download is complete, click **Open Folder**.
- **Right-Click** on **Iot-Pi-Day-master.zip**.
- Select **Extract All**, click **Extract** to **C:\Workspace**.

**Option 2 - Clone to your Desktop**
    
> Note: This requires Git + GitHub Desktop to be installed first. If not already done, click [Install Git](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop#optional-install-git) and [Install GitHub Desktop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop#optional-install-git-desktop).

- Click **Open in Desktop**.

## Create an Iot Hub

An IoT Hub is the gateway to Azure IoT, a service that handles device management, security, and communication among the connected devices.  Will be using an IoT Hub throughout this lab. Use the following steps to create an Iot Hub:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

![Image](/images/lab-0-image1.png)

3. Click **Internet of Things** under Azure Marketplace.

3. Click **Iot Hub** from the list on the right. You see the first screen for creating an IoT hub.

![Image](/images/lab-0-image2.png)

4. Fill in the fields.
   * **Subscription**: Select the subscription to use for your IoT hub.
   * **Resource Group**: A resource group acts as a logical boundary for all the resources that we create for this Lab. Create a new one, click **Create new**, type **<*lastname*>-piday-rg**
   * **Region**: This is the region in which you want your hub to be located. Select the location closest to you from the dropdown list.
   * **IoT Hub Name**: Put in the name for your IoT Hub. This name must be globally unique, type **<*lastname*>-piday-iothub**.
   * Click **Next: Size and scale** to continue creating your IoT hub.

    ![Image](/images/lab-0-image3.png)

    <!-- ![Image](/images/lab-0-image3.2.png) -->

6. On this screen, **S1: Standard Tier**.

    * **Pricing and scale tier**: You can choose from several tiers depending on how many features you want and how many messages you send through your solution per day. The free tier is intended for testing and evaluation. It allows 500 devices to be connected to the IoT hub and up to 8,000 messages per day. Each Azure subscription can create one IoT Hub in the free tier.

    ![Image](/images/lab-0-image4.png)

7. Click **Review + create** to review your choices.  

    <!-- ![Image](/images/lab-0-image5.png) -->

8. After reviewing the screen, click **Create**.

## Add your Device to your IoT Hub.

1. Select your IoT Hub from the Resource Blade

    ![Image](/images/lab-2.1-image0.png)

2.  Select **IoT Devices** from the Iot Hub Blade.
3.  Click **Add**.

    ![Image](/images/lab-2.1-image1.png)

4. Fill in the fields for the IoT Device as follows.
    - **Device ID**,use the hostname of your IoT Device.
        > i.e. **raspberrypi-<**cityabbrev>**<**number**>**.
    - Ensure **Auto Generate Keys** is selected.

    ![Image](/images/lab-2.1-image2.png)

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
