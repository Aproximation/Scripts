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
"notepadplusplus",
"dotnet4.5",
"paint.net",
"keepass",
#"spotify",
"googlechrome",
"slack",
"dotpeek", #jetbrains decompiler
#"visualstudio2015community",
"sourcetree",
"f.lux",
#"sublimetext3"


$programs | ForEach-Object{choco install $_ -y}

Set-ExecutionPolicy -ExecutionPolicy $currenPolicy