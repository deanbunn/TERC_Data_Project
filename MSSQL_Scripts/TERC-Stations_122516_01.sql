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
	                        Conductivity25C_Avg
                     FROM [CR1000 - NS Cascade Wifi_LakeData_arch1]
                     WHERE TmStamp >= (CAST('2014-08-02 19:45:00' AS datetime))
					       AND 
						   TmStamp <= (CAST('2014-09-02 19:45:00' AS datetime))
                     ORDER BY TmStamp;