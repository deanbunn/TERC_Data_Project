USE TERC;

DELIMITER //

CREATE PROCEDURE sp_lastsync_cr1000_ns_camp_richardson_modem_lakedata()

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
FROM CR1000_NS_Camp_Richardson_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END //

DELIMITER ;