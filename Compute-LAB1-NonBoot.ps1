$entry=bcdedit /v | select-string identifier | select -first 1
$entry=$entry.tostring()
$entry=$entry.split("{")
$entry="{"+$entry[1]
cmd /c "bcdedit /delete $entry /f"
