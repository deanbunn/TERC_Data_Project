CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_latest_ns_stations`()
BEGIN

	(SELECT 'NS-Cascade' AS StationName,
			TmStamp,
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
	LIMIT 1)
    
    UNION ALL
    
    (SELECT 'NS-DollarPoint' AS StationName,
			TmStamp,
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
	FROM CR1000_NS_Dollar_Point_Modem_LakeData
	ORDER BY TmStamp DESC
	LIMIT 1)
    
    UNION ALL 
    
    (SELECT 'NS-Glenbrook' AS StationName,
			TmStamp,
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
	FROM CR1000_NS_Glenbrook_Modem_LakeData
	ORDER BY TmStamp DESC
	LIMIT 1)
    
    UNION ALL
    
    (SELECT 'NS-Homewood' AS StationName,
			TmStamp,
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
	FROM CR1000_NS_Homewood_Modem_LakeData
	ORDER BY TmStamp DESC
	LIMIT 1)
    
    UNION ALL
    
    (SELECT 'NS-Meeks' AS StationName,
			TmStamp,
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
	FROM CR1000_NS_Meeks_Modem_LakeData
	ORDER BY TmStamp DESC
	LIMIT 1)
    
    UNION ALL
    
    (SELECT 'NS-Rubicon' AS StationName,
			TmStamp,
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
	FROM CR1000_NS_Rubicon_Modem_LakeData
	ORDER BY TmStamp DESC
	LIMIT 1)
    
    UNION ALL
    
    (SELECT 'NS-SandHarbor' AS StationName,
			TmStamp,
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
	FROM CR1000_NS_Sand_Harbor_Modem_LakeData
	ORDER BY TmStamp DESC
	LIMIT 1)
    
    UNION ALL
    
    (SELECT 'NS-TahoeVista' AS StationName,
			TmStamp,
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
	FROM CR1000_NS_Tahoe_Vista_Modem_LakeData
	ORDER BY TmStamp DESC
	LIMIT 1);

END