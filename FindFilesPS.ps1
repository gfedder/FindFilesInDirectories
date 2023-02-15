$rootDirectory = 'D:\Repos\'
$minFileSize = 1024#*1024*1024
$runDate = (Get-Date).ToString('yyyyMMddHHmmss')
$logFile = $PSScriptRoot + '\FileFindings' + $runDate + '.txt'
$count = 0

"File Size`tCreation DateTime`tFile Name`tPath" >> $logFile

Get-ChildItem $rootDirectory -Attributes !Directory -Recurse | Where-Object { $_.Length -gt $minFileSize } | ForEach-Object {
    $(($_.Length/1MB).ToString("#.###") + " GB`t" + $_.CreationTime + "`t" + $_.Name + "`t" + $_.DirectoryName) >> $logFile
    $count++
}

"Total Files Found: " + $count >> $logFile