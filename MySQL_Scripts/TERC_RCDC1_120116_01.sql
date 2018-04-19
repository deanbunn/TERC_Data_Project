USE TERCDB;

DELIMITER //

CREATE PROCEDURE sp_terc_rcrd1_data()

	BEGIN
    
    SELECT * FROM TERC_RCRD1;
    
    END //
    
DELIMITER ;
