# Lab 2.1.1 - Send Hubway data to Iot Hub
We need to document the scenario here


## Prerequisites
1. The Laptop is setup correctly, see [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).

2.  The Event Hub Namespace and Event Hub instance must already be created.
3.  CosmosDB implementing the SQL APi and Tripdata collection must already be created.
4.  Visual Studio Code and listed extenstions are installed.
5.  The IoT Hub must be created and configured
6.  Ensure that you created the directory SimulatedDevice on the Raspberry PI.  This project will be copied into this directory.

## Create the IoTProject console application

1. Navigate to the Workspace created in [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).

2. Open up a **Command Prompt** or **PowerShell** as an **Administrator**.
    - Type **CD C:\Workspace\IotProject**
3.  Enter **dotnet new console -o "simulated-device"**
4.  CD into **simulated-device**
5.  Enter **code .** and press return

## Test Hello World

From the Visual Studio Code

1.  When prompted in VS Code to add assets, click **Yes**.

2.  Test the basic Hello World Application from within VS Code
    *  **Press F5**
    *  You should see Hello World printed in the debug console
    *  Once your are satisifed your environment works, **delete program.cs**

## Azure Credentials

Note:  If this is the first time logging into Azure from Visual Studio Code.

1.  Press Control Shift P
2.  Enter Azure and select Sign in to Azure Cloud

## Update code

1.  Edit the simulated-device.csproj

2.  Add the ItemGroups from the \Solution\IotProject\simulated-device\simulated-device.csproj 
3.  Create a new file called SimulatedDevice.cs
4.  Copy the contents of \Solution\IotProject\simulated-device.cs into your new file.  Save the file.
5.  Copy the data directory from \Solution\IotProject\simulated-device into your directory.
6.  Replace <Your IoT Hub Connnection String> in simulated-device.cs with your connection string from the IotHub.  This can be found by:
    *  Go to the Azure Portal
    *  Select your IotHub
    *  Select the IoT Devices menu on the left
    *  Select your device from the window
    *  Copy either connection string.
    *  EXAMPLE:  "HostName=smith-iothub.azure-devices.net;DeviceId=RaspberryPIHostName;SharedAccessKey=WAvH5fGAZHKo6U3ccUBpiHa7r1wETD+9gja/Aim6HiR=";

   
## Test the Function
1.  Press F5 from within VS Code

2.  If all went well, you should see each record in JSON format being sent up to the IoT Hub.
3.  Press Ctrl+C to stop


##  Compile the code in preparation to deploy to Raspberry PI
1.  Open a powershell prompt or command line window

2.  Change directory to \Workspace\IotProject\simulated-device
3.  Run the following commands:
    * dotnet clean .
    * dotnet restore .
    * dotnet build .
    * dotnet publish . -r linux-arm

##  Command to deploy to Raspberry PI
We need to execute two copy commands
1.  Change directory to \Workspace\IotProject\simulated-device ( if not already in ths directory)

2.  scp.exe -r .\bin\Debug\netcoreapp2.2\linux-arm\publish\* Username@IP Address:/home/Username/SimulatedDevice
3.  scp.exe -r .\data\* Username@IP Address:/home/Username/SimulatedDevice/data

## Run the code from the Raspberry PI
1.  SSH over to the PI

2.  cd SimulatedDevice
3.  chmod 755 simulated-device ( this only has to be done the first time )
4.  ./simulated-device


## Reference Sites

[Getting started with Visual Studio Code and C#][Get-Started]

[Debugging in Visual Studio Code][vs-code-debug]

[Azure-Portal]: https://portal.azure.com/ 

[Get-Started]: https://docs.microsoft.com/en-us/dotnet/core/tutorials/with-visual-studio-code

[vs-code-debug]: https://code.visualstudio.com/Docs/editor/debugging

