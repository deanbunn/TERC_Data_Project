USE TERC;

#CALL sp_insert_cr1000_ns_dollar_point_modem_lakedata('2016-12-01 10:10:02',1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);

SELECT COUNT(*) FROM CR1000_NS_Dollar_Point_Modem_LakeData;

#SELECT * FROM CR1000_NS_Cascade_Wifi_LakeData ORDER BY TmStamp desc

#DELETE FROM CR1000_NS_Cascade_Wifi_LakeData WHERE ld_id = 371794;