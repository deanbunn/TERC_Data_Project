USE TERC;


CREATE TABLE NASA_TB
(
	nd_id bigint not null auto_increment,
    TB_ID int not null,
    TB_Name nvarchar(25) null,
    TmStamp datetime not null,
    Date_RD nvarchar(10) null,
    Time_RD nvarchar(8) null,
    RBR_5p5_m real null,
    RBR_5p0_m real null,
    RBR_4p0_m real null,
    RBR_3p0_m real null,
    RBR_2p0_m real null,
    RBR_1p5_m real null,
    RBR_1p0_m real null,
    RBR_0p5_m real null,
    WindSpeed_1 real null,
    WindDir_1 real null,
    Compass_1 real null,
    AirTemp_1 real null,
    RH_1 real null,
    Pressure_1 real null,
    WindSpeed_2 real null,
    WindDir_2 real null,
    Compass_2 real null,
    AirTemp_2 real null,
    RH_2 real null,
    Pressure_2 real null,
    primary key (nd_id)
);