USE TERC;

DELIMITER //

CREATE PROCEDURE sp_report_ns_station_granrange_dollarpoint(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))

BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Dollar_Point_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      and
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END //

DELIMITER ;