install-module -name VMware.PowerCLI -Confirm:$false
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-VIServer -server vcsa-gr.cioc.local -user t1.admin4@roc.cor -pass password