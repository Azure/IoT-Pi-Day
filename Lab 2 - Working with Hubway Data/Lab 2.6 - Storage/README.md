# Lab 2.6 - Setting up Blob Storage
We need to document the scenario here


## Prerequisites


## Create the Storage Account


Use the following steps to create a Storage Account:    

1. In a new browser window, sign in to the [Azure Portal][Azure-Portal].

2. In the Azure portal, and click Create a resource at the top left of the screen.
3. Search for Azure Storage
4. Select Storage Account by Microsoft
5. Click Create at th bottom of the screen
6. On the Basics page, fill in the fields:
   * **Subscription** Select your subscription
   * **Resource Group** Select the resource group you have been using.
   * **Storage Account Name** Enter a unique name for your storage account.
   * **Location** Select a location for the account.
   * **Performance** Select Standard
   * **Account Kind** Select StorageV2 (general purpose v2)
   * **Replication** Select locally-redundant storage (LRS)
   * **Access tier** Select Hot
7. Select Review + Create 
8. Select Create 

## Creating the Blob container
1. In the Azure portal from the menu on the left, select Blobs under Blob service
2. On the right, click +Container
3. Enter a name for your blob container [ boston-hubway-data ]
4. Select Private(no anonymous access)
5. Click OK to create the container.

## Enable the Static Web Site
1.  Under Settings, select Static website
2.  In the window, select Enabled
3.  Select Save.
   * Notice the $web folder that is created
   * Take note of the Primary endpoint

## Storage Explorer
1.  Select Storage Explorer(preview)
2.  Select BLOB CONTAINERS
3. You should have two containers:
   * $web
   * boston-hubway-data 


## Reference Sites

[Create an Azure Storage Account][CreateAccount]

[Azure Blob Storage][BlobStg]



[BlobStg]: https://azure.microsoft.com/en-us/services/storage/blobs/

[CreateAccount]: https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&tabs=azure-portal
