$inx = "INX-SRV-WEBL40","INX-SRV-WEBL41","INX-SRV-WEBL50", "INX-SRV-WEBL51","INX-SRV-WEBL55" 
$rdb = "RDB-SRV-WEBL40","RDB-SRV-WEBL41","RDB-SRV-WEBL50", "RDB-SRV-WEBL51","RDB-SRV-WEBL55"

$inxx = "inx-srv-webl63", "inx-srv-webl65","inx-srv-webl65"
$rdbx = "rdb-srv-webl63", "rdb-srv-webl65","inx-srv-webl65"

icm -cn $inx {gsv -name FixEngineOrderService*}
Write-Output ""
icm -cn $rdb {gsv -name FixEngineOrderService*}
Write-Output ""
icm -cn $inx {gsv -name FixEngineBackOfficeService*}
Write-Output ""
icm -cn $rdb {gsv -name FixEngineBackOfficeService*}
Write-Output ""
icm -cn $inxx {gsv -name FixEnginePriceService*}
Write-Output ""
icm -cn $rdbx {gsv -name FixEnginePriceService*}