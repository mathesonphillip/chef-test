Param(
    $InterfaceIndex = $env:InterfaceIndex,
    $NewServerAddress = $env:NewServerAddress,
    $AddressFamily = $env:AddressFamily
)

$result = New-Object psobject @{
    changed = $true
    msg = ''
}

$CurrentServerAddress = Get-DnsClientServerAddress -AddressFamily $AddressFamily |
    Where-Object {$_.InterfaceIndex -eq $InterfaceIndex} |
        Select -ExpandProperty ServerAddresses

$result.originalValue = $CurrentServerAddress
$result.desiredValue = $NewServerAddress

#Check if interface exists
#if does not exist return flase
if (!$CurrentServerAddress){
    $result.msg = 'Network interface does not exist on index ' + $p_InterfaceIndex
    $result.changed = $false
    $result.failed = $true
    $result.rc = 1
    return $result
}

#Check if CurrentServerAddress is the same as NewServerAddress
$compare = Compare-Object -ReferenceObject $CurrentServerAddress -DifferenceObject $NewServerAddress -PassThru

#if Current = Desired - No change required
If (!$compare){
    $result.msg = 'No change required'
    $result.changed = $false
    return $result
}

#if Current != Desired 
else {
    #Set new DNS and check if successful
    $compare = Set-DnsClientServerAddress -InterfaceIndex $InterfaceIndex -ServerAddresses ($NewServerAddress) -PassThru |
        Where-Object {$_.InterfaceIndex -eq $InterfaceIndex} |
        Select -ExpandProperty ServerAddresses

    #Successful change of DNS
    if ($compare -ne $NewServerAddress){
        $result.msg = 'Server not changed (check if valid): ' + $NewServerAddress
        $result.changed = $false
        return $result
    }

    #Failed to change DNS 
    else{
        $result.msg = 'Server address changed: ' + $NewServerAddress
        $result.changed = $true
        return $result
    }

}