USE TERC;


UPDATE NASA_TB
SET TmStamp = str_to_date('2017-01-01 01:01:01','%Y-%m-%d %H:%i:%s')
WHERE nd_id = 1;

SELECT *
FROM NASA_TB