using './main.bicep'

// These parameters might have acceptable defaults.
param location = 'eastus'
param environment = 'test'
param workloadName = 'redcap'
param namingConvention = '{workloadName}-{env}-{rtype}-{loc}-{seq}'
param sequence = 1

// These parameters should be modified for your environment
param identityObjectId = 'e5dff9a0-ccaf-48b0-989f-578e72f14929'
param vnetAddressSpace = '10.0.0.0/24'

// There are two options for obtaining the REDCap zip file:
// 1. Specify a URL to a publicly accessible zip file.
//    This URL should not require authentication of any kind. For example, an Azure blob storage URL with a SAS token is supported.
// 2. Specify a REDCap community username and password to download the zip file from the REDCap community.
//    Do not specify a URL if you are using this option. The deployment script will download the zip file from the REDCap community.
param redcapCommunityPassword = ''
param redcapCommunityUsername = ''
param redcapZipUrl = 'https://redcappaas.blob.core.windows.net/redcapzip?sp=r&st=2024-06-18T05:57:16Z&se=2024-06-18T13:57:16Z&skoid=5fb79b28-d180-4869-aa81-3b4561da6f15&sktid=93f8cbbe-0b55-4552-826b-068299f8c0d1&skt=2024-06-18T05:57:16Z&ske=2024-06-18T13:57:16Z&sks=b&skv=2022-11-02&sip=0.0.0.0&spr=https&sv=2022-11-02&sr=c&sig=%2FgCoA00SaYxiPuaphzaWYm%2FVGmSRVVWxUiGaZEtQ8%2Fg%3D'

// These values are used to configure the App Service Deployment Center.
// The defaults below are the Microsoft-maintained Azure REDCap PaaS repository.
// However, you should consider forking that repository and referencing your fork.
// If not specified, the deployment will use the Microsoft-maintained Azure REDCap PaaS repository.
param scmRepoUrl = 'https://github.com/Microsoft/azure-redcap-paas'
param scmRepoBranch = 'main'

// Specify the values for the SMTP host REDCap will use to send emails.
// These values may be left blank if you will not use SMTP for email notifications.
param smtpFQDN = 'smtp.gmail.com'
// Be aware of possible restrictions to using SMTP port 25 in Azure.
// See https://learn.microsoft.com/azure/virtual-network/troubleshoot-outbound-smtp-connectivity
param smtpPort = '587'
param smtpFromEmailAddress = 'pythondevelopmenttestingemail@gmail.com'

// ** Do not specify anything here! **
// This parameter is required to ensure the parameter file is valid, but should be blank so the password doesn't leak. 
// A new password is generated for each deployment and stored in Key Vault.
param sqlPassword = ''
