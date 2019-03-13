# This ReadMe contains the steps for finding your Raspberry Pi MAC address, adding them to the MSFT network, and finding the assigned IP on the day of the event

# Important Note

It is strongly recommended you head to the office with an HDMI cable, monitor with HDMI support, and a USB keyboard in order to connect to the Pi devices in the event there is an issue connecting. Without this you will have no visibility into the status of the Pi.

# Notes and Script Pre-requisites

The best practice to run the script is to clone the entire repo to your local machine. Open a PowerShell prompt and issue the command below.

>- git clone https://github.com/Azure/IoT-Pi-Day.git 

From PowerShell browse to the folder where this script lives and run it from there. Issue a "git pull" before you run the script to grab the latest version. There is a lot of detail in the script itself. You can access this documentation in PowerShell with help -full.

>- help .\pingaddresses.ps1 -full

You need the PowerShell AZ module installed prior to running the script. You must do this in a PowerShell prompt with elevated 
privileges (run as administrator). Full details are here: https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-1.4.0

>- Install-Module -Name Az -AllowClobber

Google Chrome is caching/not relaoding the iFrame in all cases for the web site after the script runs. If you are using Chrome and run the script successfully (devices are identified), but the site page: https://glrpiday.z20.web.core.windows.net/ shows no new added systems right click in the table and choose "reload frame". Reloading the page will not address the issue, you must click inside the table view and choose "reload frame".

>- Note: This is unlikely to be an issue for customers the day of the event as it will be the first time they access the page.

If you have not set your PowerShell execution policy you will need to allow your session to run unsigned remote scripts to be able to actually run the script. Choose to run the PowerShell prompt as administrator.

>- Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser

# Finding the Raspberry Pi MAC address

After you run the initial [PI setup guide](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Raspberry%20Pi#setting-up-the-raspberry-pi) you will need to connect each individual Pi device (can be done 1 at a time) to your home wireless network. You will edit a wpa_supplicant.conf file to contain your home WiFi settings: [wpa setup instructions](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Raspberry%20Pi#enable-wifi---option-1) Once you have uploaded your unique wpa_supplicant.conf file to the SD card and booted the Pi you will need to login to your home network router.

From here you can find the IP address (and perhaps MAC) assigned to your Pi device. 

> - Note: It is important to grab the wlan0 interface MAC as this is the wireless hardware. If you hardwire your device you can use the ethernet port to connect, but you will need to run: "ifconfig -a" in order to identify the wlan0 hardware MAC.

> - Note: Your home router interface may not match the screenshot below:

![Image](/images/network/homeroute.jpg)


Once you find the device validate you can connect to it by opening a PowerShell prompt and pinging the assigned IP:

> - Note: If you do not see a listing for the device in your home router or the device does not respond to ping after it has booted (green light on the board stops blinking) press the on/off switch on the Pi power adapter, wait until the green light stops flashing, and then check again.

![Image](/images/network/pingaddress.jpg)

You can also issue an "arp -a" to find the MAC address of the device:

![Image](/images/network/arp.jpg)

At this point you should SSH into the device and [update the host name](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Raspberry%20Pi#change-the-device-name).

> - Note: It is advisable to physically label the Pi devices after you rename them in order to identify which device is which in the event we need to troubleshoot a specific device.

# Adding the Pi MAC address to the CSV file

Add the MAC address of the device to the matching host name that you assigned above to the following CSV file [GitHub MAC CSV File](https://github.com/Azure/IoT-Pi-Day/blob/master/Setting%20up%20the%20Raspberry%20Pi/MSFT%20Networking/piMaclist.csv). You can edit this natively in GitHub.

![Image](/images/network/editCSV.jpg)

> - Note: Linux formats the MAC address with a : delimiter, <strike>but the PowerShell script does not take this into account. So if you have a : separated MAC when you add it to the CSV file make sure to separate the elements with a - I may fix this via the script but have not commited to it yet.</strike> The PowerShell script will check for a : delimiter and convert it to the Windows - format as necessary. 

![Image](/images/network/editCSV2.jpg)

# Register the device on the MSFT Guest Network

In order for the devices to connect to the MSFT Guest network the Pi devices need to have their MAC addresses white listed. On the Microsoft corp network head to https://openwifi/

Add the device MAC addresses and give a name to the event. 

![Image](/images/network/openwifi1.jpg)

 - Once you click register you should see a page indicating the device was successfully white listed.

![Image](/images/network/openwifi2.jpg)

- If you click on "Manage MAC" you will be able to see all the devices you have registered and the device expiration date.

![Image](/images/network/openwifi3.jpg)

# Event Day Settings

Download the Pi Day MAC to IP PowerShell script below and place it on your local computer (Right click and choose "save link as").

[Pi Day MAC to IP Script](https://raw.githubusercontent.com/Azure/IoT-Pi-Day/master/Setting%20up%20the%20Raspberry%20Pi/MSFT%20Networking/pingaddresses.ps1)

You will need to create an environmental variable on your local computer with the Azure Blob Storage Account Access Key. The environmental variable should be named "pidayblob" and the key value can be found and copied/pasted from the Teams Site [Storage Account Key](https://microsoft.sharepoint.com/teams/AzurePiDayEvent/Shared%20Documents/General/pidayblobkey.txt).

- Click the start menu and type environmental

![Image](/images/network/variable1.jpg)

- Click on "Environmental Variables"

![Image](/images/network/variable2.jpg)

- Create the pidayblob variable and set the value to the key from the OneNote

![Image](/images/network/variable3.jpg)


On the day of the event or the day prior you will need to replace the wpa_supplicant.conf file on each device SD card from your home network config (used to obtain the MAC address) to the MSFT Guest network. You can copy and paste the contents of the [proper config file here](https://raw.githubusercontent.com/Azure/IoT-Pi-Day/master/Setting%20up%20the%20Raspberry%20Pi/MSFT%20Networking/wpa_supplicant.conf) into a new wpa_supplicant.conf file.

Drag and drop that file to the root of the SD card the same way as for the intial home config.

The local event host should connect their laptop to the Microsoft guest network in order to be on the same broadcast domain as the Pi devices.

![Image](/images/network/laptopguest.jpg)

Once you have connected to the local MSFT Guest network open a PowerShell prompt and type: ipconfig
Look for the network IP address and subnet mask for the guest network at your office location.

This is the final step where you will run the script downloaded locally and use your local city identifier (cin, cle, det, ind, pit, roc), the IP address identified from ipconfig output, and the subnet mask from the same output. Navigate to where you download the script and run it (this is the Indianapolis syntax): ./pingipaddresses ind 10.104.70.8 255.255.252.0

![Image](/images/network/laptopguest2.jpg)

The script will run and identify locally connected devices. If the devices are not identified power them off/on physically and re-run the script. The data is accessible over a public endpoint hosted as a static website on Azure Blob storage: [Pi Day Site](https://glrpiday.z20.web.core.windows.net/)

The script will launch the site, but users on their local devices will also be able to access. Click on the city for your event to see which devices are online and accessible. There are also connect strings for each user of the device for the labs.

![Image](/images/network/pidaysite.jpg)
