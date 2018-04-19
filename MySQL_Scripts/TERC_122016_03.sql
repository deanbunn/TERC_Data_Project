USE TERC;

#CALL sp_insert_cr1000_ns_cascade_wifi_lakedata('2016-12-01 08:16:30.000000',50,3,4,5,6,7,8,9,10,11,12,13,NULL,-3.999999E-05);

#SELECT * FROM CR1000_NS_Cascade_Wifi_LakeData;

#select * from mysql.user where user  like  'terc%';

#GRANT EXECUTE ON PROCEDURE TERC.sp_insert_cr1000_ns_cascade_wifi_lakedata TO 'tercautomn'@'%';

