$prefix = "10.104." # // Set your local guest wi-fi network IP prefix here
$suffix = 68 # // Set your local guest wi-fi network IP suffix here (10.104.68)

$i = 1
$loop = 1
$loopCount = 1
$totalCount = 1
$addressCount = 10 * $loopCount

$fileURL = "https://raw.githubusercontent.com/Azure/IoT-Pi-Day/master/Setting%20up%20the%20Raspberry%20Pi/MSFT%20Networking/piMaclist.csv"

$deviceListBuf = @()
$deviceListCin = @()
$deviceListCle = @()
$deviceListDet = @()
$deviceListInd = @()
$deviceListPit = @()

$storageAccountName = "glrpiday"
$storageAccountKey = $env:pidayblob
$containerName = "`$web"
$ctx = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey

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

    do { 

        ping $prefix$suffix"."$i -n 1 -w 2 | Out-Null
        Write-Progress -Activity "Finding devices" -CurrentOperation $prefix$suffix"."$i -PercentComplete (($totalCount / $addressCount) * 100)
        $i ++
        $totalCount ++

        }

    while ($i -le $addressCount)

    $loop ++
    $suffix ++
    $i = 1

    }

while ($loop -le $loopCount)

Clear-Host

# // Loop through all devices in list and match IP address to MAC and return device name and IP

foreach ($device in $inputFile) {

    if ($device.DeviceName -eq "") { continue }

    $piIP = arp -a | select-string $device.MacAddress | foreach { $_.ToString().Trim().Split(" ")[0] }

    if ($piIP -eq $null) {$piIP = "Device Not Found"; $connectString = ""} else {$connectString = "ssh pi@$piIP"}

    $deviceObj = New-Object System.Object
    $deviceObj | Add-Member -NotePropertyName DeviceName -NotePropertyValue $device.DeviceName
    $deviceObj | Add-Member -NotePropertyName IPAddress -NotePropertyValue $piIP
    $deviceObj | Add-Member -NotePropertyName ConnectString -NotePropertyValue $connectString

    If ($deviceObj.DeviceName.split("-")[1] -eq "buf") { $deviceListBuf += $deviceObj }
    If ($deviceObj.DeviceName.split("-")[1] -eq "cin") { $deviceListCin += $deviceObj }
    If ($deviceObj.DeviceName.split("-")[1] -eq "cle") { $deviceListCle += $deviceObj }
    If ($deviceObj.DeviceName.split("-")[1] -eq "det") { $deviceListDet += $deviceObj }
    If ($deviceObj.DeviceName.split("-")[1] -eq "ind") { $deviceListInd += $deviceObj }
    If ($deviceObj.DeviceName.split("-")[1] -eq "pit") { $deviceListPit += $deviceObj }
    
    Write-Host $device.DeviceName  " "  $piIP

}

# // Create HTML file with device name and IP address

$deviceListBuf | ConvertTo-Html -Head $Header | Out-File buf.html
$deviceListCin | ConvertTo-Html -Head $Header | Out-File cin.html
$deviceListCle | ConvertTo-Html -Head $Header | Out-File cle.html
$deviceListDet | ConvertTo-Html -Head $Header | Out-File det.html
$deviceListInd | ConvertTo-Html -Head $Header | Out-File ind.html
$deviceListPit | ConvertTo-Html -Head $Header | Out-File pit.html

# // Write files to Azure Blob storage

Set-AzStorageBlobContent -File "buf.html" -Container $containerName -Blob "city/buf.html" -Properties @{"ContentType" = "text/html"} -Context $ctx -Force
Remove-Item "buf.html" -Force
Set-AzStorageBlobContent -File "cin.html" -Container $containerName -Blob "city/cin.html" -Properties @{"ContentType" = "text/html"} -Context $ctx -Force
Remove-Item "cin.html" -Force
Set-AzStorageBlobContent -File "cle.html" -Container $containerName -Blob "city/cle.html" -Properties @{"ContentType" = "text/html"} -Context $ctx -Force
Remove-Item "cle.html" -Force
Set-AzStorageBlobContent -File "det.html" -Container $containerName -Blob "city/det.html" -Properties @{"ContentType" = "text/html"} -Context $ctx -Force
Remove-Item "det.html" -Force
Set-AzStorageBlobContent -File "ind.html" -Container $containerName -Blob "city/ind.html" -Properties @{"ContentType" = "text/html"} -Context $ctx -Force
Remove-Item "ind.html" -Force
Set-AzStorageBlobContent -File "pit.html" -Container $containerName -Blob "city/pit.html" -Properties @{"ContentType" = "text/html"} -Context $ctx -Force
Remove-Item "pit.html" -Force