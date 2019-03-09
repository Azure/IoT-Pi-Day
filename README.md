
# Azure IoT-Pi-Day Workshop

This is an exclusive workshop to help developers get hands-on with Azure and IoT devices.

## Prerequisites
- A Raspberry Pi.
- A Raspberry Pi SenseHAT (only required for 1 lab)
- Azure Subscription [Microsoft Azure Portal](https://portal.azure.com).


## Description

If you’re like us, Pi Day (3/14) is a pretty special day. As many of you know, Pi (Greek letter “π”) is the symbol used in mathematics to represent a constant- the ratio of the circumference of a circle to its diameter- which is approximately 3.14159. Math enthusiasts around the world celebrate Pi day by eating pie, talking about math, and seeing who can recite the greatest number of digits of Pi. As technologists, we like to take this one step further!

This Pi day will explore the power of a Raspberry Pi device combined with Azure. IoT devices can be pretty powerful but sometimes it’s hard to determine what IoT can do for your company and what business solutions you can solve. You probably already have capabilities to grab data through sensors.
- What do you do with the data?
- How do you manipulate the data?
- How do you get actionable insights?

Creating these applications takes a long time and a lot of code, right? :weary: Not necessarily.

Together, in this hand-on workshop, we’re going to build out a real-life IoT scenario by capturing IoT data and ingesting it into the Cloud. We’ll explore the amazing visualizations and insights we can draw from that data by applying Azure services like Azure Functions, Logic Apps, CosmosDB, Azure Maps, and more.

As you create an end-to-end IoT application in a day, you’ll see how easy it is to leverage Azure tools to innovate with IoT, and hopefully come away with some great ideas of your own.

## Setting up the Raspberry Pi
- This lab will guide you through configuring a Raspberry Pi from scratch in preparation for the following labs.

## Setting up the Laptop
- This lab will guide you through setting up your laptop with Visual Studio Code and neccessary Azure services, in preparation for the following labs.

## Lab 1 - Getting Started with the SenseHAT
- [**Lab 1** - Getting started with the Sense HAT](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT)

    - [**Lab 1.0** - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)
        - This lab will guide you through setting up the neccessary Azure services in preparation for the following labs.

    - [**Lab 1.1** - Reading SenseHat Data](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.1%20-%20Reading%20SenseHat%20Data)
        - This lab will guide you through updating code, deploying code to  the device, running code on the device, and sending **Real** sensor data to Azure IoT Hub.
        > This **requires** a Raspberry Pi SenseHAT.
    
    - [**Lab 1.2** - Simulated SenseHat Data (Optional)](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.2%20-%20Simulated%20SenseHat%20Data)
        - This lab will guide you through updating code, deploying code to the device, running code on the device, and sending **Simulated** sensor data to Azure IoT Hub.
        > This **does NOT** require a Raspberry Pi SenseHAT.
 

## Lab 2 - Working with Hubway Data
- [**Lab 2.0** - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.0%20-%20Resource%20Configuration)
    - This lab is a Prerequisite for Lab 2.

- [**Lab 2.1** - Define Message Routing for Device](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.1%20-%20Define%20Message%20Routing%20for%20Device)
    - This lab will guide you through ...(desc coming soon...)

- [**Lab 2.2** - Send Hubway Data to Iot Hub](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.2%20-%20Send%20Hubway%20Data%20to%20Iot%20Hub)
    - This lab will guide you through ...(desc coming soon...)

- [**Lab 2.3** - Setting up Event Hub](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.3%20-%20Setting%20up%20Event%20Hub)
    - This lab will guide you through ...(desc coming soon...)

- [**Lab 2.4** - Create Function App and Update EventHubTrigger](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.4%20-%20Create%20Function%20App%20and%20Update%20EventHubTrigger)
    - This lab will guide you through ...(desc coming soon...)

- [**Lab 2.5** - Update the CosmosDBTrigger Function](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.5%20-%20Update%20the%20CosmosDBTrigger%20Function)
    - This lab will guide you through ...(desc coming soon...)

- [**Lab 2.6** - Configure Storage](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.6%20-%20Configure%20Storage)
    - This lab will guide you through ...(desc coming soon...)

- [**Lab 2.7** - Working with Azure Maps](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.7%20-%20Working%20with%20Azure%20Maps)
    - This lab will guide you through ...(desc coming soon...)
    
    - [**Lab 2.7.1** - Function Trigger, HTTP Endpoint](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.7%20-%20Working%20with%20Azure%20Maps/Lab%202.7.1%20-%20Function%20Trigger%2C%20HTTP%20Endpoint)
        - This lab will guide you through ...(desc coming soon...)
    
    - [**Lab 2.7.2** - Static HTML Page](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.7%20-%20Working%20with%20Azure%20Maps/Lab%202.7.2%20-%20Static%20HTML%20Page)
        - This lab will guide you through ...(desc coming soon...)
        
# Contributing

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

# Mastering Markdown
- https://guides.github.com/features/mastering-markdown/
- https://www.webfx.com/tools/emoji-cheat-sheet/ :smile:

