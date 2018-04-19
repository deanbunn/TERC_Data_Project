USE [TERC-Stations]
GO

SELECT TmStamp,
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
	   Conductivity25C_Avg AS OrgData --,
	   --CONVERT(NVARCHAR(200), Conductivity25C_Avg, 128) AS Hoping,
	   --STR(Conductivity25C_Avg, 16,20) AS NewStuff
FROM [CR1000 - NS Dollar Point Modem_LakeData_arch1]
WHERE TmStamp >= (CAST('2015-12-01 21:19:00' AS datetime))
ORDER BY TmStamp;