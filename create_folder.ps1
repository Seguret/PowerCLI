$role = 'role'
$domain = 'vsphere.local'
$group = 'vsphere.local\'
$datacenter = 'datacenter'
$cluster = 'cluster'

$users = (Get-VIAccount -Domain $domain).name.Replace($group,'')

foreach ($user in $users) {
    $group_user = $group+$user
    New-Folder -Location (Get-Datacenter -Name $datacenter | Get-Folder -Name vm) -Name $user
    New-VIPermission -Role $role -Principal $group_user -Propagate $true -Entity (Get-Folder -Name $user) 

}


