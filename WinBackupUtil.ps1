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


}