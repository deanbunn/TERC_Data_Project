USE TERC;

DELIMITER //

CREATE PROCEDURE sp_report_latest_ns_stations()

BEGIN

	SELECT 'NS-Cascade' AS StationName,
			TmStamp,
			RecNum,
			LS_Conductivity_Avg,
			LS_Temp_Avg,
			LS_RawPressure_Avg,
			LS_DO_Avg,
			LS_Chlorophyll_Avg,
			LS_CDOM_Avg,
			LS_Turbidity_Avg,
			LakeSensor_BattV_Min,
			BP_mmHg,
			Depth_m4C_Avg,
			Depth_m4C_Max,
			Depth_m4C_Min,
			WaveHeight,
			Conductivity25C_Avg
	FROM CR1000_NS_Cascade_Wifi_LakeData
	ORDER BY TmStamp DESC
	LIMIT 1;

END //
DELIMITER ;