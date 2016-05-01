<#
Purpose  : Quick and dirty way to create a log file
Author   : John Greenan
Company  : Alignment Systems
Date     : 1st May 2016
#>
$filename = Get-Date -Format o | foreach {$_ -replace ":", "."}
$ERRLOGEXTENTION=".log"
#Relative path up one from where the script is stored and down to log directory at same level in tree
$ERRLOG="..\log\"+$filename+$ERRLOGEXTENTION
$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path $ERRLOG -append
& 'C:\Program Files\MongoDB\Server\3.2\bin\mongod.exe' '--dbpath' 'C:\Users\John.Greenan\Data\MongoDB\data\db'
Stop-Transcript