Param(
    [parameter(position=0, Mandatory=$true)]
    [String]
    $SharepointOnlineURL,
    [parameter(position=1, Mandatory=$true)]
    [String]
        $UserNameInWCM,
    [parameter(position=2, Mandatory=$true)]
    [String]
        $TermGroupName,
    [parameter(position=3)]
    [String]
        $TermSetName
)
#Example: .\GetAllTerms.ps1 -SharepointOnlineURL https://findwise.sharepoint.com -UserNameInWCM mguzowski -TermGroupName "Findwise Taxonomy" -TermSetName "Actor"
#Example: .\GetAllTerms.ps1 https://findwise.sharepoint.com mguzowski "Findwise Taxonomy"

if (-NOT (Get-Module -ListAvailable -Name SharePointPnPPowerShellOnline)) {
    Write-Host "Module not found. Installing..."
    Install-Module SharePointPnPPowerShellOnline
} else {
Write-Host "Module found. Updating..."
Update-Module SharePointPnPPowerShell*}
Write-Host "Done"

$global:result = @()

function GetPath($term)
{
    if([string]::IsNullOrEmpty($term.PathOfTerm)){
        return $term.Name.TrimStart()
    } else {
        return $term.PathOfTerm
    }
}

function GetChildrenTerms ($ctx, $termSetName, $term){
    $ctx.Load($term.Terms)
    $ctx.ExecuteQuery()
    $global:result += "{0};{1};{2}" -f $TermGroupName, $termSetName, (GetPath -term $_)
    if ($term.Terms.Count -ne 0){
        #this is leaf
        #$termsCollection += $TermGroupName+";"+$TermSetName+";"+ (GetPath -term $_)
        
        $term.Terms | ForEach-Object{(GetChildrenTerms -ctx $ctx -termSetName $termSetName -term $_)}
    }
}

function GetTermSetTerms($termSetName){
    
    $global:result += "{0};{1}" -f $TermGroupName, $termSetName
Get-PnPTerm -TermSet $termSetName -TermGroup $TermGroupName | ForEach-Object{(GetChildrenTerms -ctx $ctx -termSetName $termSetName -term $_)}
}

Connect-PnPOnline -Url $SharepointOnlineURL -Credentials $UserNameInWCM
$group = Get-PnPTermGroup -Identity $TermGroupName
$ctx = $group.Context

if ($TermSetName){
    $global:result += "{0};{1}" -f $TermGroupName, $TermSetName
    Get-PnPTerm -TermSet $TermSetName -TermGroup $TermGroupName | ForEach-Object{(GetChildrenTerms -ctx $ctx -termSetName $TermSetName -term $_)}
} else {

    $ctx.Load($group.TermSets)
    $ctx.ExecuteQuery()
    $group.TermSets | ForEach-Object {(GetTermSetTerms -termSet $_.Name)}
}

$global:result