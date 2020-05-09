# file-checker-iac
Infrastructure as Code for the File Checker App

## Azure

### Azure_Data_Factory_Dev.json and Azure_Data_Factory_Tst.json
AzureRM template to create an empty data factory.

The data factory code will be deployed by Azure DevOps pipelines. Hence the development data factory is attached to a git repository whereas the test data factory isn't. My data factory code is stored in a GitHub repository.

The deployment outputs the data factory name which must be globally unique.

Direct link: https://raw.githubusercontent.com/ebressot/file-checker-iac/master/Azure_Data_Factory_Dev.json
 https://raw.githubusercontent.com/ebressot/file-checker-iac/master/Azure_Data_Factory_Tst.json

Reference: https://docs.microsoft.com/en-us/azure/data-factory/quickstart-create-data-factory-resource-manager-template

### Azure_Data_Lake_Storage_Account.json
AzureRM template to create an Azure Data Lake Gen2 storage account, blob service and container.

The deployment outputs the storage account name which must be globally unique.

Direct link: https://raw.githubusercontent.com/ebressot/file-checker-iac/master/Azure_Data_Lake_Storage_Account.json

Reference: https://docs.microsoft.com/en-us/azure/storage/common/storage-account-create?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&tabs=template

### Azure_Key_Vault.json
AzureRM template to create a key vault with default access policy and a secret.

This key vault will be used to store secrets (keys, passwords...).

The current user is given full access to the key vault (see Deploy_Azure_ResourceGroup.ps1 below for details).

The secret is typed as a secure string (no logging allowed).

The deployment outputs the key vault name which must be globally unique.

Direct link: https://raw.githubusercontent.com/ebressot/file-checker-iac/master/Azure_Key_Vault.json

Reference: https://docs.microsoft.com/en-us/azure/key-vault/secrets/quick-create-template

### Upload_File_BlobContainer.ps1
PowerShell script to upload a local file to an Azure Blob Container.

The PS script connects to Azure if necessary, retrieves the storage account context and uploads the file to the Blob Container. It also sets the user properties on the file if some are provided.

The Resource Group, Storage Account and Container names are hardcoded.

Use case examples: Upload_FileList_BlobContainer.bat

### Files_Storage_Account.json
AzureRM template to create a storage account and a blob container in it.

This container will be used to store files (json, csv...) to be processed.

The deployment outputs the storage account name and container name.

Direct link: https://raw.githubusercontent.com/ebressot/file-checker-iac/master/Files_Storage_Account.json

Reference: https://docs.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=template

### Deploy_Azure_ResourceGroup.ps1
PowerShell script to deploy one of the above AzureRM templates.

The PS script sets the current location to localPath, creates the resource group and applies the ARM template.

If a parameter file name is provided, use the parameter values from the parameter file.

If the *appParameters* parameter is set to true, pass the Object Id (Azure AD) or the current user as a parameter to the ARM template plus other parameters entered by the user interactively. The user may have to login twice: first to connect to their Azure Account and then to connect to Azure AD.
**Warning:** this function uses the Azure AD PowerShell module which doesn't work on PowerShell Core.

Use case examples: Files_Storage_Account.bat

## AWS

### Bucket_Website_Hosting.yml
CloudFormation template to create an s3 bucket with Static Website Hosting enabled and public read policy.

This bucket can be used to host the static elements (html, css, js) of your public website.

The CF template outputs the wesite Url.

Direct link: https://cf-templates-1e0b4nzsaectk-us-east-1.s3.amazonaws.com/Bucket_Website_Hosting.yml

Reference: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-s3.html#scenario-s3-bucket-website

### Jenkins_Single_Instance.yml
CloudFormation template to launch an EC2 instance with Java 1.8 open JDK (required by Jenkins), Git, NodeJs 12.x and Jenkins.

The CF template also creates a security group which gives "SSHLocation" access to port 22 (SSH) and port 8080 (HTTP).

The CF template finally configures the AWS CLI: Jenkins will run as the IAM user defined by the credentials "AWSAccessKeyId/AWSSecretAccessKey".

The CF template outputs the Jenkins Url.

Direct link: https://cf-templates-1e0b4nzsaectk-us-east-1.s3.amazonaws.com/Jenkins_Single_Instance.yml

Reference: WordPress basic single instance at https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/sample-templates-applications-us-east-1.html

### Deploy_CloudFormation_Template.ps1
PowerShell script to deploy one of the above CloudFormation templates and update the associated stack.

The PS script sets the current location to localPath, copies the cfTemplate to the s3Bucket and updates the CF stack.

The CF template's parameter values can optionally be modified at the same time (default: UsePreviousValue=true).

The command fails if there is nothing to update.

Use case examples: Jenkins_Single_Instance.bat, Bucket_Website_Hosting.bat