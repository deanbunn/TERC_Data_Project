USE TERCDB;

#SELECT * FROM TERC_RCRD1

#select * from mysql.user where user like 'terc%';

GRANT EXECUTE ON PROCEDURE TERCDB.sp_terc_rcrd1_data TO 'tercautomn'@'%';