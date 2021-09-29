install-module -name VMware.PowerCLI -Confirm:$false
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-VIServer -server vcsa.vsphere.local -user admin@vsphere.local -pass password
