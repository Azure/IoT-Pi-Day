# Lab 1.1 - Reading SenseHat Data
We need to document the scenario here

## Prerequisites
1. The Laptop is setup correctly, see [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).
2.  The IoT Hub must be created and configured
    - To create an IoT Hub, see [Lab 1.0 - Resource Configuration, Section Create an IoT Hub](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.0%20-%20Resource%20Configuration#create-an-iot-hub)

## Estimated time to complete
- TBD

<!--
## 🚨 Content below this line is Under Construction 🚨
-->

## Load SenseHATDotNetCore code

1. Navigate to the Workspace created in [Setting up the Laptop](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Laptop).
2. Open up a **Command Prompt** or **PowerShell** as an **Administrator**.
    - Type **CD C:\Workspace\IoT-Pi-Day-master\IoT-Pi-Day-master\Lab 1 - Getting started with the Sense HAT\Solution\SenseHATDotNetCore**
3.  Enter **code ."** and press return to load project in Visual Studo Code
4. Click **Restore** for the **There are unresolved dependencies** message.

## Azure Credentials

Note:  If this is the first time logging into Azure from Visual Studio Code.

1.  From Visual Studio Code, press **Cntl-Shift-P**
2.  Enter **Azure** and select **Sign in to Azure Cloud**
3. Authenticate to Azure when the dialog box appears.

    > Note: Once you are signed in, close the web page and return to Visual Studio Code.

## Develop SenseHATDotNetCore code

1. From Visual Studio Code, edit the **Program.cs** by clicking on the filename in the left panel.

    ![Image](/images/lab-1.1-image1.png)

2.  Replace <**Your IoT Hub Connnection String**> in **Program.cs** with your connection string from the IotHub.  

    - Go to the **Azure Portal**
    - Select your **IotHub**
    - Select the **IoT Devices** menu on the left
    - Select **your device name** from the window
    - Copy the **connection string (primary key)**.
        > Example:  "HostName=smith-iothub.azure-devices.net;DeviceId=RaspberryPIHostName;SharedAccessKey=WAvH5fGAZHKo6U3ccUBpiHa7r1wETD+9gja/Aim6HiR=";

    ![Image](/images/lab-1.1-image2.png)

2.  Replace <**Your Raspberry Pi Device Name**> in **Program.cs** with your assigned Raspberry Pi device name.  

    ![Image](/images/lab-1.1-image3.png) 

3. Press **Cntrl-S** to save the file.

##  Compile the code
1.  From the command prompt or powershell prompt

2.  Change directory to **Workspace\IoT-Pi-Day-master\IoT-Pi-Day-master\Lab 1 - Getting started with the Sense HAT\Solution\SenseHATDotNetCore** ( if not already in the directory)

3.  Run the following commands:
    - **dotnet clean .**
    - **dotnet build .**
    - **dotnet publish . -r linux-arm**

##  Deploy to Raspberry Pi
1.  From the command prompt or powershell prompt
2.  Type **scp.exe -r .\bin\Debug\netcoreapp2.2\linux-arm\publish\* <**username**>@<**device ip address or name**>:/home/<**username**>/SenseHATDotNetCore**

        scp.exe -r .\bin\Debug\netcoreapp2.2\linux-arm\publish\* pi@raspberrypi-rpagels:/home/pi/SenseHATDotNetCore

3. When prompted to continue to connect, type **yes**.
4. Type in **Password.1.!!** as the password.

## Run the code from the Raspberry Pi

### Telnet into the Raspberry Pi using SSH

- **Option 1** - Use PuTTY
    - Download the PuTTY SSH and Telnet client and launch it.
        - Click [Download PuTTY](https://www.putty.org/) and click **Download it here** to download the latest version. Use the **MSI Windows Installer - 64-bit**.
        - Click **Run** to accept the default prompts.
        - Run **PuTTY** and enter the IP address of the Raspberry Pi and click Open. Accept the message about keys.
        - Enter <**username**> as the logon name, and **Password.1.!!** as the password.

- **Option 2** - Use Windows 10
    - Click [How to Enable and Use Windows 10’s New Built-in SSH Commands](https://www.howtogeek.com/336775/how-to-enable-and-use-windows-10s-built-in-ssh-commands/)

- **Option 3** - Use your favorate SSH tool.

1.  Once you are logged in

2.  Type **cd SenseHATDotNetCore**

3.  Type **chmod 755 SenseHATDotNetCore** ( this only has to be done the first time )

    ![Image](/images/lab-1.1-image4.png)

4. Verify that permissions has been changed on the executable.
5. Type **ls**, the scroll up and locate **SenseHATDotNetCore**, it should be green.

    ![Image](/images/lab-1.1-image5.png)

4.  To execute the code, type **./SenseHATDotNetCore**

    > Note: If all went well, you should see each record in JSON format being sent up to the IoT Hub.

3.  Press **Cntl-C** to stop.

    ![Image](/images/lab-1.1-image6.png)

## Verify data is being sent to Azure IoT Hub

1.  Go to the **Azure Portal**
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

