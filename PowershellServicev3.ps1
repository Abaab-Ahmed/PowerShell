cls

$service = Read-Host "Enter Service Name"
$server  = Read-Host "Enter Server Name"


$MyService = Get-Service -computername $server -name $service | Select-Object -Property Name, StartType, Status

if($MyService.StartType -eq "Automatic")
{ 
    Write-Host "Service is in a Automatic state - Initializing START" -ForegroundColor Green

    Write-Host "`n`rPrevious State" -ForegroundColor Red
    Get-Service -computername $server -name $service
    Get-Service -computername $server -name $service | start-service
  
    Write-Host "`n`rNew State" -ForegroundColor Green
    Get-Service -computername $server -name $service

}
else
{
    Write-Host "Service is in a Manual state - Do you want to START Service?" -ForegroundColor Red

    $caption = "Please Confirm" 
    $message = "Are you Sure You Want To Proceed:"
    [int]$defaultChoice = 0
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Processing Start-up"
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "No Start-up Processed."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $choiceRTN = $host.ui.PromptForChoice($caption,$message, $options,$defaultChoice)

if ( $choiceRTN -ne 1 )
{
   Write-Host "You have selected 'YES', Service has been STARTED" -ForegroundColor Green

    
    Write-Host "`n`rPrevious State" -ForegroundColor Red
    Get-Service -computername $server -name $service
    Get-Service -computername $server -name $service | start-service
  
    Write-Host "`n`rNew State" -ForegroundColor Green
    Get-Service -computername $server -name $service

}
else
{
   Write-Host "You have selected 'NO', Service has not been STARTED" -ForegroundColor RED
   
    
    Get-Service -computername $server -name $service
    Write-Host "`n`rPrevious State" -ForegroundColor Red

    Write-Host "`n`rNew State" -ForegroundColor Green
    Get-Service -computername $server -name $service
}}