set localPath=C:\Users\Eric\file-checker\file-checker-iac
set scriptFile=Deploy_CloudFormation_Template.ps1
set cfTemplate=Bucket_Website_Hosting.yml
set s3Bucket=cf-templates-1e0b4nzsaectk-us-east-1
set stackName=S3BucketWebsiteHosting

cd %localPath%
powershell ".\%scriptFile% -localPath %localPath% -cfTemplate %cfTemplate% -s3Bucket %s3Bucket% -stackName %stackName%"
set /p asd="Hit enter to continue"