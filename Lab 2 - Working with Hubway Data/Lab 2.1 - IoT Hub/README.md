# Lab 2.1 - Setting up Iot Hub
TBD - We need to document the scenario here

## Prerequisites
1.  The Event Hub Namespace and Event Hub instance must already be created, see [Lab 0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration)

## Estimated time to complete
- TBD

## Create an Iot Hub
> Note: If you already created your Iot Hub, skip to the section **Configuration and Settings**.

Use the following steps to create an Iot Hub:    

- To create an IoT Hub, see [Lab 0 - Resource Configuration, Section Create an IoT Hub](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-an-iot-hub)

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
