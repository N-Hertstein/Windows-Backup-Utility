#Execute Backup
fuction MakeBackup($source,$destination){
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
}