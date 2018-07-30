param
(
    $username,
    $password
)

schtasks /create /ru $username /rp $password /it /tn AutoIT_Browsing /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserBrowsing.exe /f
schtasks /create /ru $username /rp $password /it /tn AutoIT_Document /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserDocument.exe /f
schtasks /create /ru $username /rp $password /it /tn AutoIT_PowerShell /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserPowerShell.exe /f
schtasks /create /ru $username /rp $password /it /tn AutoIT_Mail /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserWebMail.exe /f

$key = 'HKLM:\\\\SOFTWARE\\\\Microsoft\\\\Windows NT\\\\CurrentVersion\\\\Winlogon'
Set-ItemProperty $key AutoAdminLogon 1
Set-ItemProperty $key DefaultUserName $username
Set-ItemProperty $key DefaultPassword $password
Set-ItemProperty $key DefaultDomainName 'specterpops.local' 
