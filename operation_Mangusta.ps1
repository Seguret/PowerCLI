# LIST HOST ESXI
$hosts = 'esxidev06.roc.cor', 'esxidev05.roc.cor'

# VM POWERON AND SUSPEND
$VMpower = Get-VM  -Location $hosts | ForEach-Object {if(($_.PowerState -eq 'PoweredOn') || ($_.PowerState -eq 'Suspend')){$_.Name}}

# STOP VM
Stop-VM  -VM $VMpower -Confirm:$false

# GET VM IN HOSTS 
$allVMinhost = get-vm -location $hosts

# DELETE SNAPSHOT ALL VM
Get-VM -Name $allVMinhost | Get-Snapshot | Remove-Snapshot -Confirm:$false 

$dest = Get-VMHost esxidev07.roc.cor 
$destDatastore = Get-Datastore -Name DEV07-SAS

$allVMinhost | Move-VM -Destination $dest -Datastore $destDatastore