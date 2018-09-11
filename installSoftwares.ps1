<#
Program for installing software in a batch (main target: new windows OS).
For installing it uses chocolatey packages repository.
Script check user execution policy and install chocolatey if needed.

More info about chocolatey: 
https://chocolatey.org
#>

$currenPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
if (Get-Command chocolatey -errorAction SilentlyContinue)
{
    iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex	#install Chocolatey
}

$programs = 
"7zip",
"skype",
"notepadplusplus -x86", #x86 version allow for installing plugins which really improve notepad++
"dotnet4.5",
"paint.net",
"keepass",
"spotify",
#"toastify",
"googlechrome",
"slack",
"onenote",
"microsoft-teams",
"office365proplus",
"todoist",
#"todoist-outlook",
"git",
"conemu",
"dotpeek", #jetbrains decompiler
#"visualstudio2015community",
#"visualstudio2017-installer", #just installer
"visualstudiocode",
"sourcetree",
"f.lux",
"openvpn",
"autoit",
#"filezilla",
"fiddler4",
"wireshark",
"powerbi"

$programs | ForEach-Object{choco install $_ -y}

Set-ExecutionPolicy -ExecutionPolicy $currenPolicy