USE TERC;

DELIMITER //

CREATE PROCEDURE sp_lastsync_cr1000_ns_tahoe_vista_modem_lakedata()

BEGIN

SELECT TmStamp
FROM CR1000_NS_Tahoe_Vista_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END //

DELIMITER ;