# Lab 2.7.1 - Create a HTTP Function


## Prerequisites


## Create the HTTPTrigger Function

From within Visual Studio Code:

1.  Press Control Shift P

2.  Enter Azure Functions and select Create Function
3.  Select the Folder containing your function app
4.  Select HTTPTrigger
5.  Change the name to HubwayHTTPTrigger.
6.  Take the default Company.Function namespace and press enter.
7.  Set the access rights to Anonymous


## Update the code
1.  Update the code from the solution.
2.  Replace the ConnectionStringSetting = "Shared_Access_Key_DOCUMENTDB" with your CosmosDB key
    * In the Azure Portal, navigate to your CosmosDB Account
    * Select the Keys menu item
    * Copy the PRIMARY READ-ONLY KEY from the Read-Only Keys tab
3.  Update your Azure Maps Subscription Key
    * From the Azure Portal, navigate to your Maps Deployment --> Map Service
    * Select the Authentication menu item on the left
    * Copy the Primary Key
    * Replace with your key atlas.setSubscriptionKey('Azure Maps subscription');
 
4.  Review the code.

## Update the Function App

From within Visual Studio Code:

1.  Press Control Shift P
2.  Type Azure Functions
3.  Select Deploy to Function App
4.  Choose Deploy if prompted


