$service = "add service"
$server  = "add hostname"

cls


$MyService = Get-Service -computername $server -name $service | Select-Object -Property Name, StartType, Status

$MyService


if($MyService.StartType -eq "Automatic")
{ 
    Write-Host "Automatic Service - Im going to start it" -ForegroundColor Green
    #Get-Service -computername INX-SRV-RISK01 -name $service | start-service
    Get-Service -computername INX-SRV-RISK01 -name $service

}
else 
{
   #Start-Service -Name $service #-ErrorAction SilentlyContinue
   Write-Host "Manual/Disabled Service" -ForegroundColor Red
    
}