$outputString = netsh.exe wlan show profiles | Select-String -Pattern "All User Profile"
$profilesArray = @()
$profiles = @()
for($i=0;$i -lt $outputString.Count;$i++){
        $profilesArray += $outputString[$i].ToString().Split(':')[1].Trim()
    
}

$profilesArray = $profilesArray | Sort-Object

for($i=0;$i -lt $profilesArray.Count;$i++){
    $profileName = $profilesArray[$i]
    $profile = netsh.exe wlan show profiles $profileName key=clear
    $tmp = $profile | Select-String -Pattern "Key Content" | % ToString | % Split (':') | % Trim
    if ($tmp -ne $null){
    $pwd = $tmp[1]
    }
    else{
    $pwd = ""
    }
    $profiles += [pscustomobject]@{SSID = $profilesArray[$i]; Password = $pwd}
}

$profiles