<#

.SYNOPSIS
    Script to ping address range, build local ARP table, and match IP to MAC in CSV list.

.DESCRIPTION
    This script was built to support a "Pi Day" workshop run by Microsoft to identify the DHCP IP address assigned
    to a headless Raspberry Pi device. 
    
    There is a requirement to have the Azure AZ PowerShell Module installed to write to blob storage. You can find 
    instructions for install in the links section.

    The CSV file is stored in a GitHub Repo with the MAC address and location/device
    name of the Pi devices. The format of the CSV is as follows with the cit field being a 3 letter city identifier:
    
    DeviceName, MacAddress
    name-cit-num, b8:27:eb:41:25:5e

.PARAMETER city
    Three letter city prefix that designates the name of the City to match in the CSV file and the name of created HTML file

.PARAMETER ipaddress
    IP address that is part of the same network you are scanning
    This can be any IP in the network range as the script always scans from 1-254

.PARAMETER subnet
    Subnet mask in 0.0.0.0 form that combined with IP address will determine the amount of addresses to ping

.EXAMPLE
    ./pingaddresses.ps1 ind 172.16.20.1 255.255.252.0

.NOTES
    There is a requirement to have the AZ PowerShell module installed. See the link section of the notes for the URL.
    The IP address/subnet range uses script found in the links section.
    There is a decent amount of technical debt and feature/functions to add. In no particual order here are the needs.

        1. Better error checking/handling
        2. Parrallel processing (scanning large IP ranges takes a long time, should fire multiple at once)
        3. IP scan range is hard-coded to 254, this should be variable based on the network range
        4. Script has hard-coded city names, maybe there is a better way to handle that (file?)
        5. Could use more documentation in the script
        6. Right now a user can overwrite another users city by specifying that ID, would be nice to have a way to stop that
        7. Would be nice to leverage KeyVault for the Blob Account Key
        8. Adding a "click to copy" for the SSH connect sctrings

.LINK
    Azure PowerShell AZ: https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-1.4.0
    Sample CSV file: https://github.com/Azure/IoT-Pi-Day/blob/master/Setting%20up%20the%20Raspberry%20Pi/MSFT%20Networking/piMaclist.csv
    Identify Address Range Script: http://www.itadmintools.com/2011/08/calculating-tcpip-subnets-with.html

#>

[CmdletBinding()]
    Param(
        [Parameter(Position=0,Mandatory)]
        [ValidateSet("cin","cle","det","ind","pit", "roc")]
        [string]$city,
        [Parameter(Position=1,Mandatory)]
        [string]$ipaddress,
        [Parameter(Position=2,Mandatory)]
        [string]$subnetMask
)

# // Check for storage account key variable, if empty launch OneNote with key

if ($env:pidayblob -eq $null) { 
    write-host " "
    write-host "Please set an environmental variable named: pidayblob"
    write-host "Set the value of pidayblob equal to the storage account key"
    write-host " "
    write-host "Launching browser with link to key in OneNote..."
    Start-Sleep -seconds 5
    start "https://microsoft.sharepoint.com/teams/AzurePiDayEvent/Shared%20Documents/General/pidayblobkey.txt"
    exit
}

# // Start Function toBinary to convert IP address to binary to find range to scan

function toBinary ($dottedDecimal){

    $dottedDecimal.split(".") | %{$binary=$binary + $([convert]::toString($_,2).padleft(8,"0"))}
    return $binary

} # // End Function toBinary

# // Start Function toDottedDecimal to convert subnet mask to decimal to identify network range to scan

function toDottedDecimal ($binary){

    do {$dottedDecimal += "." + [string]$([convert]::toInt32($binary.substring($i,8),2)); $i+=8 } while ($i -le 24)
    return $dottedDecimal.substring(1)

   } # // End Function toDottedDecimal

# // Call toBinary function to convert IP address and subnet

$ipaddress = toBinary $ipaddress
$subnetMask = toBinary $subnetMask

# // Find out how manu bits are in the network ID

$netBits=$subnetMask.indexOf("0")
 
# // Validate IP address, exit if there is an error

if (($ipaddress.length -ne 32) -or ($ipaddress.substring($netBits) -eq "00000000") -or ($ipaddress.substring($netBits) -eq "11111111")) {
    
    Write-Warning "IP Address is invalid!"
    Exit
    }

# // Validate subnet mask, exit if there is an error

if (($subnetMask.length -ne 32) -or ($subnetMask.substring($netBits).contains("1") -eq $true)) {

    Write-Warning "Subnet Mask is invalid!"
    Exit

    }

