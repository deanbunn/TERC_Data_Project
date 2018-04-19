USE TERC;

DELIMITER //

CREATE PROCEDURE sp_insert_met_station_rawdata(IN md_station_id varchar(50),
											   IN md_date_time_utc varchar(100),
											   IN md_date_time_posix bigint,
											   IN md_year int,
											   IN md_julian_day int,
											   IN md_time int,
                                               IN md_wind_spd1 real,
									           IN md_wind_spd2 real,
									           IN md_wind_dir real,
											   IN md_wind_dir_sd real,
											   IN md_gust real,
											   IN md_air_temp real,
									           IN md_air_temp_sd real,
									           IN md_rh real,
									           IN md_rh_sd real,
											   IN md_atm_pres real,
											   IN md_atm_pres_sd real,
									           IN md_precip real,
									           IN md_raft_dir real,
									           IN md_water_temp real,
											   IN md_water_temp_sd real,
									           IN md_batt real,
									           IN md_rd_note text)
                                                    
                                                    
BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(md_date_time_utc,'%Y-%m-%d %H:%i:%s');
    
    INSERT INTO Met_Stations_RawData(Station_ID,
									 RD_Date_Time_UTC,
									 RD_Date_Time_POSIX,
									 RD_Year,
									 RD_Julian_Day,
									 RD_Time,
									 Wind_Spd1,
									 Wind_Spd2,
									 Wind_Dir,
									 Wind_Dir_SD,
									 GUST,
									 Air_Temp,
									 Air_Temp_SD,
									 RH,
									 RH_SD,
									 Atm_Pres,
									 Atm_Pres_SD,
									 Precip,
									 Raft_Dir,
									 Water_Temp,
									 Water_Temp_SD,
									 BATT,
									 RD_Note)
		VALUES (md_station_id,
				d_date,
				md_date_time_posix,
				md_year,
				md_julian_day,
				md_time,
                md_wind_spd1,
			    md_wind_spd2,
				md_wind_dir,
				md_wind_dir_sd,
				md_gust,
				md_air_temp,
				md_air_temp_sd,
				md_rh,
				md_rh_sd,
				md_atm_pres,
				md_atm_pres_sd,
				md_precip,
				md_raft_dir,
				md_water_temp,
				md_water_temp_sd,
				md_batt,
			    md_rd_note);

END //
DELIMITER ;