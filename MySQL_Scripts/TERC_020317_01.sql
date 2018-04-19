USE TERC;

#INSERT INTO NS_Stations_Latest_Rpt(Station_Name,TmStamp)
#VALUES('NS-TahoeVista',current_date());

#SELECT *
#FROM NS_Stations_Latest_Rpt;

CALL sp_report_ns_stations_latest();

#UPDATE NS_Stations_Latest_Rpt
#SET Station_Name = 'Tahoe Vista'
#WHERE ts_id = 8;