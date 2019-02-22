# Lab 2.7.1 - Create the HTTP Trigger Function

## Prerequisites
1. The CosmosDB Account must already be created, see [Lab 0 - Resource Configuration, section Create a CosmosDB Account](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-a-cosmosdb-account)
2. Lab 2.4 is completed, see [Lab 2.4 - Setting up CosmosDB](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.4%20-%20Setting%20up%20CosmosDB)

## Create the HTTPTrigger Function

From within Visual Studio Code:

1. From **Visual Studio Code**, press **Ctrl-Shift-P**.
2. Enter **Azure Functions** and select **Create Function** from the list.

    ![Image](/images/lab-2.7.1-image1.png) 

3. Select the folder containting your function app, **HubwayFunctions**.

    ![Image](/images/lab-2.7.1-image2.png) 

4. Select **HttpTrigger**

    ![Image](/images/lab-2.7.1-image3.png) 

5. Change the name from HttpTriggerCSharp to **HubwayHTTPTrigger**.

    ![Image](/images/lab-2.7.1-image4.png) 

6. Select the default namespace **Company.Function**.

    ![Image](/images/lab-2.7.1-image5.png)

7.  Set the access rights to **Anonymous**.

    ![Image](/images/lab-2.7.1-image6.png)

## Update the code

1. Update the code from the solution.
2. Open **HubwayHTTPTrigger.cs**, if it's not already opened.

    ![Image](/images/lab-2.7.1-image7.png)

## Notice

Scroll down and notice the following things, the **Return value** and **Input bindings** for this function.  

3. The function's **Return Value** is returning a **Static Task**, this will change.

![Image](/images/lab-2.7.1-image10.png)

4. The function does not have any **Input Bindings**, this will change.

![Image](/images/lab-2.7.1-image11.png) 

5. Using the files icon, navigate to the **Solution** folder and open the file **HubwayHttpTrigger.cs**.

> For reference, refer to the file **HubwayHttpTrigger.cs** found under the [Lab 2 - Working with Hubway Data/Solution](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Solution/HubwayFunctions) folder.

6. Press **Ctrl+A** to hightlight all the code, then press **Ctrl+C** to **copy** to the clipboard.
7. Select the **HubwayHttpTrigger.cs** file that was just created.
8. Press **Ctrl+A** to hightlight all the code, then press **Ctrl+V** to **paste** from the clipboard.

    ![Image](/images/lab-2.7.1-image7.5.png)

9. The function's **Return Value** is now returning a **Static Geo Object** formatted to [GeoJSON](http://geojson.org/) specification.  Class is defined at bottom of code.

![Image](/images/lab-2.7.1-image12.png) 

10. The function's **Input Bindings** is reading the data from **CosmosDB** from the **TripData** collection.
    > Notice that **tripItems** is populated from CosmosDB. Class is defined at bottom of code.

![Image](/images/lab-2.7.1-image13.png) 

🚨 Randy/Tim needs to update step 11 with the correct Lab.

11. Replace the ConnectionStringSetting = "**Shared_Access_Key_DOCUMENTDB**" with your CosmosDB connection string you created in **Lab 2.???**.

    > i.e. **<**LastName**>-pi-day-CosmosDB_DOCUMENTDB**.

<!-- ![Image](/images/lab-2.7.1-image14.png)  -->
![Image](/images/lab-2.7.1-image15.png) 

12. Press **Ctrl+S** to save file.
13. Review the code.

## Deploy the Function App

From within Visual Studio Code:

1. Press **Ctrl-Shift-P**, enter **Azure Functions** and select **Deploy to Function App**.

    ![Image](/images/lab-2.7.1-image20.png) 

2. Select the **Function App name** created in the above section **Create a function app from the Azure portal**.
    > i.e. **<**LastName**>-pi-day-functionapp**.

    ![Image](/images/lab-2.7.1-image21.png) 

3. For the message **Are you sure...**, click **Deploy**.

    ![Image](/images/lab-2.7.1-image22.png)

    > The function is now deploying...![Image](/images/lab-2.7.1-image22.4.png) 

4. For the message **Deployment to...** message, click **View Output**.

    ![Image](/images/lab-2.7.1-image22.5.png)

    > The function is now deployed. ![Image](/images/lab-2.7.1-image22.6.png) 


4. In the Azure Portal, navigate to your **Function App**.
    > Refer to [Lab 2.3 - Create a Function App and Event Hub Trigger Function](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.3%20-%20Create%20the%20Event%20Hub%20Trigger%20Function)

    ![Image](/images/lab-2.7.1-image23.png)

5. Click on the **HubWayHttpTrigger** created.
6. Click on **Get function URL**.

    ![Image](/images/lab-2.7.1-image24.png)

7. Click on **Copy** to copy the URL to clipboard.

    ![Image](/images/lab-2.7.1-image25.png) 

8. Open a new tab in the browser, **Paste** in the URL, and press **Enter**.

    > This function is now reading TripData from CosmosDB. You will see the following output.

    🚨 Randy/Tim needs to update with correct screenshot for image: lab-2.7.1-image30.png.

    ![Image](/images/missing-image.png)  


## Reference Sites
