USE TERC;

DELIMITER //

CREATE PROCEDURE sp_lastsync_nasa_tb(IN bd_tb_id int)

BEGIN

SELECT TmStamp,
	   TB_ID,
	   TB_Name
FROM NASA_TB
WHERE TB_ID = bd_tb_id
ORDER BY TmStamp desc
LIMIT 1;


END //
DELIMITER ;