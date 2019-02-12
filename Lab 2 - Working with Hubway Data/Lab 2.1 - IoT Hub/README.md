# Lab 2.1 - Setting up Iot Hub
TBD - We need to document the scenario here

## Prerequisites
1.  The Event Hub Namespace and Event Hub instance must already be created, see [Lab 0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration)

## Create an Iot Hub
> Note: If you already created your Iot Hub, skip to the section Configuration and Settings

Use the following steps to create an Iot Hub:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

    ![Image](/images/lab-0-image1.png)

3. Click **Internet of Things** under Azure Marketplace.

3. Click **Iot Hub** from the list on the right. You see the first screen for creating an IoT hub.

    ![Image](/images/lab-0-image2.png)

4. Fill in the fields.
   * **Subscription**: Select the subscription to use for your IoT hub.
   * **Resource Group**: You can create a new resource group or use an existing one. To create a new one, click Create new and fill in the name you want to use. To use an existing resource group, click Use existing and select the resource group from the dropdown list.
   * **Region**: This is the region in which you want your hub to be located. Select the location closest to you from the dropdown list.
   * **IoT Hub Name**: Put in the name for your IoT Hub. This name must be globally unique. A recommendation is LastName-pi-day-IoT-Hub.
   * Click **Next: Size and scale** to continue creating your IoT hub.

    ![Image](/images/lab-0-image3.png)

    <!-- ![Image](/images/lab-0-image3.2.png) -->

6. On this screen, **S1: Standard Tier**.
7. Click **Review + create** to review your choices.  
    * **Pricing and scale tier**: You can choose from several tiers depending on how many features you want and how many messages you send through your solution per day. The free tier is intended for testing and evaluation. It allows 500 devices to be connected to the IoT hub and up to 8,000 messages per day. Each Azure subscription can create one IoT Hub in the free tier.

    ![Image](/images/lab-0-image4.png)

    <!-- ![Image](/images/lab-0-image5.png) -->

8. After reviewing the screen, click **Create**.

## Configuration and Settings

Select your IoT Hub from the Resource Blade

## Add your Raspberry Pi to your IoT Hub.

1.  Select **IoT Devices** from the Iot Hub Blade.
2.  Click **Add**.

    ![Image](/images/lab-2.1-image1.png)

 3. Fill in the fields as follows.
    - **Device ID**  Enter the Raspberry PI Hostname.
        > Note: If you don't have one, ask a proctor. Should follow this format: **raspberrypi-<**cityabbrev>**<**nn**>**.
    - Make sure **Auto Generate Keys** is selected.

    ![Image](/images/lab-2.1-image2.png)

    - Click **Save**

## Message Routing - Define Custom End points and routes
1.  Select the Custom Endpoints Tab at the top of the Message Routing Blade
1. Select **Message routing** from the Iot Hub Blade.
2. Click **Custom Endpoints** from the Message Routing blade.
3. Click **Add** and select **Event Hubs**.

    ![Image](/images/lab-2.1-image3.png)

3.  Fill in the fields:
    - **Endpoint Name**, enter **HubwayTelemetryRoute**.
    - **Event Hub Namespace**, select the **Event Hub Namespace** in the drop down.
    - **Event Hub Instance**, select the **Event Hub Instance** from the drop down.

    ![Image](/images/lab-2.1-image4.png)

7. Click **Create**.
8. Select the **Routes** tab at the top of the **Message Routing Blade**.
9. Click **Add**.

    ![Image](/images/lab-2.1-image5.png)

6.  Click Add and fill in the fields:
    - **Name**, enter **BostonHubwayTelemetryRoute**.
    - **Endpoint**, select the **Event Hub name** from the drop down such as **HubwayTelemetryRoute**.
    - **Data Source**, select **Device Telemetry Messages**.
    - **Routing Query**: enter **```RoutingProperty = 'Hubway' ```**.
7. Click **Save**.

    ![Image](/images/lab-2.1-image6.png)


## Reference Sites

[How to Create and Iot Hub using the Azure Portal][Create-iot-hub]

[IotHub Documentation][IotHub-Documentation]



[Azure-Portal]: https://portal.azure.com/ 

[Create-iot-hub]: https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-through-portal

[IotHub-Documentation]: https://docs.microsoft.com/en-us/azure/iot-hub/
