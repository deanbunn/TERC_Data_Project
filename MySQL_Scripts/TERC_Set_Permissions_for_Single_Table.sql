USE TERC;

#CALL sp_report_state_of_the_lake(2016);

#watashow

#SELECT * FROM State_Of_The_Lake

#GRANT INSERT ON TERC.State_Of_The_Lake TO 'watashow'@'%';

SHOW GRANTS FOR 'watashow'@'%';

