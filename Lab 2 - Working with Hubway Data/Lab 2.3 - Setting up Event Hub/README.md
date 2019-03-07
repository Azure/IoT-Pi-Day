# Lab 2.3 - Setting up Event Hub
In this section, we will add a consumer group. Consumer groups are used by applications to pull data from Azure IoT Hub. A consumer group is a view (state, position, or offset) of an entire event hub. Consumer groups enable multiple consuming applications to each have a separate view of the event stream, and to read the stream independently at their own pace and with their own offsets.

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)
2. The Resource Configuation Lab is completed, see [Lab 2.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.0%20-%20Resource%20Configuration)
3. Completion of Lab 2.1 through 2.2 must be done.

## Estimated time to complete
- 5 min

## Configuration and Settings

1. Select the resource group.

    - From the Azure Portal from the left menu, click on **Resource Groups**.
    - Select the resource group created previously, i.e. **<*lastname*>-piday-rg**.
    - Click on the Event Hub namespace created earlier, i.e. **<*lastname*>-piday-eventhub**.

        ![Image](/images/lab-2.3-image1.png) 

2. Add a Consumer group

    - In the left panel under **Entities**, select **Event Hubs**.
    - Select yours in the window on the right, i.e. **hubwaytelemetry**.

        ![Image](/images/lab-2.3-image2.png) 

    - Under **Entities**, select **Consumer Groups**.
    - Click **+ Consumer Group** to create a new Group.
    - Type the name **hubwaycg** in the name field.

        ![Image](/images/lab-2.3-image3.png) 

7. Click **Create**.

## Reference Sites

[Azure-Portal](https://portal.azure.com/)

[EventHub-Documentation](https://docs.microsoft.com/en-us/azure/event-hubs/)

[Features and terminology in Azure Event Hubs](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-features)

[Consumer Groups](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-features#consumer-groups)
