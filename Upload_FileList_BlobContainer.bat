set scriptPath=C:\Users\Eric\file-checker\file-checker-iac
set scriptFile=Upload_File_BlobContainer.ps1
set fileName=File_List.csv
set localPath=C:\Users\Eric\Downloads\
set remotePath=''


cd %scriptPath%
powershell ".\%scriptFile% -fileName %fileName% -localPath %localPath% -remotePath %remotePath%"
set /p asd="Hit enter to continue"