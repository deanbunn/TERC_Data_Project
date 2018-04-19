USE TERC;

DELIMITER //

CREATE PROCEDURE sp_lastsync_cr1000_tahoe_rbr_homewood_lakedata()

BEGIN

SELECT TmStamp
FROM CR1000_Tahoe_RBR_Homewood_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END //

DELIMITER ;