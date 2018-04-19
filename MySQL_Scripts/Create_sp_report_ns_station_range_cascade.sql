USE TERC;

DELIMITER //

CREATE PROCEDURE sp_report_ns_station_range_cascade(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))

BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d 00:00:00');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d 23:59:59');

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
FROM CR1000_NS_Cascade_Wifi_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END //

DELIMITER ;