 $servers = 'INX-srv-APPL145','INX-srv-APPL146','RDB-srv-APPL145','RDB-srv-APPL146'

foreach ($server in $servers)
{
    Get-Content \\$Server\LOGS\WEB\INSTRUCTIONPROCESSOR.CITYINDEX.CO.UK\AUDIT.LOG -tail 1

    }  
 
