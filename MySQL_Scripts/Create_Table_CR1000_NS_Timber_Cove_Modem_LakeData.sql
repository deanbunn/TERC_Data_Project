USE TERC;

#CR1000 - NS Camp Richardson Modem_LakeData

#CR1000 - NS Timber Cove Modem_LakeData

CREATE TABLE CR1000_NS_Timber_Cove_Modem_LakeData
(
	ld_id bigint not null auto_increment,
    TmStamp datetime not null,
    RecNum bigint null,
    LS_Conductivity_Avg real null,
    LS_Temp_Avg real null,
    LS_RawPressure_Avg real null,
	LS_Chlorophyll_Avg real null,
	LS_CDOM_Avg real null,
	LS_Turbidity_Avg real null,
	LakeSensor_BattV_Min real null,
	BP_mmHg real null,
	Depth_m4C_Avg real null,
	Depth_m4C_Max real null,
	Depth_m4C_Min real null,
	WaveHeight real null,
	Conductivity25C_Avg real null,
    LS_DO_Avg real null,
    LS_DO_Conc_Avg real null,
    LS_DO_ProbeTemp_Avg real null,
    primary key (ld_id)
);
 
