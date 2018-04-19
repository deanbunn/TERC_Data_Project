USE TERC;

#SELECT * FROM CR1000_NS_Cascade_Wifi_LakeData;

#LOAD DATA LOCAL INFILE '/home/dbunn/Downloads/CR1000_NS_Cascade_Wifi_LakeData.csv' INTO TABLE TERC

#DELETE FROM CR1000_NS_Cascade_Wifi_LakeData
#WHERE ld_id != 40000

#LOAD DATA LOCAL INFILE '/home/dbunn/Downloads/ldtest.csv' INTO TABLE CR1000_TEST
#FIELDS TERMINATED BY ','
#IGNORE 1 LINES;

SELECT *
FROM CR1000_NS_Cascade_Wifi_LakeData;
