<#
Program for installing software in a batch (main target: new windows OS).
For installing it uses chocolatey packages repository.
Script check user execution policy and install chocolatey if needed.

More info about chocolatey: 
https://chocolatey.org
#>

$currenPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex	#install Chocolatey

#if (Get-Command chocolatey -errorAction SilentlyContinue)
#{
#    iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex	#install Chocolatey
#}

$programs = 
"7zip",
"notepadplusplus -x86", #x86 version allow for installing plugins which really improve notepad++
"paint.net",
"bitwarden",
"spotify",
"googlechrome",
"slack",
"onenote",
"microsoft-teams",
"dotnet4.5.2",
"vscode --params /NoDesktopIcon","fiddler",
"powerbi",
"adobereader",
"camtasia",
"obs-studio",
"obs-virtualcam",
"obs-ndi",
"steam"
#"skype",
#"keepass",
#"toastify",
#"office365proplus",
#"todoist",
#"todoist-outlook",
#"git",
#3"conemu",
#"dotpeek", #jetbrains decompiler
#"visualstudio2015community",
#"visualstudio2017-installer", #just installer
#"sourcetree",
#"f.lux",
#"openvpn",
#"autoit",
#"filezilla",
#"wireshark",


$programs | ForEach-Object{choco install $_ -y}

Set-ExecutionPolicy -ExecutionPolicy $currenPolicy
