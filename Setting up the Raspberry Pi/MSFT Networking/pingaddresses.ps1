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
    start "https://microsoft.sharepoint.com/teams/GLRIntelligentCloudBusiness/_layouts/15/WopiFrame.aspx?sourcedoc={1a1dd006-1921-47cc-982f-17ffc28ec578}&action=edit&wd=target%28Resources.one%7Cbff86843-f761-4bf8-846c-6945cd981ce3%2FNetworking%20Data%7C05f4db38-e8cc-4c78-9e95-cff2945afdc1%2F%29&wdorigin=703"
    exit
}

# // Function to convert IP address to binary to find range to scan

function toBinary ($dottedDecimal){
    $dottedDecimal.split(".") | %{$binary=$binary + $([convert]::toString($_,2).padleft(8,"0"))}
    return $binary
   }

   # // Function to convert subnet mask to decimal to identify network range to scan
   function toDottedDecimal ($binary){
    do {$dottedDecimal += "." + [string]$([convert]::toInt32($binary.substring($i,8),2)); $i+=8 } while ($i -le 24)
    return $dottedDecimal.substring(1)
   }
  
   $ipaddress = toBinary $ipaddress
   $subnetMask = toBinary $subnetMask

   # // how many bits are the network ID

   $netBits=$subnetMask.indexOf("0")
 
   if(($ipaddress.length -ne 32) -or ($ipaddress.substring($netBits) -eq "00000000") -or ($ipaddress.substring($netBits) -eq "11111111")) {
    Write-Warning "IP Address is invalid!"
    Exit

   if(($subnetMask.length -ne 32) -or ($subnetMask.substring($netBits).contains("1") -eq $true)) {
    Write-Warning "Subnet Mask is invalid!"
    Exit
   }

   }

   $firstAddress = toDottedDecimal $($ipaddress.substring(0,$netBits).padright(31,"0") + "1")
   $lastAddress = toDottedDecimal $($ipaddress.substring(0,$netBits).padright(31,"1") + "0")

   $prefix = $firstAddress.split(".")[0] + "." + $firstAddress.split(".")[1] + "."
   $suffix = [convert]::ToInt32($firstAddress.split(".")[2])

$i = 1
$loop = 1

# // Determine how many times to loop the ping script based on IP and subnet

$loopCount = ([convert]::ToInt32($lastAddress.split(".")[2]) - $suffix) + 1

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

    Write-Host $device.MacAddress

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