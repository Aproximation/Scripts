# Scripts
Usefull scripts
<ul>
<li> GetAllTerms.ps1 </li>
<li> getWifiProfiles.ps1 </li>
<li> installSoftwares.ps1 </li>
<li> NoFacebookNewsfeed </li>
</ul>

<h1>GetAllTerms.ps1</h1>
This script allows to get all terms with their paths from Sharepoint Online/Sharepoint 2016/Sharepoint 2013 from particular Taxonomy Group or Term Set

<h2>Requirements</h2>
My script base on PnP-Powershell module. So basically requirements are the same as for mentioned module
<h3>Setting up credentials</h3>
Credentials need to be stored in Windows Credentials Manager.
See <a href="https://github.com/SharePoint/PnP-PowerShell/wiki/How-to-use-the-Windows-Credential-Manager-to-ease-authentication-with-PnP-PowerShell">this wiki page</a> for more information on how to use the Windows Credential Manager to setup credentials that you can use in unattended scripts.
<h3>Support Sharepoint On-premise</h3>
For connection to Sharepoint On-prem just change the installed module in the script.
See <a href="https://github.com/SharePoint/PnP-PowerShell#powershell-gallery">this paragraph</a> in order to get proper module name.
<h2>Parameters</h2>
<ul>
<li>SharepointOnlineURL - URL to sharepoint online. Required.</li>
<li>UserNameInWCM - User name in Windows Credentials Management. Required.</li>
<li>TermGroupName - Term group name in term store of the tenant. Required.</li>
<li>TermSetName - Term set name in term group. Optional.</li>
</ul>

<h2>Example usage</h2>
<ul><li>(longer version, with TermSetName parameter)<br>
.\GetAllTerms.ps1 <br>
-SharepointOnlineURL https://contoso.sharepoint.com <br>
-UserNameInWCM TestUser <br>
-TermGroupName "Contoso Taxonomy" <br>
-TermSetName "Document Types" </li> 
<li>(shorter version, without TermSetName parameter)<br>
.\GetAllTerms.ps1 <br>
https://contoso.sharepoint.com <br>
TestUser <br>
"Contoso Taxonomy" </li></ul>

<h1>getWifiProfiles.ps1</h1>
Get all saved wifi profiles that are stored in your system. Name and password.
<h2>Example usage</h2>
./getWifiProfiles.ps1
<h1>installSoftwares.ps1</h1>
Script for installing software in a batch (main target: new windows OS).
For installing it uses chocolatey packages repository.
Script check user execution policy and install chocolatey if needed.

More info about chocolatey: 
<a href="https://chocolatey.org">https://chocolatey.org</a>

<h1>NoFacebookNewsfeed.tampermonkey.txt</h1>
Script to be used in TamperMonkey browser addon. It hides wall, notifications button (but leaves friends requests and messages), ads, friends availability (but leaves friends search).
In the name of Productivity!
