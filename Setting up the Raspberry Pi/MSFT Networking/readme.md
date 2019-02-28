# This ReadMe contains the steps for finding your Raspberry Pi MAC address, adding them to the MSFT network, and finding the assigned IP on the day of the event


# Finding the Raspberry Pi MAC address

After you run the initial [PI setup guide](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Raspberry%20Pi#setting-up-the-raspberry-pi) you will need to connect each individual Pi device (can be done 1 at a time) to your home wireless network. You will edit a wpa_supplicant.conf file to contain your home WiFi settings: [wpa setup instructions](https://github.com/Azure/IoT-Pi-Day/tree/master/Setting%20up%20the%20Raspberry%20Pi#enable-wifi---option-1) Once you have uploaded your unique wpa_supplicant.conf file to the SD card and booted the Pi you will need to login to your home network router.

From here you can find the IP address (and perhaps MAC) assigned to your Pi device. 

- Note: Your home router interface may not match the screenshot below:

![Image](/images/network/homeroute.jpg)


Once you find the device validate you can connect to it by opening a PowerShell prompt and pinging the assigned IP:

![Image](/images/network/pingaddress.jpg)

You can also issue an "arp -a" to find the MAC address of the device:

![Image](/images/network/arp.jpg)

At this point you should SSH into the device and update the host name per the steps here: 

Linux formats the MAC address with a : delimiter, but the PowerShell script does not take that into account. So if you have a : separated MAC when you add it to the CSV file make sure to separate the elements with a -

It may be advisable to label the Pi devices after you rename them in order to identify which device is which in the event we need to troubleshoot a specific device.

- Note: I have noticed the device will sometimes not connect at first boot. Power on the Pi, wait until the green light stops blinking, press the power button off/on, wait until green li

## Estimated time to complete


This is the per-city network script that will scan the local MSFT Guest network for devices, issue an ARP request, match MAC address to IP, and then dump the results into an HTML file that can be displayed in the event cities to identify assigned IP to Pi devices.

The first step 


Pi Day Site: (https://glrpiday.z20.web.core.windows.net/)