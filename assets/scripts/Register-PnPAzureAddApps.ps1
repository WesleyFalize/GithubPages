$TenantName = "defalize"
$Connection = Connect-PnPOnline -Url "https://$tenantName-admin.sharepoint.com" -Interactive -ReturnConnection

$CertificatePassword = "Welkom@Home"
$CertName = "PnPertificate"
New-PnPAzureCertificate -OutPfx "$CertName.pfx" -OutCert "$CertName.cer" -CertificatePassword (ConvertTo-SecureString -String $CertificatePassword -AsPlainText -Force)

$AppRegistrations = @{
    "SP-Sites.FullCotnrol.All" = @{
        ApplicationName = "APPREG-SP-Sites.FullControl.All" 
        Permissions = @{
            Resource = "SharePoint"
            Permission = "Sites.FullControl.All"
        }
    }
}



foreach($Registration in $appRegistrations.GetEnumerator()) {}
{


    $App = Register-PnPAzureADApp  -ApplicationName $Registration.Value.ApplicationName `
                            -Tenant "$tenantName.Onmicrosoft.com" `
                            -CertificatePath "$CertName.pfx" `
                            -CertificatePassword (ConvertTo-SecureString -String $CertificatePassword -AsPlainText -Force) `
                            -DeviceLogin `
                            -share
}