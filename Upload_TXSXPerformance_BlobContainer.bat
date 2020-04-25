set /p effectiveDateYear="Enter effective date year (yyyy): "
set /p effectiveDateMonth="Enter effective date month (MM): "
set /p effectiveDateDay="Enter effective date day (dd): "

set scriptPath=C:\Users\Eric\file-checker\file-checker-iac
set scriptFile=Upload_File_BlobContainer.ps1
set fileName=tsx-60-index-%effectiveDateMonth%-%effectiveDateDay%-%effectiveDateYear%-performance.csv
set localPath=C:\Users\Eric\Downloads\
set remotePath=TSX/TXSX-Performance/
set effectiveDate=%effectiveDateYear%-%effectiveDateMonth%-%effectiveDateDay%
set feedName=TXSX-Performance
set feedDescription=TSX 60 Index Performance
set sourceName=TSX
set sourceDescription=Toronto Stock Exchange


cd %scriptPath%
powershell ".\%scriptFile% -fileName %fileName% -localPath %localPath% -remotePath %remotePath% -metadata @{effectivedate='%effectiveDate%';feeddescription='%feedDescription%';feedname='%feedName%';sourcedescription='%sourceDescription%';sourcename='%sourceName%'}"
set /p asd="Hit enter to continue"