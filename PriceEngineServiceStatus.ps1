invoke-command -cn rdb-srv-appl30  { get-service -name PE_APACEquities7_3,PE_ChiXEquities7_3,PE_EUEquities7_3,PE_UKEquities7_3 }
invoke-command -cn rdb-srv-appl138 { get-service -name PE_USEquities7_3,PE_DBEquities7_3 }
invoke-command -cn rdb-srv-appl54  { get-service -name PE_USEquities2_7_3,PE_USEquities3_7_3,PE_Options7_3 }