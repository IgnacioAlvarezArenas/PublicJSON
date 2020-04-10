$disk=get-disk | ? {$_.friendlyname -like "*Msft*"}
$disk | Initialize-Disk -PassThru
new-partition -DiskNumber $disk.number -UseMaximumSize -AssignDriveLetter
$entry=bcdedit /v | select-string identifier 
$entry=$entry[1]
$entry=$entry.tostring()
$entry=$entry.split("{")
$entry="{"+$entry[1]
cmd /c "bcdedit /set $entry device partition=F:"
cmd /c "bcdedit /set $entry osdevice partition=F:"
shutdown /r /t 10 /f
