USE TERC;

DELIMITER //

CREATE PROCEDURE sp_report_ns_stations_date_range(IN rpt_tmstamp_from varchar(100),
												  IN rpt_tmstamp_to varchar(100),
                                                  IN rpt_table varchar(200))

BEGIN

SELECT TmStamp,
	   LS_Conductivity_Avg,
	   LS_Temp_Avg,
	   LS_RawPressure_Avg,
	   LS_Chlorophyll_Avg,
	   LS_CDOM_Avg,
	   LS_Turbidity_Avg,
	   LakeSensor_BattV_Min,
	   BP_mmHg,
	   Depth_m4C_Avg,
	   Depth_m4C_Max,
	   Depth_m4C_Min,
	   WaveHeight,
	   Conductivity25C_Avg,
	   LS_DO_Avg
FROM rpt_table
ORDER BY TmStamp desc;

END //

DELIMITER ;