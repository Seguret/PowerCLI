$folders = Get-Folder
foreach ($folder in $folders) {
    if((Get-Folder $folder | Get-VM).count -eq 0)
        {
            Remove-Folder -Folder $folder 
        }
    
}