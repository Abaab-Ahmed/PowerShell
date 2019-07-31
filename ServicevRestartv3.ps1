cls

$service = Read-Host "Enter servicename to check"
$server  = Read-Host "Enter server name"


$MyService = Get-Service -computername $server -name $service | Select-Object -Property Name, StartType, Status

$MyService


if($MyService.StartType -eq "Automatic")
{ 
    Write-Host "Automatic Service State Detected - Initializing Start" -ForegroundColor Green
    Get-Service -computername $server -name $service | start-service
    
    Echo "`nNew State"
    Get-Service -computername $server -name $service
}
else
{
    Write-Host "Maunual Service State Detected - Do you want to START Service?" -ForegroundColor Red

    $caption = "Please Confirm"    
    $message = "Are you Sure You Want To Proceed:"
    [int]$defaultChoice = 0
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Do the job."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Do not do the job."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $choiceRTN = $host.ui.PromptForChoice($caption,$message, $options,$defaultChoice)

if ( $choiceRTN -ne 1 )
{
   Write-Host "Your Choice was Yes, Service has been started" -ForegroundColor Green

   Get-Service -computername $server -name $service | start-service
   Get-Service -computername $server -name $service

}
else
{
   Write-Host "Your Choice was NO, Service has not been STARTED" -ForegroundColor RED
   Get-Service -computername $server -name $service
}}