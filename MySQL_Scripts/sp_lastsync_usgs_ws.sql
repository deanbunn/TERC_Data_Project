USE TERC;

DELIMITER //

CREATE PROCEDURE sp_lastsync_usgs_ws(IN ws_site_id int)

BEGIN

	SELECT TmStamp,
		   Site_ID,
	       Location
    FROM USGS_WS
    WHERE Site_ID = ws_site_id
    ORDER BY TmStamp desc
    LIMIT 1;

END //

DELIMITER ;