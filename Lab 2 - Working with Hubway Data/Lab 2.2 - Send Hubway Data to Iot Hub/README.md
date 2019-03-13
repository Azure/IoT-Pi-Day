# Lab 2.2 - Send Hubway data to Iot Hub
In this section, you will simulate data being collected from the Hubway data source by sending each record in a ***.csv** file and adding route **tagging** to the data sent to IoT Hub.


## Prerequisites
1. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration)
2. The Resource Configuation Lab is completed, see [Lab 2.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%202%20-%20Working%20with%20Hubway%20Data/Lab%202.0%20-%20Resource%20Configuration)
3. Completion of Lab 2.1 through 2.1 must be done.

## Estimated time to complete
- 20 min

## Load IoTProject code

1. Open up a Command Prompt or PowerShell as an Administrator.
2. Navigate to the Workspace created in [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).
    - Simply Copy the following line and Paste at the command prompt:

        **```CD C:\Workspace\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Solution\IotProject\simulated-device```**

3. Confirm you are sitting in the correct folder.

    > C:\Workspace\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Solution\IotProject\simulated-device

4. Type **```code .```** (that's **code space dot**) to open **simulated-device.csproj** with **Visual Studio Code**.

5. Click **Restore** to resolve dependencies message and update packages.

## Azure Credentials

This is only required if it's the first time you're logging into Azure from Visual Studio Code.

1. From Visual Studio Code, press **Cntl-Shift-P**
2. Enter **Azure** and select **Sign in to Azure Cloud**
3. Authenticate to Azure when the dialog box appears.

    > Note: Once you are signed in, close the web page and return to Visual Studio Code.

## Develop simulated-device code

1. Select the resource group.

    - From the Azure Portal from the left menu, click on **Resource Groups**.
    - Select the resource group created previously, i.e. **<*lastname*>-piday-rg**.
    - Click on the IoT Hub created earlier, i.e. **<*lastname*>-piday-iothub**.

        ![Image](/images/lab-1.1-image2.png) 

2. Copy the **IoT Hub** connection string.

    - Under **Explorers**, select the **IoT Devices** menu on the left
    - Select **your device name** from the window, i.e. **raspberrypi-det-000**.

        ![Image](/images/lab-1.1-image3.png) 

    - Copy the **Connection string (primary key)**.

        ![Image](/images/lab-1.1-image4.png)

3.  Replace the **IoT Hub Device Connnection String**.

    - From Visual Studio Code, edit the **SimulatedDevice.cs** by clicking on the filename in the left panel.

    - **Paste** in and replace your <**IoT Hub Device Connnection String**>.

        ![Image](/images/lab-2.2-image1.png)  

    - Press **Cntrl-S** to save the file.
   
## Test the Code

1. Open the Output windows, select the menu item **View** then click on **Output**.

    > Note: Press **Cntl-Shift-U** to view the output window. 

2. Press **F5** to run with debugging.

    > Note: If all went well, you should see each record in JSON format being sent up to the IoT Hub.

    ![Image](/images/lab-2.2-image2.png) 

3.  Press **Shift-F5** to stop debugging.

##  Compile the code
1.  From the already opened Command Prompt or PowerShell prompt.

2. Confirm you are sitting in the correct folder.

    > C:\Workspace\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Solution\IotProject\simulated-device

3.  Run the following commands:
    - **```dotnet clean .```**
    - **```dotnet build .```**
    - **```dotnet publish . -r linux-arm```**

##  Deploy to Raspberry PI

**Copy the Program File**

1.  From the existing Command Prompt or PowerShell Prompt, cut-n-paste the below line and format it as follows:
    - **scp.exe -r .\bin\Debug\netcoreapp2.2\linux-arm\publish\* <**username**>@<**device ip address**>:/home/<**pi1**>/SimulatedDevice**

        **```scp.exe -r .\bin\Debug\netcoreapp2.2\linux-arm\publish\* pi1@192.168.1.200:/home/pi1/SimulatedDevice```**

2. When prompted to continue to connect, type **yes**.
3. Type in **Password.1.!!** as the password.

**Copy the Data File**

4.  From the existing Command Prompt or PowerShell Prompt, cut-n-paste the below line and format it as follows:
    - **scp.exe -r .\data\* <**username**>@<**device ip address**>:/home/<**pi1**>/SimulatedDevice/data/**

        **```scp.exe -r .\data\* pi1@192.168.1.200:/home/pi1/SimulatedDevice/data/```**

5. When prompted to continue to connect, type **yes**.
6. Type in **Password.1.!!** as the password.

## Run the code from the Raspberry PI

1. Run **PuTTY** or **Windows 10 SSH** to Telnet into the Raspberry Pi Device using SSH.
2. Enter the **IP address** of the Raspberry Pi Device.
3. Click **Open** and Accept the message about keys.
    - Enter <**pi1**> as the logon name, and **Password.1.!!** as the password.
4.  Once you are logged in
5.  Type **```cd SimulatedDevice```**
6.  Type **```chmod 755 simulated-device```**

    ![Image](/images/lab-2.2-image3.png) 

7. Verify that permissions has been changed on the executable.
8. Type **```ls -al```**, the scroll up and locate **simulated-device**, it should be green.

    ![Image](/images/lab-2.2-image4.png)

9.  To execute the code, type **```./simulated-device```**

    > Note: If all went well, you should see each record in JSON format being sent up to the IoT Hub.  There are **60,315 rows** of data being sent to IoT Hub being read from the **201502-hubway-tripdata.csv** file.

    ![Image](/images/lab-2.2-image5.png)

## Verify data is being sent to Azure IoT Hub

1. Select the resource group.

    - From the Azure Portal from the left menu, click on **Resource Groups**.
    - Select the resource group created previously, i.e. **<*lastname*>-piday-rg**.
    - Click on the IoT Hub created earlier, i.e. **<*lastname*>-piday-iothub**.

        ![Image](/images/lab-1.1-image2.png) 

2. Verify you are seeing data being sent to your IoT Hub.

    > IoT Hub is an Azure service that enables you to ingest high volumes of telemetry from your IoT devices into the cloud for storage or processing. You are now sending information from the Raspberry Pi device to Azure IoT Hub. At this point, nothing interesting is happening in the cloud with that data you are sending to Azure. It is simply being persisted for a default amount of time (1-day) and then being dropped.

    - Click on the **Overview** menu on the left.
    - In the right panel, scroll to bottom of blade and click on **Device to cloud messages**.
    - On the **Metrics** page, change the timeframe to **Last 30 minutes** and time granularity to **1 minute**.

    ![Image](/images/lab-2.2-image6.png)  

3. From the existing Telnet window, press **Ctrl-C** to stop sending data.

## Reference Sites

[Getting started with Visual Studio Code and C#][Get-Started]

[Debugging in Visual Studio Code][vs-code-debug]

[Azure-Portal]: https://portal.azure.com/ 

[Get-Started]: https://docs.microsoft.com/en-us/dotnet/core/tutorials/with-visual-studio-code

[vs-code-debug]: https://code.visualstudio.com/Docs/editor/debugging

