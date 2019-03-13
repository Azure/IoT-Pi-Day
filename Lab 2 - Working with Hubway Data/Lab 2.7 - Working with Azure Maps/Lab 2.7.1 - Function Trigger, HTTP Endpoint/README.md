# Lab 2.7.1 - Function Trigger, HTTP Endpoint

## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)
2. The Resource Configuation Lab is completed, see [Lab 2.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.0%20-%20Resource%20Configuration)
3. Completion of Lab 2.1 through 2.6 must be done.

## Estimated time to complete
- 5 min

## Review HTTPTrigger Function code

In this section, we will use a HTTP trigger function to respond to an event everytime a CosmosDB record is updated. We will be using Visual Studio Code and the Azure Functions Extension.

1. Open file.

    - Confirm you have the project **HubwayFunctions.csproj** opened in Visual Studio Code.

    - From **Visual Studio Code**, double-click on the file **HubwayHTTPTrigger.cs** in the editor to open it.

2. Review Input Bindings.

    - The function's **Input Bindings** is reading the data from **CosmosDB** from the **TripData** collection.

        > Notice that **tripItems** is populated from CosmosDB. This class is defined at bottom of code.

        ![Image](/images/lab-2.7.1-image1.png)

3. Review Return Value.

    - The function's **Return Value** is returning a **Static Trip Data Geo Object** formatted to [GeoJSON](http://geojson.org/) specification.  Class is defined at bottom of code.

        ![Image](/images/lab-2.7.1-image2.png)  

<!--
## Deploy your Function App Project

1. From Visual Studio Code, press **Ctrl-Shift-P**, enter **Azure Functions** and select **Deploy to Function App**.

    ![Image](/images/lab-2.7.1-image3.png)  

2. Select the **Function App name** created in the above section **Create a function app from the Azure portal**.
    > i.e. **<**lastname**>-piday-functionapp**.

    ![Image](/images/lab-2.7.1-image4.png)  

3. For the message **Are you sure...**, click **Deploy**.

    ![Image](/images/lab-2.7.1-image5.png) 

4. For the message **Deployment to...** message, click **View Output**.

    ![Image](/images/lab-2.7.1-image6.png)

-->

## Update your Function App Features
In this section, you need to update the origins used for CORS (Cross-Origin Resource Sharing). CORS is used to prevent malicious code execution in your services, App Service blocks calls to your function apps from external sources.

Functions supports cross-origin resource sharing (CORS) to let you define a "whitelist" of allowed origins from which your functions can accept remote requests.

1. Navigate to the resource group.

    - From the Azure Portal from the left menu, click on **Resource Groups**.
    - Select the resource group created previously, i.e. **<*lastname*>-piday-rg**.
    - Click on the Function App created earlier, i.e. **<*lastname*>-piday-functionapp**.

        ![Image](/images/lab-2.7.1-image7.png)

2. Update allowed CORS orgins in the Portal.

    - Click on **Platform Features**.

        ![Image](/images/lab-2.7.1-image12.png) 
    
    - Scroll down, under **API**, click on **CORS**.

    - Under **Allowed Origins**, click the ellipses on each row and click **Delete** to remove them.

        ![Image](/images/lab-2.7.1-image13.png)  

    - Type an **Asterisk** in the textbox.
    
    - Click **Save**, then click the **X** to close this window.

        ![Image](/images/lab-2.7.1-image14.png)  

## View the HubwayHTTP Endpoint

1. Copy the Endpoint
    - Under **Function Apps**, click Click on the **HubWayHttpTrigger**.
    
    - Click on **Get function URL**.

        ![Image](/images/lab-2.7.1-image8.png)

2. Click on **Copy** to copy the URL to clipboard.

    ![Image](/images/lab-2.7.1-image9.png) 

3. Open a new tab in the browser, **Paste** in the URL, and press **Enter**.

    - This function is now reading TripData from CosmosDB. You will see the following output.

        ![Image](/images/lab-2.7.1-image10.png) 

4. Keep the browser open, you will need to copy the URL in the next lab, [Lab 2.7.2 - Static HTML Page](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.7%20-%20Working%20with%20Azure%20Maps/Lab%202.7.2%20-%20Static%20HTML%20Page).


## Reference Sites

[GeoJSON](http://geojson.org/) specification.