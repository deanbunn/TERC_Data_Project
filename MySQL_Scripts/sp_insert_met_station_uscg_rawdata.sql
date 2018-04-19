CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_met_station_uscg_rawdata`(IN md_station_id varchar(50),
													IN md_date_time_utc varchar(100),
                                                    IN md_date_time_posix bigint,
                                                    IN md_year int,
                                                    IN md_julian_day int,
                                                    IN md_time int,
                                                    IN md_kz real,
                                                    IN md_kz_sd real,
                                                    IN md_epp_lw real,
                                                    IN md_epp_lw_sd real,
                                                    IN md_cnr1_rsin real,
                                                    IN md_cnr1_rsin_sd real,
                                                    IN md_cnr1_rsout real,
                                                    IN md_cnr1_rsout_sd real,
                                                    IN md_cnr1_rlin real,
                                                    IN md_cnr1_rlin_sd real,
                                                    IN md_cnr1_rlout real,
                                                    IN md_cnr1_rlout_sd real,
                                                    IN md_precip real,
                                                    IN md_atm_pres real,
                                                    IN md_atm_pres_sd real,
                                                    IN md_air_temp real,
                                                    IN md_air_temp_sd real,
                                                    IN md_rh real,
                                                    IN md_rh_sd real,
                                                    IN md_water_temp real,
                                                    IN md_water_temp_sd real,
                                                    IN md_wind_spd1 real,
                                                    IN md_wind_spd2 real,
                                                    IN md_wind_dir real,
                                                    IN md_wind_dir_sd real,
                                                    IN md_gust real,
                                                    IN md_os_wind_spd1 real,
                                                    IN md_os_wind_spd2 real,
                                                    IN md_os_wind_dir real,
                                                    IN md_os_wind_dir_sd real,
                                                    IN md_batt real,
                                                    IN md_rd_station_id int)
BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(md_date_time_utc,'%Y-%m-%d %H:%i:%s');
    
    INSERT INTO Met_Station_USCG_RawData(Station_ID,
										 RD_Date_Time_UTC,
										 RD_Date_Time_POSIX,
										 RD_Year,
										 RD_Julian_Day,
										 RD_Time,
										 KZ,
									     KZ_SD,
										 Epp_LW,
										 Epp_LW_SD,
										 CNR1_Rsin,
										 CNR1_Rsin_SD,
									     CNR1_Rsout,
									     CNR1_Rsout_SD,
										 CNR1_Rlin,
										 CNR1_Rlin_SD,
										 CNR1_Rlout,
										 CNR1_Rlout_SD,
										 Precip,
										 Atm_Pres,
										 Atm_Pres_SD,
										 Air_Temp,
										 Air_Temp_SD,
										 RH,
										 RH_SD,
										 Water_Temp,
										 Water_Temp_SD,
										 Wind_Spd1,
										 Wind_Spd2,
										 Wind_Dir,
										 Wind_Dir_SD,
										 GUST,
										 OS_Wind_Spd1,
										 OS_Wind_Spd2,
										 OS_Wind_Dir,
										 OS_Wind_Dir_SD,
										 BATT,
                                         RD_Station_ID)
		VALUES (md_station_id,
				d_date,
				md_date_time_posix,
				md_year,
				md_julian_day,
				md_time,
				md_kz,
				md_kz_sd,
			    md_epp_lw,
				md_epp_lw_sd,
			    md_cnr1_rsin,
				md_cnr1_rsin_sd,
				md_cnr1_rsout,
			    md_cnr1_rsout_sd,
				md_cnr1_rlin,
				md_cnr1_rlin_sd,
				md_cnr1_rlout,
				md_cnr1_rlout_sd, 
			    md_precip,
			    md_atm_pres,
				md_atm_pres_sd,
				md_air_temp,
				md_air_temp_sd,
			    md_rh,
				md_rh_sd,
		        md_water_temp,
			    md_water_temp_sd,
				md_wind_spd1,
			    md_wind_spd2,
				md_wind_dir,
				md_wind_dir_sd,
				md_gust,
			    md_os_wind_spd1,
				md_os_wind_spd2,
				md_os_wind_dir,
				md_os_wind_dir_sd,
				md_batt,
                md_rd_station_id);
        

END