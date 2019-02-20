# Lab 2.5 - Create a CosmosDB Trigger Function


## Prerequisites
1. The CosmosDB Account must already be created, see [Lab 0 - Resource Configuration, section Create a CosmosDB Account](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%200%20-%20Resource%20Configuration#create-a-cosmosdb-account)
2. The Laptop is setup correctly, see [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).
2. Lab 2.3 is completed, see [Lab 2.3 - Create a Function App and Event Hub Trigger Function](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.3%20-%20Create%20the%20Event%20Hub%20Trigger%20Function)
3. Lab 2.4 is completed, see [Lab 2.4 - Setting up CosmosDB](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.4%20-%20Setting%20up%20CosmosDB)

## Create the CosmosDBTrigger Function

1. From **Visual Studio Code**, press **Ctrl-Shift-P**.
2. Enter **Azure Functions** and select **Create Function** from the list.

    ![Image](/images/lab-2.5-image1.png) 

3. Select the folder containting your function app, **HubwayFunctions**.

    ![Image](/images/lab-2.5-image2.png) 

4. Select a function Template and select **All**.

    ![Image](/images/lab-2.5-image3.png) 
    ![Image](/images/lab-2.5-image4.png) 

5. Select **CosmosDBTrigger**

    ![Image](/images/lab-2.5-image5.png) 

6. Change the name from CosmosDBTriggerCSharp to **HubwayCosmosDBTrigger**.

    ![Image](/images/lab-2.5-image6.png) 

7. Select the default namespace **Company.Function**.

    ![Image](/images/lab-2.5-image7.png)

8.  Select an App Setting for your Event Hub:
    - Select **+ New App Setting**.
    - Enter the key **Hubway_COSMOSDB** for your Event Hub key and press **Enter**
    
    ![Image](/images/lab-2.5-image8.png)

9.  Enter the name of the **CosmosDB Account** you created in **Lab 2.4**.
    > i.e. **<**LastName**>-pi-day-functionapp**.

    ![Image](/images/lab-2.5-image9.png)

11. Enter the **database name** you created in **Lab 2.4**.
    > i.e. **Hubway**.

    ![Image](/images/lab-2.5-image10.png)

10. Enter the **collection name** you created in **Lab 2.4**.
    > i.e. **Tripdata**.

    ![Image](/images/lab-2.5-image11.png)

## Update the code for CosmosDBTrigger

1.  Change the body of the code to map the incoming JSON string to an output document for inserting into CosmosDB.

2. From **Visual Studio Code**, click on file **Snippets.txt** to open in editor.
3. Highlight the entire section under **Snippet Three:**

    ![Image](/images/lab-2.5-image12.png)

4. Click on the file **HubwayCosmosDBTrigger.cs** in the editor, if it's not alreday opened.
5. Highlight everything between the **{** and **}** braces.

    ![Image](/images/lab-2.5-image13.png)

6. Paste in the code copied from the **Snippet Three:** section above.

    ![Image](/images/lab-2.5-image14.png) 

    > For reference, refer to the file **HubwayCosmosDBTrigger.cs** found under the [Lab 2 - Working with Hubway Data/Solution](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Solution/HubwayFunctions) folder.

7. Modify the **Public static** trigger by addding the keywords **async**.
    
    ![Image](/images/lab-2.5-image15.png)
    ![Image](/images/lab-2.5-image16.png) 

9. Add the following using statement to the top of the file, **using System.Net.Http;**.

    ![Image](/images/lab-2.5-image17.png) 

10. Locate the **var url** line after the **try** block of code. 

    ![Image](/images/lab-2.5-image18.png) 

11. Scroll the file to the right and highlight **Subscription-Key**

    ![Image](/images/lab-2.5-image19.png)

12. Replace **Subscription-Key** with your **Azure Maps Subscription Key**

    ![Image](/images/lab-2.5-image20.png) 

    > This can be found in the Azure Portal by selecting the Azure Maps Account. Go to  **Settings**, **Authentication**, then **Shared Key Authentication**.  Copy the **Primary Key**.

    ![Image](/images/lab-2.5-image21.png)

13. Press **Ctrl-S** to save the file.
14. Press **Ctrl-Shift-P**, enter **Azure Functions** and select **Deploy to Function App**.

    ![Image](/images/lab-2.5-image22.png) 
 
15. Select the **Function App name** created in the above section **Create a function app from the Azure portal**.
    > i.e. **<**LastName**>-pi-day-functionapp**.

    ![Image](/images/lab-2.5-image23.png) 

16. For the message **Are you sure...**, click **Deploy**.

    ![Image](/images/lab-2.5-image24.png)

17. After a successful deployment, click **Stream Logs**.

    ![Image](/images/lab-2.5-image25.png)

18. If everything worked, you will see the following in the Visual Studio Code output window.

    ![Image](/images/lab-2.5-image26.png)
    
<!--
## 🚨 Content below this line is Under Construction 🚨
-->
