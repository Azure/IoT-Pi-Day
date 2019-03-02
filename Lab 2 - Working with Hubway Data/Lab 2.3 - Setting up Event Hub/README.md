# Lab 2.3 - Setting up Event Hub
We need to document the scenario here

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)
2. The Resource Configuation Lab is completed, see [Lab 2.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.0%20-%20Resource%20Configuration)
3. Completion of Lab 2.1 through 2.2 must be done.

## Estimated time to complete
- TBD

## Configuration and Settings

1. From the Azure Portal menu, select **Event Hubs**.
1. Select your event hub created earlier.
    - i.e. **<**Lastname**>-pi-day-EventHub** from the list.

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
