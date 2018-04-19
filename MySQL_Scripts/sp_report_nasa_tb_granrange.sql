USE TERC;

DELIMITER //

CREATE PROCEDURE sp_report_nasa_tb_granrange(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100), IN rpt_station int)

BEGIN

	DECLARE frm_terc_date datetime;
    DECLARE to_terc_date datetime;

    SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
    SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');
    
    SELECT TB_ID AS ID, 
		   TB_NAME AS Station_Name,
           TmStamp, 
	       RBR_0p5_m,
		   WindSpeed_1, 
           AirTemp_1, 
           WindSpeed_2,
           AirTemp_2
    FROM NASA_TB 
    WHERE TmStamp >= frm_terc_date
	      and
          TmStamp <= to_terc_date
          and
          minute(TmStamp) IN (0,20,40)
          and
          second(TmStamp) = 0
          and
          TB_ID = rpt_station
          
	ORDER BY TmStamp ASC;
    

END //

DELIMITER ;