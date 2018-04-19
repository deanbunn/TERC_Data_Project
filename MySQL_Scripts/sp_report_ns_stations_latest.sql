USE TERC;

DELIMITER //

CREATE PROCEDURE sp_report_ns_stations_latest()

BEGIN

	SELECT ts_id,
		   Station_Name,
		   TmStamp,
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
    FROM NS_Stations_Latest_Rpt;

END //
DELIMITER ;