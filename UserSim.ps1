param
(
    $username,
    $password
)

$run = 'HKLM:\\\\SOFTWARE\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Run'
$admins = @("marilyn.adams", "aubree.jenkins", "daisy.allen", "zoey.shaw", "luis.sanders", "beverly.vargas", "sarah.wells", "melanie.gutierrez", "rosa.jordan", "eugene.sanders", "troy.williamson", "melissa.nichols", "ruben.roberts", "micheal.patterson", "kaylee.edwards", "raul.garcia", "edgar.stone", "joyce.reid", "dianne.brown", "owen.warren", "robin.armstrong", "sebastian.mitchell", "shane.patterson", "gregory.kelley", "nathan.lopez", "olivia.diaz", "adam.gonzales", "marsha.fisher", "luis.snyder", "eleanor.bates")
if($admins -contains $username)
{ 
    Set-ItemProperty $run Start_Admin_Sim_Browsing "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Browsing /sc MINUTE /mo 5 /tr C:\Users\Public\AdminActions\AdminBrowsing.exe /f"
    Set-ItemProperty $run Start_Admin_Sim_Commands "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Commands /sc MINUTE /mo 10 /tr C:\Users\Public\AdminActions\AdminCommands.exe /f"
    #Set-ItemProperty $run Start_Admin_Sim_PowerShell "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_PowerShell /sc MINUTE /mo 5 /tr C:\Users\Public\AdminActions\AdminPowerShell.exe /f"
    Set-ItemProperty $run Start_Admin_Sim_ProcMon "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_ProcMon /sc MINUTE /mo 42 /tr C:\Users\Public\AdminActions\AdminProcMon.exe /f" 
    #Set-ItemProperty $run Start_Admin_Sim_RDP "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_RDP /sc MINUTE /mo 5 /tr C:\Users\Public\AdminActions\AdminRDP.exe /f" 
}
else
{
    Set-ItemProperty $run Start_User_Sim_Browsing "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Browsing /sc MINUTE /mo 7 /tr C:\Users\Public\UserActions\UserBrowsing.exe /f"
    Set-ItemProperty $run Start_User_Sim_Document "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Document /sc MINUTE /mo 20 /tr C:\Users\Public\UserActions\UserDocument.exe /f"
    #Set-ItemProperty $run Start_User_Sim_PowerShell "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_PowerShell /sc MINUTE /mo 5 /tr C:\Users\Public\UserActions\UserPowerShell.exe /f"
    Set-ItemProperty $run Start_User_Sim_WebMail "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn AutoIT_Mail /sc MINUTE /mo 30 /tr C:\Users\Public\UserActions\UserWebMail.exe /f" 
}

"Setting Auto Logon User" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
$key = 'HKLM:\\\\SOFTWARE\\\\Microsoft\\\\Windows NT\\\\CurrentVersion\\\\Winlogon'
Set-ItemProperty $key AutoAdminLogon 1
Set-ItemProperty $key DefaultUserName $username
Set-ItemProperty $key DefaultPassword $password
Set-ItemProperty $key DefaultDomainName 'specterpops.local' 
