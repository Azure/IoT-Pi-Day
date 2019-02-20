$prefix = "192.168.10." # // Set your local guest wi-fi network IP prefix here
$addressCount = 254
$i = 1
$fileURL = "https://raw.githubusercontent.com/Azure/IoT-Pi-Day/master/Setting%20up%20the%20Raspberry%20Pi/MSFT%20Networking/piMaclist.csv"

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

    $piDevice = arp -a | select-string $device.MacAddress | foreach { $_.ToString().Trim().Split(" ")[0] }
    Write-Host $device.DeviceName  " "  $piDevice

}