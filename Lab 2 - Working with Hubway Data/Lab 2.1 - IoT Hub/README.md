# Lab 2.1 - Setting up Iot Hub
We need to document the scenario here


## Prerequisites
1.  The Event Hub Namespace and Event Hub instance must already be created -- see Lab 0.

## Create an Iot Hub

Note:  If you already created your account, skip to the section Configuration and Settings

Use the following steps to create an Iot Hub:    

1. In a new browser window, sign in to the [Azure Portal][Azure-Portal].

2. Choose +Create a resource, then choose Internet of Things.
3. Click Iot Hub from the list on the right. You see the first screen for creating an IoT hub.
4. Fill in the fields.
   * **Subscription**: Select the subscription to use for your IoT hub.
   * **Resource Group**: You can create a new resource group or use an existing one. To create a new one, click Create new and fill in the name you want to use. To use an existing resource group, click Use existing and select the resource group from the dropdown list.
   * **Region**: This is the region in which you want your hub to be located. Select the location closest to you from the dropdown list.
   * **IoT Hub Name**: Put in the name for your IoT Hub. This name must be globally unique. A recommendation is LastName-pi-day-IoT-Hub.
5. Click Next: Size and scale to continue creating your IoT hub.  
6. On this screen, you can take the defaults and just click Review + create at the bottom.  
    * **Pricing and scale tier**: You can choose from several tiers depending on how many features you want and how many messages you send through your solution per day. The free tier is intended for testing and evaluation. It allows 500 devices to be connected to the IoT hub and up to 8,000 messages per day. Each Azure subscription can create one IoT Hub in the free tier.

7.  Click Review + create to review your choices. 


   

## Configuration and Settings

Select your IoT Hub from the Resource Blade

`Iot Devices` - Add your Raspberry PI

1.  Select IoT Devices from the Iot Hub Blade
2.  Click Add and fill in the fields:
    * **Device ID**  Enter the Raspberry PI Hostname.
    * Make sure Auto Generate Keys is selected.
    * Click Save
   
`Message Routing` - Define Custom End points and routes
1.  Select the Custom Endpoints Tab at the top of the Message Routing Blade
2.  Click Add ---> Event Hub
3.  Click Add and fill in the fields:
    * **Endpoint Name**  Enter the Name such as HubwayTelemetryRoute.
    * **Event Hub Namespace**  Select the Event Hub Namespace in the drop down.
    * **Event Hub Instance**  Select the Event Hub Instance from the drop down.
4.  Click Create
5.  Select the Routes tab at the top of the Message Routing Blade.
6.  Click Add and fill in the fields:
    * **Name**  Enter BostonHubwayTelemetryRoute.
    * **Endpoint** Select the Event Hub name from the drop down such as HubwayTelemetryRoute.
    * **Routing Query**:  Enter RoutingProperty = 'Hubway'



## Reference Sites

[How to Create and Iot Hub using the Azure Portal][Create-iot-hub]

[IotHub Documentation][IotHub-Documentation]



[Azure-Portal]: https://portal.azure.com/ 

[Create-iot-hub]: https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-through-portal

[IotHub-Documentation]: https://docs.microsoft.com/en-us/azure/iot-hub/
