param
(
    $username,
    $password
)

"Adding AutoIT_Browsing Task" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
schtasks /create /tn Start_User_Sim /sc ONLOGON /tr "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Browsing /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserBrowsing.exe /f" /f
"Adding AutoIT_Document Task" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
schtasks /create /tn Start_User_Sim /sc ONLOGON /tr "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Document /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserDocument.exe /f" /f
"Adding AutoIT_PowerShell Task" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
schtasks /create /tn Start_User_Sim /sc ONLOGON /tr "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_PowerShell /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserPowerShell.exe /f" /f
"Adding AutoIT_Mail Task" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
schtasks /create /tn Start_User_Sim /sc ONLOGON /tr "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Mail /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserWebMail.exe /f" /f


$runonce = 'HKLM:\\\\SOFTWARE\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Run'
Set-ItemProperty $runonce Test "echo text > C:\Users\Public\usersim.txt"
Set-ItemProperty $runonce Start_User_Sim_Browsing "schtasks /create /u specterpops\corpadmin /p corpP@ssw0rd! /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Document /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserDocument.exe /f"
Set-ItemProperty $runonce Start_User_Sim_Document "schtasks /create /u specterpops\corpadmin /p corpP@ssw0rd! /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Document /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserDocument.exe /f"
Set-ItemProperty $runonce Start_User_Sim_PowerShell "schtasks /create /u specterpops\corpadmin /p corpP@ssw0rd! /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_PowerShell /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserPowerShell.exe /f"
Set-ItemProperty $runonce Start_User_Sim_WebMail "schtasks /create /u specterpops\corpadmin /p corpP@ssw0rd! /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Mail /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserWebMail.exe /f" 


"Setting Auto Logon User" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
$key = 'HKLM:\\\\SOFTWARE\\\\Microsoft\\\\Windows NT\\\\CurrentVersion\\\\Winlogon'
Set-ItemProperty $key AutoAdminLogon 1
Set-ItemProperty $key DefaultUserName $username
Set-ItemProperty $key DefaultPassword $password
Set-ItemProperty $key DefaultDomainName 'specterpops.local' 
