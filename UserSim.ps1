param
(
    $username,
    $password
)

# Setup User Simulation
"[*] Setting up User Simulation" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
$run = 'HKLM:\\\\SOFTWARE\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Run'

if(Test-Path C:\Users\Public\AdminActions\usersim.exe)
{ 
    Set-ItemProperty $run Start_Admin_Sim_Browsing "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn UserSimulation /sc ONLOGON /tr "cd C:\Users\Public\AdminActions && usersim.exe" /f"
}
elseif(Test-Path C:\Users\Public\MarketingActions\usersim.exe)
{
    Set-ItemProperty $run Start_Admin_Sim_Browsing "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn UserSimulation /sc ONLOGON /tr "cd C:\Users\Public\MarketingActions && usersim.exe" /f"
}
elseif(Test-Path C:\Users\Public\usersim\usersim.exe)
{
    Set-ItemProperty $run Start_Admin_Sim_Browsing "schtasks /create /ru specterpops\$($username) /rp $($password) /it /tn UserSimulation /sc ONLOGON /tr "C:\Users\Public\usersim && usersim.exe" /f"
}
"[+] Setting up User Simulation" | Out-File -FilePath C:\Users\Public\usersim.txt -Append

# Add User Auto Logon
"[*] Setting Auto Logon User" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
$key = 'HKLM:\\\\SOFTWARE\\\\Microsoft\\\\Windows NT\\\\CurrentVersion\\\\Winlogon'
Set-ItemProperty $key AutoAdminLogon 1
Set-ItemProperty $key DefaultUserName $username
Set-ItemProperty $key DefaultPassword $password
Set-ItemProperty $key DefaultDomainName 'specterpops.local' 
"[+] Setting Auto Logon User" | Out-File -FilePath C:\Users\Public\usersim.txt -Append

# Allow all Authenticated Users to use Remote Desktop
"[*] Adding Authenticated Users to the Remoted Desktop Users group" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
NET LOCALGROUP "Remote Desktop Users" "Authenticated Users" /ADD
"[+] Adding Authenticated Users to the Remoted Desktop Users group" | Out-File -FilePath C:\Users\Public\usersim.txt -Append
