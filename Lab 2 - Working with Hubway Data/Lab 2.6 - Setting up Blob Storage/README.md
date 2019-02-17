# Lab 2.6 - Setting up Blob Storage
We need to document the scenario here

## Prerequisites
- TBD

## Estimated time to complete
- TBD

## Create the Storage Account

Use the following steps to create a Storage Account:    

1. In a new browser window, sign in to the [Microsoft Azure Portal](https://portal.azure.com).

2. In the Azure portal click **+Create a resource** at the top left of the screen.

3. Click **Storage** under Azure Marketplace.

4. Click **Storage Account** from the list on the right. You will see the first screen for creating a Storage Account.

    ![Image](/images/lab-2.6-image1.png)

5. On the **Create Storage Account** page, fill in the fields:
   - **Subscription** Select your subscription.
   - **Resource Group** Select the resource group you have been using.
   - **Storage Account Name** Enter a unique name for your storage account.
        - Consider using **hubwaydatastorage**.
   - **Location** Select a location for the account.
   - **Performance** Select Standard.
   - **Account Kind** Select StorageV2 (general purpose v2).
   - **Replication** Select locally-redundant storage (LRS).
   - **Access tier** Select Hot.

    ![Image](/images/lab-2.6-image2.png) 

6. Select **Review + Create**.
7. Select **Create**.
8. Click **Go to resource** when the deployment is complete.

    ![Image](/images/lab-2.6-image3.png)

## Creating the Blob container

1. Under **Blob service**, click **Blobs**.
2. On the right, click **+ Container**.
3. Enter a name for your blob container, **boston-hubway-data**.
4. Select **Private(no anonymous access)**.
5. Click **OK** to create the container.

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
