CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_terc_rcrd1_data`(IN sb_date varchar(200), IN sb_level1 int, IN sb_level2 int)
BEGIN
    
    DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(sb_date,'%Y-%m-%d %H:%i:%s');
    
    SET d_dupcnt = (SELECT COUNT(*) FROM TERC_RCRD1 WHERE rcrd_date = d_date);
    
    IF d_dupcnt = 0 THEN
    
		INSERT INTO TERC_RCRD1(rcrd_date,rcrd_level01,rcrd_level02)
		VALUES (d_date, sb_level1, sb_level2);
        
	END IF;
    
    
    END