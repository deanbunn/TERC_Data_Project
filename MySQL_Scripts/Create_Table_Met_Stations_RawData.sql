USE TERC;

CREATE TABLE Met_Stations_RawData
(
	RD_ID bigint not null auto_increment,
    Station_ID varchar(50) null,
    RD_Date_Time_UTC datetime not null,
    RD_Date_Time_POSIX bigint null,
	RD_Year int null,
	RD_Julian_Day int null,
    RD_Time int null,
	Wind_Spd1 real null,
	Wind_Spd2 real null,
	Wind_Dir real null,
	Wind_Dir_SD real null,
	GUST real null,
	Air_Temp real null,
	Air_Temp_SD real null,
	RH real null,
	RH_SD real null,
	Atm_Pres real null,
	Atm_Pres_SD real null,
	Precip real null,
	Raft_Dir real null,
	Water_Temp real null,
	Water_Temp_SD real null,
	BATT real null,
	RD_Note text null,
    primary key (RD_ID)
);