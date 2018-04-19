USE TERCDB;

DELIMITER //

CREATE PROCEDURE sp_terc_rcrd1_report()

	BEGIN
    
		SELECT rcrd_id,
		   rcrd_date,
		   rcrd_level01,
		   rcrd_level02
		FROM TERC_RCRD1;
    
    END //
    
DELIMITER ;
