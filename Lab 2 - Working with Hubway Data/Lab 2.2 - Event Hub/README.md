# Lab 2.2 - Setting up Event Hub
We need to document the scenario here


## Prerequisites


## Create an Event Hub namespace

Note:  If you already created your Event Hub Namespace and an event hub instance in Lab 0, skip to the section Configuration and Settings

Use the following steps to create an Event Hub Namespace:    

1. In a new browser window, sign in to the [Azure Portal][Azure-Portal].

2. In the Azure portal, and click Create a resource at the top left of the screen.
3. Select All services in the left menu, and select star (*) next to Event Hubs in the Analytics category. Confirm that Event Hubs is added to FAVORITES in the left navigational menu.
4. Select Event Hubs under FAVORITES in the left navigational menu, and select Add on the toolbar.
5. On the Create namespace page, fill in the fields:
   * **Name** Enter a name for the namespace. Consider LastName-pi-day-Event-Hub.
   * **Pricing Tier** Choose the pricing tier (Basic or Standard).
   * **Subscription** Select the subscription in which you want to create the namespace.
   * **Resource Group** Select a location for the namespace.
   * **Create** Select Create. You may have to wait a few minutes for the system to fully provision the resources.
6. Refresh the Event Hubs page to see the event hub namespace. You can check the status of the event hub creation in the alerts. 
7. Select the namespace. You see the home page for your Event Hubs namespace in the portal. 

## Create an Event Hub

1.  On the Event Hubs Namespace page, select Event Hubs in the left menu.

2.  At the top of the window, click + Event Hub.
3.  Type a name for your event hub, then click Create.  Consider hubwaytelemetry as an Event Hub Name.
4.  You can check the status of the event hub creation in alerts.
   

## Configuration and Settings


1.  Select Event Hubs from the list on the left.  Event Hubs are displayed in the window on the right such as hubwaytelemetry.

2.  Select Consumer Groups on the left menu.
3.  Select + Consumer Group to create a new Group.
4.  Enter the name hubwaycg in the name field on the right.
5.  Click Create at the bottom of the screen.


## Reference Sites



[Event Hub Documentation][EventHub-Documentation]



[Azure-Portal]: https://portal.azure.com/ 

[EventHub-Documentation]: https://docs.microsoft.com/en-us/azure/event-hubs/
