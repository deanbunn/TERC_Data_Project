USE TERC;

DELIMITER //

CREATE PROCEDURE sp_insert_nasa_tb_data(IN bd_tb_id int,
										IN bd_tb_name varchar(25),
										IN bd_tmstamp varchar(100),
										IN bd_date_rd varchar(25),
										IN bd_time_rd varchar(25),
										IN bd_rbr_5p5_m real,
										IN bd_rbr_5p0_m real,
										IN bd_rbr_4p0_m real,
										IN bd_rbr_3p0_m real,
										IN bd_rbr_2p0_m real,
										IN bd_rbr_1p5_m real,
										IN bd_rbr_1p0_m real,
										IN bd_rbr_0p5_m real,
										IN bd_windspeed_1 real,
										IN bd_winddir_1 real,
										IN bd_compass_1 real,
										IN bd_airtemp_1 real,
										IN bd_rh_1 real,
										IN bd_pressure_1 real,
										IN bd_windspeed_2 real,
										IN bd_winddir_2 real,
										IN bd_compass_2 real,
										IN bd_airtemp_2 real,
										IN bd_rh_2 real,
										IN bd_pressure_2 real)

BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(bd_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    INSERT INTO NASA_TB(TB_ID,
						TB_Name,
						TmStamp,
						Date_RD,
						Time_RD,
						RBR_5p5_m,
						RBR_5p0_m,
						RBR_4p0_m,
						RBR_3p0_m,
						RBR_2p0_m,
						RBR_1p5_m,
						RBR_1p0_m,
						RBR_0p5_m,
						WindSpeed_1,
						WindDir_1,
						Compass_1,
						AirTemp_1,
						RH_1,
						Pressure_1,
						WindSpeed_2,
						WindDir_2,
						Compass_2,
						AirTemp_2,
						RH_2,
						Pressure_2)
		VALUES (bd_tb_id,
				bd_tb_name,
				d_date,									
				bd_date_rd,
				bd_time_rd,
				bd_rbr_5p5_m,
				bd_rbr_5p0_m,
				bd_rbr_4p0_m,
				bd_rbr_3p0_m,
				bd_rbr_2p0_m,
				bd_rbr_1p5_m,
				bd_rbr_1p0_m,
				bd_rbr_0p5_m,
				bd_windspeed_1,
				bd_winddir_1,
				bd_compass_1,
				bd_airtemp_1,
				bd_rh_1,
				bd_pressure_1,
				bd_windspeed_2,
				bd_winddir_2,
				bd_compass_2,
				bd_airtemp_2,
				bd_rh_2,
				bd_pressure_2);
        
	
END //
DELIMITER ;