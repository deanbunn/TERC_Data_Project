USE TERC;

DELIMITER //

CREATE PROCEDURE sp_insert_usgs_ws_data(IN ws_site_id int,
                                        IN ws_tmstamp varchar(100),
										IN ws_location varchar(100),
                                        IN ws_latitude real,
                                        IN ws_longitude real,
                                        IN ws_lake_level real,
                                        IN ws_streamflow real)

BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ws_tmstamp,'%Y-%m-%d %H:%i:%s');

	INSERT INTO USGS_WS(Site_ID,
                        TmStamp,
                        Location,
                        Latitude,
                        Longitude,
                        Lake_Level,
                        Streamflow)
	VALUES(ws_site_id,
		   d_date,
           ws_location,
           ws_latitude,
           ws_longitude,
           ws_lake_level,
           ws_streamflow);


END //

DELIMITER ;