Param(
    $SystemLocale = $env:SystemLocale
)

#Get current system locale
$CurrentSystemLocale = Get-WinSystemLocale | 
    Select -ExpandProperty Name

Write-Output $CurrentSystemLocale

#Check if current system locale is same as input
#if current is same as proposed = no change
if ($CurrentSystemLocale -eq $SystemLocale){
    #No Change
    return $false
}
else{
#current is diff to proposed = change to proposed
    Set-WinSystemLocale $SystemLocale
    return $true
}