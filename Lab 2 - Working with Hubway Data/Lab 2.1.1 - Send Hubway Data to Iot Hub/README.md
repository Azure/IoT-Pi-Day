# Lab 2.1.1 - Send Hubway data to Iot Hub
We need to document the scenario here


## Prerequisites
1.  The Event Hub Namespace and Event Hub instance must already be created.
2.  CosmosDB implementing the SQL APi and Tripdata collection mu already be created.
3.  Visual Studio Code and listed extenstions are installed.
4.  The IoT Hub must be created and configured

## Create the IoTProject console application

From the command line or powershell

1.  Change directory to \Workspace\IotProject
2.  Enter dotnet new console -o "simulated-device"
3.  CD into simulated-device
4.  Enter code . and press return

## Test Hello World

From the Visual Studio Code

1.  When prompted in VS Code to add assets, click Yes.
2.  Test the basic Hello World Application from within VS Code
    *  Press F5
    *  You should see Hello World printed in the debug console
    *  Once your are satisifed your environment works, delete program.cs

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
    *  EXAMPLE:  "HostName=smith-iothub.azure-devices.net;DeviceId=countrydiverpi;SharedAccessKey=WAvH5fGAZHKo6U3ccUBpiHa7r1wETD+9gja/Aim6HiR=";



## Azure Credentials

Note:  If this is the first time logging into Azure from Visual Studio Code.

1.  Press Control Shift P
2.  Enter Azure and select Sign in to Azure Cloud
   
## Test the Function
1.  Press F5 from within VS Code
2.  If all went well, you should see each record in JSON format being sent up to the IoT Hub.
3.  Press Ctrl+C to stop


## Dotnet command to deploy to RPI
1.  TBD



## Reference Sites

[Getting started with Visual Studio Code and C#][Get-Started]

[Debugging in Visual Studio Code][vs-code-debug]

[Azure-Portal]: https://portal.azure.com/ 

[Get-Started]: https://docs.microsoft.com/en-us/dotnet/core/tutorials/with-visual-studio-code

[vs-code-debug]: https://code.visualstudio.com/Docs/editor/debugging

