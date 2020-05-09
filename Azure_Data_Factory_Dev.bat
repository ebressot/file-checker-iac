set localPath=C:\Users\Eric\file-checker\file-checker-iac
set scriptFile=Deploy_Azure_ResourceGroup.ps1
set resourceGroupName=filechecker-dev-factory-rg
set resourceGroupLocation=canadacentral
set armTemplate=Azure_Data_Factory_Dev.json
set parameterFile=Azure_Data_Factory_Dev_Parameters.json

cd %localPath%
powershell ".\%scriptFile% -localPath %localPath% -resourceGroupName %resourceGroupName% -resourceGroupLocation %resourceGroupLocation% -armTemplate %armTemplate% -parameterFile %parameterFile%"
set /p asd="Hit enter to continue"