$role = 'GOC_Power_Users'
$domain = 'roc.cor'
$group = 'ROC.COR\'
$cluster = 'Cybertron'

$memReservation = $true
$memReservationGB = 64
$memShares = 'High'

$CpuReservation = $true
$CpuReservationMhz = 6000
$CpuShares = 'High'

$users = (Get-VIAccount -Domain $domain).name.Replace($group,'')
$userLen = $users.Length

foreach ($user in $users) {
   $group_user = $group+$user 

   New-ResourcePool -Location $cluster -Name $user -MemExpandableReservation $memReservation -MemReservationGB $memReservationGB -MemSharesLevel $memShares -CpuExpandableReservation $CPUReservation -CpuReservationMhz $CPUReservationMhz -CpuSharesLevel $CpuShares
   New-VIPermission -Role $role -Principal $group_user -Propagate $true -Entity (Get-ResourcePool -Name $user)
}