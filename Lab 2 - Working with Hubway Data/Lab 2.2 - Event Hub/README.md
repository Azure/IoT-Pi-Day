# Lab 2.2 - Setting up Event Hub
We need to document the scenario here

## Prerequisites
- The Event Hub Namespace must already be created, see [Lab 0 - Resource Configuration, section Create an Event Hub namespace](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-an-event-hub-namespace)
- The Event Hub must already be creaated, see [Lab 0 - Resource Configuration, section Create an Event Hub](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-an-event-hub-namespace)

## Estimated time to complete
- TBD

## Configuration and Settings

1. From the Azure Portal menu, select **Event Hubs**.
1. Select your event hub created earlier.
    - i.e. **Lastname-pi-day-EventHub** from the list.

    ![Image](/images/lab-2.2-image1.png)

3. In the left panel under **Entities**, select **Event Hubs** and select yours in the window on the right,
    - i.e. **hubwaytelemetry**.

    ![Image](/images/lab-2.2-image2.png)

4. In the left panel under **Entities**, select **Consumer Groups** on the left menu.
5. Select **+ Consumer Group** to create a new Group.
6. Enter the name **hubwaycg** in the name field on the right.

    ![Image](/images/lab-2.2-image3.png)

7. Click **Create**.

## Reference Sites

[Azure-Portal](https://portal.azure.com/)

[EventHub-Documentation](https://docs.microsoft.com/en-us/azure/event-hubs/)
