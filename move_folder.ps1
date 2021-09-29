$folder_vcsa = 'name_folder'
$resourcepool = 'name_resoucer_pool'

$vm = (Get-Folder -Name $folder_vcsa | Get-VM)

Move-VM -VM $vm -Destination $resourcepool -Verbose
