# Lab 2.1 - Define Message Routing for Device
In this section, you will be setting up a message route in IoT Hub.  The route allows filtering of the data for consumption later.

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)
2. The Resource Configuation Lab is completed, see [Lab 2.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.0%20-%20Resource%20Configuration)

## Estimated time to complete
- 5 min

## Define Custom End points and Routes
1. In the left side menu, click on **Resource Groups**.
2. Select the resource group created previously. i.e. **<*lastname*>-piday-rg**.
3. Click on the IoT Hub created earlier, i.e. **<*lastname*>-piday-iothub**.

    ![Image](/images/lab-2.1-image1.png) 

4. Click **Message routing** from the **IoT Hub** Blade.
5. Click **Custom Endpoints**.
6. Click **+ Add** and select **Event Hubs**.

    ![Image](/images/lab-2.1-image2.png)

5.  Fill in the fields:
    - **Endpoint Name**, type **HubwayTelemetryRoute**.
    - **Event Hub Namespace**, select your event hub namespace created early in the drop down.
        - i.e. **<**lastname**>-piday-eventhub**.
    - **Event Hub Instance**, select your event hub instance created, i.e. **hubwaytelemetry** from the drop down.

        ![Image](/images/lab-2.1-image3.png) 

6. Click **Create**.
7. Select the **Routes** tab at the top of the **Message Routing Blade**.
8. Click **+ Add**.

    ![Image](/images/lab-2.1-image4.png) 

8.  Fill in the fields:
    - **Name**, enter **BostonHubwayTelemetryRoute**.
    - **Endpoint**, select the **Event Hub name** from the drop down, i.e. **HubwayTelemetryRoute**.
    - **Data Source**, select **Device Telemetry Messages**.
    - **Routing Query**: type in **```RoutingProperty = 'Hubway' ```**

        ![Image](/images/lab-2.1-image5.png) 

9. Click **Save**.

## Reference Sites

[How to Create and Iot Hub using the Azure Portal][Create-iot-hub]

[IotHub Documentation][IotHub-Documentation]



[Azure-Portal]: https://portal.azure.com/ 

[Create-iot-hub]: https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-through-portal

[IotHub-Documentation]: https://docs.microsoft.com/en-us/azure/iot-hub/
