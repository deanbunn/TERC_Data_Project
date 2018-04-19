USE TERC;

DELIMITER //

CREATE PROCEDURE sp_insert_met_guv_rawdata(IN md_date_time_utc varchar(100),
										   IN md_date_time_posix bigint,
										   IN md_ed0gnd real,
										   IN md_ed0305 real,
										   IN md_ed0313 real,
										   IN md_ed0320 real,
										   IN md_ed0340 real,
										   IN md_ed0380 real,
										   IN md_ed0395 real,
										   IN md_ed0par real,
										   IN md_ed0temp real,
										   IN md_ed0Vin real,
										   IN md_numbersampled bigint)
                                                    
                                                    
BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(md_date_time_utc,'%Y-%m-%d %H:%i:%s');
    
    INSERT INTO GUV_RawData(RD_Date_Time_UTC,
							RD_Date_Time_POSIX,
							Ed0Gnd,
							Ed0305,
							Ed0313,
							Ed0320,
							Ed0340,
							Ed0380,
							Ed0395,
							Ed0PAR,
							Ed0Temp,
							Ed0Vin,
							NumberSampled)
		VALUES (d_date,
				md_date_time_posix,
                md_ed0gnd,
				md_ed0305,
				md_ed0313,
				md_ed0320,
				md_ed0340,
				md_ed0380,
				md_ed0395,
				md_ed0par,
				md_ed0temp,
				md_ed0Vin,
				md_numbersampled);

END //
DELIMITER ;