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
    - Type **CD C:\Workspace\IoT-Pi-Day-master\IoT-Pi-Day-master\Lab 2 - Working with Hubway Data\Workspace\IotProject**
3.  Enter **dotnet new console -o "simulated-device"**
4.  CD into **simulated-device**
5.  Enter **code .** and press return

## Test Hello World

From the Visual Studio Code

2.  Test the basic Hello World Application from within VS Code
    * Press **Cntl-Shift-U** to view the output window. 
    * Press **Cntl-F5** to run without debugging.
    * When prompted in VS Code to add assets, click **Yes**.
    * You should see **Hello World!** printed in the debug console
    * Once your are satisifed your environment works, remove the program.cs file.
    * From the command prompt, type **del program.cs**

## Azure Credentials

Note:  If this is the first time logging into Azure from Visual Studio Code.

1.  From Visual Studio Code, press **Cntl-Shift-P**
2.  Enter **Azure** and select **Sign in to Azure Cloud**
3. Authenticate to Azure when the dialog box appears.
    > Note: Once you are signed in, close the web page and return to Visual Studio Code.

## Develop simulated-device code

1. From Visual Studio Code, edit the **simulated-device.csproj** by clicking on the filename in the left panel.

2.  Add the ItemGroups from the \Solution\IotProject\simulated-device\simulated-device.csproj

    ![Image](/images/lab-2.1.1-image1.png)

3.  Create a new file called **SimulatedDevice.cs**

    ![Image](/images/lab-2.1.1-image2.png)

4.  Copy the contents of \Solution\IotProject\simulated-device.cs into your new file.
5. Press **Cntrl-S** to save the file.

6. From Visual Studio Code, press **Cntl-Shift-`** to open a new Terminal window
7. Press **Enter** to get the prompt.

8. To  resolve dependancies, type the following at the terminal command prompt.
    - **dotnet add package Microsoft.Azure.Devices.Client --version 1.19.0**

9.  Copy the **\data** directory from **\Solution\IotProject\simulated-device** into your directory.

    ![Image](/images/lab-2.1.1-image3.png)

10.  Replace <**Your IoT Hub Connnection String**> in **simulated-device.cs** with your connection string from the IotHub.  

        - Go to the **Azure Portal**
        - Select your **IotHub**
        - Select the **IoT Devices** menu on the left
        - Select **your device name** from the window
        - Copy the **connection string (primary key)**.
            > Example:  "HostName=smith-iothub.azure-devices.net;DeviceId=RaspberryPIHostName;SharedAccessKey=WAvH5fGAZHKo6U3ccUBpiHa7r1wETD+9gja/Aim6HiR=";

11. Press **Cntrl-S** to save the file.
   
## Test the Function
1. Make sure the Output window is displayed in the bottom panel of Visual studio Code.
    > Note: Press **Cntl-Shift-U** to view the output window. 

2. Press **F5** to run without debugging.

    > Note: If all went well, you should see each record in JSON format being sent up to the IoT Hub.

3.  Press **Shift-F5** to stop.

    ![Image](/images/lab-2.1.1-image4.png)

##  Compile the code in preparation to deploy to Raspberry PI
1.  From the command prompt or powershell prompt

2.  Change directory to **\Workspace\IotProject\simulated-device** ( if not already in ths directory)

3.  Run the following commands:
    - **dotnet clean .**
    - **dotnet build .**
    - **dotnet publish . -r linux-arm**

##  Deploy to Raspberry PI
We need to execute two copy commands
1.  Change directory to **\Workspace\IotProject\simulated-device** ( if not already in ths directory)

2.  Type **scp.exe -r .\bin\Debug\netcoreapp2.2\linux-arm\publish\* <**username**><**device ip address or name**>:/home/<**username**>/SimulatedDevice**

        scp.exe -r .\bin\Debug\netcoreapp2.2\linux-arm\publish\* pi@raspberrypi-rpagels:/home/pi/SimulatedDevice

3. When prompted to continue to connect, type **yes**.
4. Type in the raspberry pi **password**.

5.  Type **scp.exe -r .\data\\\* <**username**><**device ip address or name**>:/home/<**username**>/SimulatedDevice/data**

        scp.exe -r .\data\* pi@raspberrypi-rpagels:/home/pi/SimulatedDevice/data

## Run the code from the Raspberry PI

### Telnet into the Raspberry Pi using SSH

- **Option 1** - Use PuTTY
    - Download the PuTTY SSH and Telnet client and launch it.
        - Click [Download PuTTY](https://www.putty.org/) and click **Download it here** to download the latest version. Use the **MSI Windows Installer - 64-bit**.
        - Click **Run** to accept the default prompts.
        - Run **PuTTY** and enter the IP address of the Raspberry Pi and click Open. Accept the message about keys.
        - Enter **pi** as the logon name, and **raspberry** as the password.
        - Change the default password for the pi user .
            - Type **passwd** to change it to **iotpiday** for the current user.

- **Option 2** - Use Windows 10
    - Click [How to Enable and Use Windows 10’s New Built-in SSH Commands](https://www.howtogeek.com/336775/how-to-enable-and-use-windows-10s-built-in-ssh-commands/)

- **Option 3** - Use your favorate SSH tool.

1.  Once you are logged in

2.  Type **cd SimulatedDevice**

3.  Type **chmod 755 simulated-device** ( this only has to be done the first time )

    ![Image](/images/lab-2.1.1-image5.png)

4. Verify that permissions has been changed on the executable.
5. Type **ls**, the scroll up and locate **simulated-device**, it should be green.

    ![Image](/images/lab-2.1.1-image6.png)

4.  To execute the code, type **./simulated-device**

    > Note: If all went well, you should see each record in JSON format being sent up to the IoT Hub.  There are **60,315 rows** of data being sent to IoT Hub.

3.  Press **Cntl-C** to stop.

    ![Image](/images/lab-2.1.1-image7.png)

## Verify data is being sent to Azure IoT Hub

1.  Go to the **Azure Portal**
2. Select your **IotHub**
3. Select the **Overview** menu on the left
4. Scroll to bottom of blade and select **Device to cloud messages**
5. On the **Metrics** page, change the timeframe to **Last 30 minutes**.

    ![Image](/images/lab-2.1.1-image8.png)

## Reference Sites

[Getting started with Visual Studio Code and C#][Get-Started]

[Debugging in Visual Studio Code][vs-code-debug]

[Azure-Portal]: https://portal.azure.com/ 

[Get-Started]: https://docs.microsoft.com/en-us/dotnet/core/tutorials/with-visual-studio-code

[vs-code-debug]: https://code.visualstudio.com/Docs/editor/debugging

