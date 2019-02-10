# Setting up the Raspberry Pi

## Estimated time to complete
- TBD

## Install Raspbian

- Install Raspbian on your Pi.
    - Create a working folder on c: drive, name it **Raspbian**
    - Click [Raspbian Stretch with desktop](https://www.raspberrypi.org/downloads/raspbian
), then click **Download Zip** and save it to **C:\Raspbian**.
    - From Windows Explorer, navigate to **C:\Raspbian**.
    - After download completes, **Right-Click** on **2018-xxx.zip** file to unzip the contents.  This creates the **2018-xxx.img** file.
    

        > Note: You'll need a microSD Card Adapter for the MicroSD card.
    
    - Insert & format the microSD Card using a SD formatting tool.
        - Use [SD Memory Card Formatter](https://www.sdcard.org/downloads/formatter_4/eula_windows/index.html) tool.
    - Burn the file **2018-xxx.img** file to the microSD card.
        - Use [BalenaEtcher](https://www.balena.io/etcher/?ref=etcher_footer) burning tool.
    
> 🚨 **EXTREMELY IMPORTANT** - Once flashing is complete, create a new empty text file named **ssh** (with no extension) in the **root folder** of the microSD card drive.  If this step is missed, you will **NOT** be able to SSH into the Rasberry Pi.

- Eject the microSD card and insert it into the slot on the Raspberry Pi.
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

- **Option 2** - Use Windows 10
    - Click [How to Enable and Use Windows 10’s New Built-in SSH Commands](https://www.howtogeek.com/336775/how-to-enable-and-use-windows-10s-built-in-ssh-commands/)

- **Option 3** - Use your favorate SSH tool.

## Update the default password
- To login in, enter **pi** as the logon name, and **raspberry** as the password.
- Change the default password for the **pi** user .
    - Type **passwd** to change it to **Password.1.!!** for the current user.

## Update the Raspberry Pi package list
- Entering the following command to update the package list
    - **```sudo apt-get -y update```**

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

<!--
## Install Docker
The following commands need to be run on the Raspberry Pi whilst connected over an SSH session.
- Enter the following commands to install docker.
    - **```curl -sSL https://get.docker.com | sh```**
    - **```sudo usermod -aG docker pi```**

- Verify docker installation (will see docker stats)
    - **```sudo docker info```**

- Verify docker installation (will see ASCII art)
    - **```sudo docker run --rm microsoft/dotnet-samples```**

        ![Image](/images/settingupthepi-5.png)
-->

## Change the Timezone
- Entering the following command to run raspi-config
    - **```sudo raspi-config```**
    - Select **Localisation Options**
    - Select **Change Timezone**
    - Select **US**
    - Select **Eastern**
    - Select **Finish**
    - Type **```sudo cat /etc/timezone```** to verify.

## Enable WiFi (Optional)
- Entering the following command to run raspi-config
    - **```sudo raspi-config```**
    - Select **Network Options**
    - Select **Wi-Fi**
    - Select **US**
    - Enter **Enter SSID**
    - Enter **Passphrase**
    - Select **Ok**
    - Select **Finish**

## Change the Device Name
- Entering the following command to change the device name using the city abbrev. in table below using number scheme 01 through 10.
    - **```sudo nano /etc/hostname```**
    - **```sudo nano /etc/hosts```**
        - i.e. **raspberrypi-<**abbreviation**>-01**, See table below for names.
    - Copy this table to a Word document and update the MAC Addresses. This info is a MUST to conect to Microsoft WiFi, see **Find the MAC Address** below.
    - Press **ctrl-X**, press **Y**, press **Enter** to save file.

        City Name | Device Name | MAC Address
        ------------ | ------------- | -------------
        Detroit | raspberrypi-**det-01** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-02** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-03** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-04** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-05** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-06** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-07** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-08** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-09** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-10** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-11** | 00:00:00:a1:2b:cc
        Detroit | raspberrypi-**det-12** | 00:00:00:a1:2b:cc
        ------------ | ------------- | -------------
        Pittsburgh | raspberrypi-**pit-01** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-02** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-03** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-04** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-05** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-06** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-07** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-08** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-09** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-10** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-11** | 00:00:00:a1:2b:cc
        Pittsburgh | raspberrypi-**pit-12** | 00:00:00:a1:2b:cc
        ------------ | ------------- | -------------        
        Cleveland | raspberrypi-**cle-01** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-02** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-03** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-04** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-05** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-06** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-07** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-08** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-09** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-10** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-11** | 00:00:00:a1:2b:cc
        Cleveland | raspberrypi-**cle-12** | 00:00:00:a1:2b:cc
        ------------ | ------------- | -------------  
        Cincinnati | raspberrypi-**cin-01** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-02** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-03** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-04** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-05** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-06** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-07** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-08** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-09** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-10** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-11** | 00:00:00:a1:2b:cc
        Cincinnati | raspberrypi-**cin-12** | 00:00:00:a1:2b:cc
        ------------ | ------------- | -------------  
        Indianapolis | raspberrypi-**ind-01** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-02** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-03** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-04** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-05** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-06** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-07** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-08** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-09** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-10** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-11** | 00:00:00:a1:2b:cc
        Indianapolis | raspberrypi-**ind-12** | 00:00:00:a1:2b:cc


    - You must reboot the device for changes to take effect.  Type the following to reboot.
        - **```sudo reboot```**
    - Telnet back into the Raspberry Pi using SSH (see above)
    - After you login, **verify** the device name has been updated.

![Image](/images/settingupthepi-3.png)

## Find the MAC Address
- To find the MAC address from the command line you need to know the name of the interface. The Ethernet interface used to be called “eth0” but in newer versions of Raspbian it may be “enx########” where ######## is the MAC address. This means the Ethernet interface name is unique for every Pi. The first WiFi interfaces is still named “wlan0”.

    - From the command line, type:
        - **```ls /sys/class/net/```**  : This will list all the adapters such as wlan0
        - **```cat /sys/class/net/wlan0/address```** : This command obtains the mac address for the requested adapter

## Create User Accounts
- Entering the following command to create the two user accounts and add them to the Admin Group.
    - **```sudo adduser pi1```**
    - **```sudo usermod -a -G pi1,adm,sudo,audio,video,plugdev,users,input,netdev,spi,i2c,gpio pi1```**
    - **```sudo adduser pi2```**
    - **```sudo usermod -a -G pi2,adm,sudo,audio,video,plugdev,users,input,netdev,spi,i2c,gpio pi2```**

    > Note: During account created, when prompted for a new password, **Password.1.!!**.
<!--
- Elevate permissions to run Docker containers
    - **```sudo usermod -a -G docker pi1```**
    - **```sudo usermod -a -G docker pi2```**
-->

## Create application folders
- Telnet back into the Raspberry Pi using SSH (see above)
    - After you login, **verify** the device name has been updated.

    - Type **```cd ..```** to change to the root /home folder.

        ![Image](/images/settingupthepi-4.png)

    - Entering the following commands to create folders for both user accounts.

    **User: Pi1**
    - **```sudo mkdir "/home/pi1/SenseHATDotNetCore"```**
        - Change ownership: **```sudo chown pi:pi -R "/home/pi1/SenseHATDotNetCore"```**
    - **```sudo mkdir "/home/pi1/SenseHATDotNetCoreSimulation"```**
        - Change ownership: **```sudo chown pi:pi -R "/home/pi1/SenseHATDotNetCoreSimulation"```**
    - **```sudo mkdir "/home/pi1/SimulatedDevice"```**
        - Change ownership: **``sudo chown pi:pi -R "/home/pi1/SimulatedDevice"``**
    - **```sudo mkdir "/home/pi1/SimulatedDevice/data"```**
        - Change ownership: **``sudo chown pi:pi -R "/home/pi1/SimulatedDevice/data"``**

   **User: Pi2**
    - **```sudo mkdir "/home/pi2/SenseHATDotNetCore"```**
        - Change ownership: **```sudo chown pi:pi -R "/home/pi2/SenseHATDotNetCore"```**
    - **```sudo mkdir "/home/pi2/SenseHATDotNetCoreSimulation"```**
        - Change ownership: **```sudo chown pi:pi -R "/home/pi2/SenseHATDotNetCoreSimulation"```**
    - **```sudo mkdir "/home/pi2/SimulatedDevice"```**
        - Change ownership: **``sudo chown pi:pi -R "/home/pi2/SimulatedDevice"``**
    - **```sudo mkdir "/home/pi2/SimulatedDevice/data"```**
        - Change ownership: **``sudo chown pi:pi -R "/home/pi2/SimulatedDevice/data"``**

## Acknowledgements
- These instructions were based off of the following blog, [Set up Raspian and .NET Core 2.0 on a Raspberry Pi](https://blogs.msdn.microsoft.com/david/2017/07/20/setting_up_raspian_and_dotnet_core_2_0_on_a_raspberry_pi/)

