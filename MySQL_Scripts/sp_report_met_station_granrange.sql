CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_met_station_granrange`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100), IN rpt_station int)
BEGIN

	DECLARE frm_terc_date datetime;
    DECLARE to_terc_date datetime;

    SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
    SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');
    
    SELECT Station_ID AS Station_Name, 
       RD_Date_Time_UTC, 
	   Wind_Spd1, 
       Wind_Spd2, 
       Wind_Dir, 
       Air_Temp,
       RD_Station_ID AS ID
    FROM Met_Stations_RawData 
    WHERE RD_Date_Time_UTC >= frm_terc_date
	      and
          RD_Date_Time_UTC <= to_terc_date
          and
          minute(RD_Date_Time_UTC) IN (0,20,40)
          and
          second(RD_Date_Time_UTC) = 0
          and
          RD_Station_ID = rpt_station
    
    UNION ALL
    
    SELECT Station_ID AS Station_Name, 
       RD_Date_Time_UTC, 
	   Wind_Spd1, 
       Wind_Spd2, 
       Wind_Dir, 
       Air_Temp,
       RD_Station_ID AS ID
    FROM Met_Station_USCG_RawData 
    WHERE RD_Date_Time_UTC >= frm_terc_date
	      and
          RD_Date_Time_UTC <= to_terc_date
          and
          minute(RD_Date_Time_UTC) IN (0,20,40)
          and
          second(RD_Date_Time_UTC) = 0
          and
          RD_Station_ID = rpt_station
          
    ORDER BY RD_Date_Time_UTC ASC;
    
END