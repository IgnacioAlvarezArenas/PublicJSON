Set-ItemProperty -Path "HKLM:\System\ControlSet001\Services\volmgr" -name Start -Value 4
shutdown /r /t 30 /f