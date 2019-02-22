$prefix = "10.84.27." # // Set your local guest wi-fi network IP prefix here
$addressCount = 254
$i = 1
$fileURL = "https://raw.githubusercontent.com/Azure/IoT-Pi-Day/master/Setting%20up%20the%20Raspberry%20Pi/MSFT%20Networking/piMaclist.csv"
$deviceList = @()

$Header = @"
<style>
TABLE {border-width: 2px; border-style: solid; border-color: blue; border-collapse: collapse;}
TD {border-width: 2px; padding: 2px; text-align: center; border-style: solid; border-color: blue;}
</style>
"@

# // Grab master CSV list from GitHub and convert URL object content to CSV

$inputFile = Invoke-WebRequest $fileURL
$inputFile = $inputFile.Content
$inputFile = ConvertFrom-Csv -InputObject $inputFile

# // Ping all network devices to build local arp table

do { 

    ping $prefix$i -n 1 -w 2 | Out-Null
    Write-Progress -Activity "Finding devices" -CurrentOperation $prefix$i -PercentComplete (($i / $addressCount) * 100)
    $i ++

    }
while ($i -le $addressCount)

# // Loop through all devices in list and match IP address to MAC and return device name and IP

foreach ($device in $inputFile) {

    if ($device.DeviceName -eq "") { continue }

    $piIP = arp -a | select-string $device.MacAddress | foreach { $_.ToString().Trim().Split(" ")[0] }

    if ($piIP -eq $null) {$piIP = "Device Not Found"; $connectString = ""} else {$connectString = "ssh pi@$piIP"}

    $deviceObj = New-Object System.Object
    $deviceObj | Add-Member -NotePropertyName DeviceName -NotePropertyValue $device.DeviceName
    $deviceObj | Add-Member -NotePropertyName IPAddress -NotePropertyValue $piIP
    $deviceObj | Add-Member -NotePropertyName ConnectString -NotePropertyValue $connectString

    $deviceList += $deviceObj

    Write-Host $device.DeviceName  " "  $piIP

}

# // Create HTML file with device name and IP address

$deviceList | ConvertTo-Html -Head $Header | Out-File city.html