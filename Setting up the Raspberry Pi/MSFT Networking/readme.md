# This ReadMe contains the steps for finding your Raspberry Pi MAC address, adding them to the MSFT network, and finding the assigned IP on the day of the event


# Finding the Raspberry Pi MAC address

After you run the initial [PI setup guide](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Raspberry%20Pi#setting-up-the-raspberry-pi) you will need to connect each individual Pi device (can be done 1 at a time) to your home wireless network. You will edit a wpa_supplicant.conf file to contain your home WiFi settings: [wpa setup instructions](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Raspberry%20Pi#enable-wifi---option-1) Once you have uploaded your unique wpa_supplicant.conf file to the SD card and booted the Pi you will need to login to your home network router.

From here you can find the IP address (and perhaps MAC) assigned to your Pi device. 

- Note: Your home router interface may not match the screenshot below:

![Image](/images/network/homeroute.jpg)


Once you find the device validate you can connect to it by opening a PowerShell prompt and pinging the assigned IP:

- Note: If you do not see a listing for the device in your home router or the device does not respond to ping after it has booted (green light on the board stops blinking) press the on/off switch on the Pi power adapter, wait until the green light stops flashing, and then check again.

![Image](/images/network/pingaddress.jpg)

You can also issue an "arp -a" to find the MAC address of the device:

![Image](/images/network/arp.jpg)

At this point you should SSH into the device and [update the host name](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Raspberry%20Pi#change-the-device-name).

- Note: It is advisable to physically label the Pi devices after you rename them in order to identify which device is which in the event we need to troubleshoot a specific device.

# Adding the Pi MAC address to the CSV file

Add the MAC address of the device to the matching host name that you assigned above to the following CSV file. You can edit this natively in GitHub.

![Image](/images/network/editCSV.jpg)

- Note: Linux formats the MAC address with a : delimiter, but the PowerShell script does not take this into account. So if you have a : separated MAC when you add it to the CSV file make sure to separate the elements with a - I may fix this via the script but have not commited to it yet.

![Image](/images/network/editCSV2.jpg)

# Register the device on the MSFT Guest Network

In order for the devices to connect to the MSFT Guest network the Pi devices need to have their MAC addresses white listed. On the Microsoft corp network head to https://openwifi/

![Image](/images/network/openwifi1.jpg)

Add the device MAC addresses and give a name to the event. Once you click register you should see a page indicating the device was successfully white listed.

![Image](/images/network/openwifi2.jpg)

If you click on "Manage" you will be able to see all the devices you have registered and the device expiration date.

![Image](/images/network/openwifi3.jpg)


Pi Day Site: (https://glrpiday.z20.web.core.windows.net/)