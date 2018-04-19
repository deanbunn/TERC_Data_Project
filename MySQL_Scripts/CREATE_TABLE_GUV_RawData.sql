USE TERC;

CREATE TABLE GUV_RawData
(
    RD_ID bigint not null auto_increment,
    RD_Date_Time_UTC datetime not null,
    RD_Date_Time_POSIX bigint null,
	Ed0Gnd real null,
	Ed0305 real null,
    Ed0313 real null,
	Ed0320 real null,
	Ed0340 real null,
	Ed0380 real null,
	Ed0395 real null,
	Ed0PAR real null,
	Ed0Temp real null,
	Ed0Vin real null,
	NumberSampled bigint null,
    primary key (RD_ID)

);


