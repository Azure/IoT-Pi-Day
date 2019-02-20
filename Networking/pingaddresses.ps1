$prefix = "192.168.10."
$addressCount = 254
$i = 1

do { 
    ping $prefix$i -n 1 -w 2 | Out-Null
    Write-Progress -Activity "Finding devices" -CurrentOperation $prefix$i -PercentComplete (($i / $addressCount) * 100)
    $i ++
    }
while ($i -le $addressCount)

$inputFile = Import-Csv "piMaclist.csv"

foreach ($device in $inputFile) {

    arp -a | select-string $device.MacAddress |% { $_.ToString().Trim().Split(" ")[0] }

}


