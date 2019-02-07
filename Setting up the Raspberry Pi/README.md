# Setting up the Raspberry Pi

## Install Raspbian

- Install Raspbian on your Pi.
    - Create a working folder on c: drive, name it **Raspbian**
    - Click [Raspbian Stretch with desktop](https://www.raspberrypi.org/downloads/
), then click **Download Zip** and save it to **C:\Raspbian**.
    - From Windows Explorer, navigate to **C:\Raspbian**.
    - Open a **Command Prompt** as **Adminstrator** and navigate to **C:\Raspbian**.
    - After download completes, **Right-Click** on **2018-xxx.zip** file to unzip the contents and create the **2018-xxx.img** file.
    - Insert & format the SD Card using a SD formatting tool.
        - Use [SD Memory Card Formatter](https://www.sdcard.org/downloads/formatter_4/eula_windows/index.html) tool.
    - Burn the file **2018-xxx.img** file to the SD card.
        - Use [BalenaEtcher](https://www.balena.io/etcher/?ref=etcher_footer) burning tool.
    
    > 🚨 **EXTREMELY IMPORTANT** - Once flashing is complete, create a new empty text file named **ssh** (with no extension) in the **root folder** of the SD card drive.
    - Eject the SD card and insert it into the slot on the Raspberry Pi.
    - Plug the Raspberry Pi into your network via RJ45 ethernet cable.
        > Note: The PI does not have anything to allow ethernet bridging over USB.  TBD if using the internet sharing feature in Win10 to setup another hotspot and let the pi connect to that?

    - Plug power into the Raspberry Pi.
    - Wait 4-5 min for it to fully boot up.
        - Grab another cup of joe! :coffee: while you wait.
    - Locate the IP address which has been assigned by your DHCP server to the Raspberry Pi and make note of it.
    - Option 1: Open a Command Prompt as an Administrator.
        - type: **ping -c 1 raspberrypi.local** to get it.
    - Option 2: open up browser to your routers home page.
        - ie. http://192.168.1.254 and list out your devices.

            ![Image](/images/settingupthepi-1.png)

## Telnet into the Raspberry Pi using SSH

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

## Update the Raspberry Pi package list
- Entering the following command to update the package list
    - **sudo apt-get -y update**

## Install .Net Core Runtime 2.2

The following commands need to be run on the Raspberry Pi whilst connected over an SSH session.

> Note: This will use the apt-get package manager to install three prerequiste packages.
1) **```sudo apt-get -y install libunwind8 gettext```**

2) **```wget https://dotnetcli.blob.core.windows.net/dotnet/Sdk/2.2.103/dotnet-sdk-2.2.103-linux-arm.tar.gz```**

3) **```wget https://dotnetcli.blob.core.windows.net/dotnet/aspnetcore/Runtime/2.2.1/aspnetcore-runtime-2.2.1-linux-arm.tar.gz```**

4) **```sudo mkdir /opt/dotnet```**

5) **```sudo tar -xvf dotnet-sdk-2.2.103-linux-arm.tar.gz -C /opt/dotnet/```**

> Note: This creates a destination folder and extract the downloaded package into it.
6) **```sudo tar -xvf aspnetcore-runtime-2.2.1-linux-arm.tar.gz -C /opt/dotnet/```**

> Note: This sets up a symbolic link.
7) **```sudo ln -s /opt/dotnet/dotnet /usr/local/bin```**

> Note: The Raspberry Pi itself is supported only as deployment target to run .Net Core apps.  Type the following to confirm installation.
8) **```dotnet --info```**

    ![Image](/images/settingupthepi-2.png)


## ~~Install~~ Docker, coming soon...(Randy is working on this)
<!--
The following commands need to be run on the Raspberry Pi whilst connected over an SSH session.
- Enter the following commands to install docker.
    - **```curl -sSL https://get.docker.com | sh```**
    - **sudo usermod -aG docker pi**

--->

## Change the Timezone
- Entering the following command to run raspi-config
    - **sudo raspi-config**
    - Select **Localisation Options**
    - Select **Change Timezone**
    - Select **US**
    - Select **Eastern**
    - Select **Finish**
    - Type **cat /etc/timezone** to verify.

## Enable WiFi (Optional)
- Entering the following command to run raspi-config
    - **sudo raspi-config**
    - Select **Network Options**
    - Select **Wi-Fi**
    - Select **US**
    - Enter **Enter SSID**
    - Enter **Passphrase**
    - Select **Ok**
    - Select **Finish**

## Change the Device Name
- Entering the following command to change the device name using the city abbrev. in table below using number scheme 01 through 10.
    - **sudo nano /etc/hostname**
        - i.e. **raspberrypi-<**abbreviation**>-01**, See table below for names.
    - Press **ctrl-X**, press **Y**, press **Enter** to save file.

        City Name | Abbreviation 
        ------------ | -------------
        Detroit | det - i.e. raspberrypi-**det**-01
        Pittsburgh | pit - i.e. raspberrypi-**pit**-01
        Cleveland | cle - i.e. raspberrypi-**cle**-01
        Cincinnati | cin - i.e. raspberrypi-**cin**-01
        Indianapolis | ind - i.e. raspberrypi-**ind**-01

    - You must reboot the device for changes to take effect.  Type the following to reboot.
        - **sudo reboot**
    - Telnet back into the Raspberry Pi using SSH (see above)
    - After you login, **verify** the device name has been updated.

![Image](/images/settingupthepi-3.png)

## Create application folders
- Telnet back into the Raspberry Pi using SSH (see above)
    - After you login, **verify** the device name has been updated.
    - Entering the following commands to create folders
    - **sudo mkdir SenseHATDotNetCore**
        - Change ownership: **sudo chown pi:pi -R SenseHATDotNetCore**
    - **sudo mkdir SenseHATDotNetCoreSimulation**
        - Change ownership: **sudo chown pi:pi -R SenseHATDotNetCoreSimulation**
    - **sudo mkdir SimulatedDevice**
        - Change ownership: **sudo chown pi:pi -R SimulatedDevice**
    - **sudo cd SimulatedDevice**
    - **sudo mkdir data**
        - Change ownership: **sudo chown pi:pi -R data**

## Acknowledgements
- These instructions were based off of the following blog, [Set up Raspian and .NET Core 2.0 on a Raspberry Pi](https://blogs.msdn.microsoft.com/david/2017/07/20/setting_up_raspian_and_dotnet_core_2_0_on_a_raspberry_pi/)

