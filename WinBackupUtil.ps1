#Execute Backup
fuction MakeBackup([string]$source, [string]$destination){
    #Verify if source exists
    if(Test-Path $source == false){
        Write-Host "Source Directory '$source' doesn't exist"
        return
    }

    #Verify if destination exist
    if(Test-Path $source == false){
        Write-Host "Destination Directory '$destination' doesn't exist"
        return
    }

    #Get number of threads for robocopy command
    #Known issue: Does not support CPU's with more than 64 logical processors (Anything with more than 32 cores and hyperthreading)
    $cputhreads = (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors

    #Make Backupfolder in destination folder
    New-Item -Path $destination -Name "Backup" -ItemType Directory
    #Execute backup using robocopy
    robocopy $source "$destination/Backup" *.* /e /zb /copyall /dcopy:DATE /secfix /timfix /r:10 /w:10 /eta /log:$destination/BackupLog.log /mt:$cputhreads
}

#Print some text to introduce users to the script
Write-Host "Welcome to the Windows Backup Utility! `n Follow the following instructions to get a backup started. `n"

#Get source and destination from cli input
$srcdir = Read-Host -Prompt "Enter a directory to make a backup from (Example: C:\ImportantData): "
$destdir = Read-Host -Prompt "`n Enter a directory to make a backup to (Example: D:\FolderForBackups): "

MakeBackup -source $srcdir -destination $destdir