# // Call toDottedDecimal function to find first and last address range

$firstAddress = toDottedDecimal $($ipaddress.substring(0,$netBits).padright(31,"0") + "1")
$lastAddress = toDottedDecimal $($ipaddress.substring(0,$netBits).padright(31,"1") + "0")

# // Set the prefix and suffix to scan

$prefix = $firstAddress.split(".")[0] + "." + $firstAddress.split(".")[1] + "."
$suffix = [convert]::ToInt32($firstAddress.split(".")[2]) # // Convert suffix to integer in order to increment value in loop

# // Determine how many times to loop the ping script based on IP and subnet

$loopCount = ([convert]::ToInt32($lastAddress.split(".")[2]) - $suffix) + 1

# // Set some script variables 

$i = 1
$loop = 1
$addressesToScan = 254
$totalCount = 1
$addressCount = $addressesToScan * $loopCount
$deviceList = @()

# // Set variables and storage context to upload to Azure blob

$storageAccountName = "glrpiday"
$storageAccountKey = $env:pidayblob
$containerName = "`$web"
$ctx = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey

$Header = @"
<style>
TABLE {border-width: 2px; border-style: solid; border-color: blue; border-collapse: collapse;}
TD {border-width: 2px; padding: 10px; text-align: center; border-style: solid; border-color: blue;}
</style>
"@

# // not using this yet $htmlScript = "<script src=`"https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js`"></script>"

# // Grab master CSV list from GitHub and convert URL object content to CSV

$fileURL = "https://raw.githubusercontent.com/Azure/IoT-Pi-Day/master/Setting%20up%20the%20Raspberry%20Pi/MSFT%20Networking/piMaclist.csv"

$inputFile = Invoke-WebRequest $fileURL
$inputFile = $inputFile.Content
$inputFile = ConvertFrom-Csv -InputObject $inputFile

# // Ping all network devices to build local arp table

do {

    do { 

        ping $prefix$suffix"."$i -n 1 -w 2 | Out-Null
        Write-Progress -Activity "Finding devices" -CurrentOperation $prefix$suffix"."$i -PercentComplete (($totalCount / $addressCount) * 100)
        $i ++
        $totalCount ++

        }

    while ($i -le $addressesToScan)

    $loop ++
    $suffix ++
    $i = 1

    }

while ($loop -le $loopCount)

# // Loop through all devices in list and match IP address to MAC and return device name and IP

foreach ($device in $inputFile) {

    if ($device.DeviceName -eq "") { continue }
    if ($device.DeviceName.split("-")[1] -ne $city) { continue }

    # // Check for non-windows MAC delimiter and convert if required

    if ($device.MacAddress.Contains(":") -eq $true) {

        $nixMAc = $device.MacAddress.split(":")
        $device.MacAddress = $nixMAc[0] + "-" + $nixMAc[1] + "-" + $nixMAc[2] + "-" + $nixMAc[3] + "-" + $nixMAc[4] + "-" + $nixMAc[5]

    }

    $piIP = arp -a | select-string $device.MacAddress | foreach { $_.ToString().Trim().Split(" ")[0] }

    if ($piIP -eq $null) {
        $piIP = "Device Not Found"
        $connectStringU1 = ""
        $connectStringU2 = ""
    } 
    else {
        $connectStringU1 = "ssh pi1@$piIP"
        $connectStringU2 = "ssh pi2@$piIP"
    }

    $deviceObj = New-Object System.Object
    $deviceObj | Add-Member -NotePropertyName DeviceName -NotePropertyValue $device.DeviceName
    $deviceObj | Add-Member -NotePropertyName IPAddress -NotePropertyValue $piIP
    $deviceObj | Add-Member -NotePropertyName User1_ConnectString -NotePropertyValue $connectStringU1
    $deviceObj | Add-Member -NotePropertyName User2_ConnectString -NotePropertyValue $connectStringU2

    $deviceList += $deviceObj

    Write-Host $device.DeviceName  " "  $piIP

}

# // Create HTML file with device name and IP address

$deviceList | ConvertTo-Html -Head $Header | Out-File "$city.html"

# // Write files to Azure Blob storage

Set-AzStorageBlobContent -File "$city.html" -Container $containerName -Blob "city/$city.html" -Properties @{"ContentType" = "text/html"} -Context $ctx -Force
Remove-Item "$city.html" -Force

# // Launch web page with Pi Day device IP addresses

Start-Process https://glrpiday.z20.web.core.windows.net/