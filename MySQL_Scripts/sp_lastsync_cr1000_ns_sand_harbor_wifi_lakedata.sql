USE TERC;

DELIMITER //

CREATE PROCEDURE sp_lastsync_cr1000_ns_sand_harbor_wifi_lakedata()

BEGIN

SELECT TmStamp
FROM CR1000_NS_Sand_Harbor_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END //

DELIMITER ;