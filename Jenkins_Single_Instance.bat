set localPath=C:\Users\Eric\file-checker\file-checker-iac
set scriptFile=Deploy_CloudFormation_Template.ps1
set cfTemplate=Jenkins_Single_Instance.yml
set s3Bucket=cf-templates-1e0b4nzsaectk-us-east-1
set stackName=EC2JenkinsSingleInstance
set paramKeyName=UsePreviousValue=true
REM ParameterValue=t2.micro
set paramInstanceType=UsePreviousValue=true
set paramSSHLocation=UsePreviousValue=true
set paramAWSAccessKeyId=UsePreviousValue=true
set paramAWSSecretAccessKey=UsePreviousValue=true

cd %localPath%
powershell ".\%scriptFile% -localPath %localPath% -cfTemplate %cfTemplate% -s3Bucket %s3Bucket% -stackName %stackName% -params @('ParameterKey=KeyName,%paramKeyName%','ParameterKey=InstanceType,%paramInstanceType%','ParameterKey=SSHLocation,%paramSSHLocation%','ParameterKey=AWSAccessKeyId,%paramAWSAccessKeyId%','ParameterKey=AWSSecretAccessKey,%paramAWSSecretAccessKey%')"
set /p asd="Hit enter to continue"