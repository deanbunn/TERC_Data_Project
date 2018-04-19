USE TERC;


#UPDATE CR1000_NS_Tahoe_City_Modem_LakeData
#SET TmStamp = str_to_date('2000-01-01 00:00:00','%Y-%m-%d %H:%i:%s')
#WHERE ld_id = 1;

#SELECT * FROM CR1000_NS_Tahoe_City_Modem_LakeData;

UPDATE NS_Stations_Latest_Rpt
SET TmStamp = str_to_date('2000-01-01 00:00:00','%Y-%m-%d %H:%i:%s')
WHERE ts_id = 9;

SELECT *
FROM NS_Stations_Latest_Rpt