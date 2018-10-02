param
(
    $username,
    $password
)

$run = 'HKLM:\\\\SOFTWARE\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Run'
$admins = @("marilyn.adams", "aubree.jenkins", "daisy.allen", "zoey.shaw", "luis.sanders", "beverly.vargas", "sarah.wells", "melanie.gutierrez", "rosa.jordan", "eugene.sanders", "troy.williamson", "melissa.nichols", "ruben.roberts", "micheal.patterson", "kaylee.edwards", "raul.garcia", "edgar.stone", "joyce.reid", "dianne.brown", "owen.warren", "robin.armstrong", "sebastian.mitchell", "shane.patterson", "gregory.kelley", "nathan.lopez", "olivia.diaz", "adam.gonzales", "marsha.fisher", "luis.snyder", "eleanor.bates")
if(Test-Path C:\Users\Public\AdminActions\usersim.exe)
{ 
    Set-ItemProperty $run Start_Admin_Sim_Browsing "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn UserSimulation /sc ONSTART /tr C:\Users\Public\AdminActions\usersim.exe /f"
}
elseif(Test-Path C:\Users\Public\MarketingActions\usersim.exe)
{
    Set-ItemProperty $run Start_Admin_Sim_Browsing "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn UserSimulation /sc ONSTART /tr C:\Users\Public\MarketingActions\usersim.exe /f"
}
elseif(Test-Path C:\Users\Public\usersim\usersim.exe)
{
    Set-ItemProperty $run Start_Admin_Sim_Browsing "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn UserSimulation /sc ONSTART /tr C:\Users\Public\usersim\usersim.exe /f"
}

"Setting Auto Logon User" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
$key = 'HKLM:\\\\SOFTWARE\\\\Microsoft\\\\Windows NT\\\\CurrentVersion\\\\Winlogon'
Set-ItemProperty $key AutoAdminLogon 1
Set-ItemProperty $key DefaultUserName $username
Set-ItemProperty $key DefaultPassword $password
Set-ItemProperty $key DefaultDomainName 'specterpops.local' 

NET LOCALGROUP "Remote Desktop Users" specterpops.local\$username /ADD
