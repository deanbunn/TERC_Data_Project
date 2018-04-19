USE TERCDB;

#select * from mysql.user where user like 'terc%';

GRANT EXECUTE ON PROCEDURE TERCDB.sp_terc_rcrd1_data TO 'tercautoapi'@'%';