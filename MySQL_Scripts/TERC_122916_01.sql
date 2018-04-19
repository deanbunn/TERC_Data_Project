USE TERC;

/*
INSERT INTO DeanTest(TmStamp,RecNum,Temp_Avg) 
values 
('2016-01-01 22:10:00',1,28),
('2016-01-23 22:10:30',1,92),
('2016-02-01 16:10:20',4,2),
('2016-04-01 22:10:20',5,-2)
;
*/

/*
LOAD DATA LOCAL INFILE 'C:\\TERC\\DeanTestData.txt' INTO TABLE DeanTest 
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
*/

SELECT * FROM CR1000_NS_Glenbrook_Modem_LakeData;