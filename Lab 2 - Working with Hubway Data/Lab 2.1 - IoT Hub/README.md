# Lab 2.1 - Setting up Iot Hub
TBD - We need to document the scenario here

## Prerequisites
- The Iot Hub must already be created, see [Lab 0 - Resource Configuration, Section Create an IoT Hub](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-an-iot-hub)

## Estimated time to complete
- TBD

## Configuration and Settings

Select your IoT Hub from the Resource Blade

## Add your Raspberry Pi to your IoT Hub.

1.  Select **IoT Devices** from the Iot Hub Blade.
2.  Click **Add**.

    ![Image](/images/lab-2.1-image1.png)

 3. Fill in the fields as follows.
    - **Device ID**  Enter the Device ID.
        > Consider using the device hostname, i.e. **raspberrypi-<**cityabbrev>**<**nn**>**.
    - Make sure **Auto Generate Keys** is selected.

    ![Image](/images/lab-2.1-image2.png)

    - Click **Save**

## Message Routing - Define Custom End points and Routes
1. Select **Message routing** from the **Iot Hub** Blade.
2. Click **Custom Endpoints** from the **Message Routing** blade.
3. Click **Add** and select **Event Hubs**.

    ![Image](/images/lab-2.1-image3.png)

5.  Fill in the fields:
    - **Endpoint Name**, enter **HubwayTelemetryRoute**.
    - **Event Hub Namespace**, select your event hub namespace created early in the drop down.
        - i.e. **Lastname-pi-day-EventHub**.
    - **Event Hub Instance**, select your event hub instance created from Lab 0 in the drop down.
        - i.e. **hubwaytelemetry** from the drop down.

    ![Image](/images/lab-2.1-image4.png)

6. Click **Create**.
7. Select the **Routes** tab at the top of the **Message Routing Blade**.
8. Click **Add**.

    ![Image](/images/lab-2.1-image5.png)

8.  Click Add and fill in the fields:
    - **Name**, enter **BostonHubwayTelemetryRoute**.
    - **Endpoint**, select the **Event Hub name** from the drop down such as **HubwayTelemetryRoute**.
    - **Data Source**, select **Device Telemetry Messages**.
    - **Routing Query**: enter **```RoutingProperty = 'Hubway' ```**.

    ![Image](/images/lab-2.1-image6.png)

9. Click **Save**.

## Reference Sites

[How to Create and Iot Hub using the Azure Portal][Create-iot-hub]

[IotHub Documentation][IotHub-Documentation]



[Azure-Portal]: https://portal.azure.com/ 

[Create-iot-hub]: https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-through-portal

[IotHub-Documentation]: https://docs.microsoft.com/en-us/azure/iot-hub/
