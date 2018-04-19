USE [TERC-Stations]
GO


SELECT DISTINCT ('"' + CAST(TmStamp AS nvarchar) + '"') AS TmStamp,
	   RecNum,
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
	   Conductivity25C_Avg
FROM [CR1000 - NS Cascade Wifi_LakeData]

UNION

SELECT DISTINCT ('"' + CAST(TmStamp AS nvarchar) + '"') AS TmStamp,
	   RecNum,
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
	   Conductivity25C_Avg
FROM [CR1000 - NS Cascade Wifi_LakeData_arch1]
ORDER BY TmStamp