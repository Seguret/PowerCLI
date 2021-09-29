$folder_vcsa = 'Cristaldi'
$resourcepool = 'a.cristaldi'

$vm = (Get-Folder -Name $folder_vcsa | Get-VM)

Move-VM -VM $vm -Destination $resourcepool -Verbose