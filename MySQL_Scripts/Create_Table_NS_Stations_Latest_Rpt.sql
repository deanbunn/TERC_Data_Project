USE TERC;

CREATE TABLE NS_Stations_Latest_Rpt
(
	ts_id int not null auto_increment,
    Station_Name varchar(25),
    TmStamp datetime not null,
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
    primary key (ts_id)
);