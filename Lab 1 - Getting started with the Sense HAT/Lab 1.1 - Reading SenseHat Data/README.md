# Lab 1.1 - Reading SenseHat Data
In this lab, we are running a program on the Raspberry Pi device that will grab temperature, humidity and barometric pressure from the SenseHAT and send it on a regular basis to the Azure IOT Hub we setup in a previous lab.

## Prerequisites
1. The Laptop is setup correctly, see [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).
2. The Resource Configuation Lab is completed, see [Lab 1.0 - Resource Configuration](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration).
3. Get the IP Address of your Raspberry Pi device.

## Estimated time to complete
- 20 min

## Load SenseHATDotNetCore code

1. Open up a Command Prompt or PowerShell as an Administrator.
2. Navigate to the Workspace created in [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).
    - Simply Copy the following line and Paste at the command prompt:

        **```CD C:\Workspace\IoT-Pi-Day-master\Lab 1 - Getting started with the Sense HAT\Solution\SenseHATDotNetCore```**

3. Confirm you are sitting in the correct folder.

    > C:\Workspace\IoT-Pi-Day-master\Lab 1 - Getting started with the Sense HAT\Solution\SenseHATDotNetCore

3. Type **```code .```** (that's **code space dot**) to open **SenseHATDotNetCore.csproj** with **Visual Studio Code**.

3. Click **Restore** for the **There are unresolved dependencies** message.

## Azure Credentials

This is only required if it's the first time you're logging into Azure from Visual Studio Code.

1. From Visual Studio Code, press **Cntl-Shift-P**
2. Enter **Azure** and select **Sign in to Azure Cloud**
3. Authenticate to Azure when the dialog box appears.

    > Note: Once you are signed in, close the web page and return to Visual Studio Code.

## Develop SenseHATDotNetCore code

1. From Visual Studio Code, edit the **Program.cs** by clicking on the filename in the left panel.

    ![Image](/images/lab-1.1-image1.2.png) 

2.  Copy your IoT Device connection string from the IotHub.  

    - Go to the **Azure Portal**
    - Select your **IotHub**
    - Under Settings, select the **IoT Devices** menu on the left
    - Select **your device name** from the window,
    - Copy the **connection string (primary key)**.
        > Example:  "HostName=smith-iothub.azure-devices.net;DeviceId=RaspberryPIHostName;SharedAccessKey=WAvH5fGAZHKo6U3ccUBpiHa7r1wETD+9gja/Aim6HiR=";

    ![Image](/images/lab-1.1-image1.5.png)

3.  Replace your copied <**IoT Hub Device Connnection String**> in **Program.cs** with your connection string from the IotHub.  

    ![Image](/images/lab-1.1-image2.png)

2.  Replace <**Your Raspberry Pi Device Name**> in **Program.cs** with your assigned Raspberry Pi device hostname.  

    ![Image](/images/lab-1.1-image3.png) 

3. Press **Cntrl-S** to save the file.

##  Compile the code
1. From the existing Command Prompt or PowerShell as an Administrator.

2. Confirm you are sitting in the correct folder.

    > C:\Workspace\IoT-Pi-Day-master\Lab 1 - Getting started with the Sense HAT\Solution\SenseHATDotNetCoreSimulation

3.  Run the following commands and press **Enter** after each one:
    - **```dotnet clean .```**
    - **```dotnet build .```**
    - **```dotnet publish . -r linux-arm```**

##  Deploy to Raspberry Pi
1.  From the existing Command Prompt or PowerShell Prompt, cut-n-pasted the below line and format it as follows: **scp.exe -r .\bin\Debug\netcoreapp2.2\linux-arm\publish\* <**username**>@<**device ip address**>:/home/<**pi1**>/SenseHATDotNetCore**

    **```scp.exe -r .\bin\Debug\netcoreapp2.2\linux-arm\publish\* pi1@192.168.1.200:/home/pi1/SenseHATDotNetCore```**

3. When prompted to continue to connect, type **yes**.
4. Type in **Password.1.!!** as the password.

## Run the code from the Raspberry Pi

 1. Run **PuTTY** or **Windows 10 SSH** to connect to the Raspberry Pi Device.
 2. Enter the **IP address** of the Raspberry Pi Device.
 3. Click **Open** and Accept the message about keys.
    - Enter <**pi1**> as the logon name, and **Password.1.!!** as the password.
4.  Once you are logged in
5.  Type **```cd SenseHATDotNetCore```**

6.  Type **```chmod 755 SenseHATDotNetCore```**

    ![Image](/images/lab-1.1-image4.png)

7. Verify that permissions has been changed on the executable.
8. Type **ls**, the scroll up and locate **SenseHATDotNetCore**, it should be green.

    ![Image](/images/lab-1.1-image5.png)

9.  To execute the code, type **```./SenseHATDotNetCore```**

    > Note: If all went well, you should see each record in JSON format being sent up to the IoT Hub.

10.  Press **Cntl-C** to stop.

        ![Image](/images/lab-1.1-image6.png)

## Verify data is being sent to Azure IoT Hub

1. Go to the **Azure Portal**
2. Select your **IotHub**
3. Select the **Overview** menu on the left
4. Scroll to bottom of blade and select **Device to cloud messages**
5. On the **Metrics** page, change the timeframe to **Last 30 minutes**.

    ![Image](/images/lab-1.1-image7.png)


## Reference Sites

[Getting started with Visual Studio Code and C#][Get-Started]

[Debugging in Visual Studio Code][vs-code-debug]

[Azure-Portal]: https://portal.azure.com/ 

[Get-Started]: https://docs.microsoft.com/en-us/dotnet/core/tutorials/with-visual-studio-code

[vs-code-debug]: https://code.visualstudio.com/Docs/editor/debugging

