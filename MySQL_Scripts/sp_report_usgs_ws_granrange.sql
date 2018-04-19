USE TERC;

DELIMITER //

CREATE PROCEDURE sp_report_usgs_ws_granrange(IN rpt_tmstamp_from varchar(100),
										     IN rpt_tmstamp_to varchar(100),
											 IN rpt_station int)

BEGIN

    DECLARE frm_terc_date datetime;
    DECLARE to_terc_date datetime;

    SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
    SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');
    
    SELECT Site_ID AS ID,
           TmStamp,
           Location,
           Latitude,
           Longitude,
           Lake_Level,
           Streamflow
    FROM USGS_WS 
    WHERE TmStamp >= frm_terc_date
	      and
          TmStamp <= to_terc_date
          and
          Site_ID = rpt_station
          
	ORDER BY TmStamp ASC;
 

END //

DELIMITER ;