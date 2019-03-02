# Lab 2.6 - Configure Storage
We need to document the scenario here

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)
2. The Resource Configuation Lab is completed, see [Lab 2.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.0%20-%20Resource%20Configuration)
3. Completion of Lab 2.1 through 2.5 must be done.

## Estimated time to complete
- TBD

## Creating the Blob container

1. Sign in to the [Microsoft Azure Portal](https://portal.azure.com).
2. Under **Blob service**, click **Blobs**.
3. On the right, click **+ Container**.
4. Enter a name for your blob container, **boston-hubway-data**.
5. Select **Private(no anonymous access)**.
6. Click **OK** to create the container.

    ![Image](/images/lab-2.6-image4.png)

## Enable the Static Web Site
1.  Under **Settings**, select Static website
2.  In the window, select **Enabled**
3.  Select Save.

    ![Image](/images/lab-2.6-image5.png)

    - Notice the $web folder that is created
    - Take note of the Primary endpoint

        ![Image](/images/lab-2.6-image6.png)

## Storage Explorer
1.  Under **Storage Explorer(preview)**, select Static website

2.  Select BLOB CONTAINERS
3. You should have two containers:
   - $web
   - boston-hubway-data 

    ![Image](/images/lab-2.6-image7.png)

## Reference Sites

[Create an Azure Storage Account](https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&tabs=azure-portal)

[Azure Blob Storage](https://azure.microsoft.com/en-us/services/storage/blobs/)
