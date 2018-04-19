-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: tercdb.c9tpz9shmvbi.us-west-2.rds.amazonaws.com    Database: TERC
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'TERC'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_camp_richardson_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_camp_richardson_modem_lakedata`(IN ld_tmstamp varchar(200), 
                                                               IN ld_recnum bigint, 
                                                               IN ld_ls_conductivity_avg real,
                                                               IN ld_ls_temp_avg real,
                                                               IN ld_ls_rawpressure_avg real,
                                                               IN ld_ls_do_avg real,
                                                               IN ld_ls_chlorophyll_avg real,
                                                               IN ld_ls_cdom_avg real,
                                                               IN ld_ls_turbidity_avg real,
                                                               IN ld_lakesensor_battv_min real,
                                                               IN ld_bp_mmhg real,
                                                               IN ld_depth_m4c_avg real,
                                                               IN ld_depth_m4c_max real,
                                                               IN ld_depth_m4c_min real,
                                                               IN ld_waveheight real,
                                                               IN ld_conductivity25c_avg real,
                                                               IN ld_ls_do_conc real,
                                                               IN ld_ls_do_probetemp_avg real)
BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
		INSERT INTO CR1000_NS_Camp_Richardson_Modem_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg,
                                                    LS_DO_Conc_Avg,
                                                    LS_DO_ProbeTemp_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg,
                ld_ls_do_conc,
                ld_ls_do_probetemp_avg);
        
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_cascade_wifi_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_cascade_wifi_lakedata`(IN ld_tmstamp varchar(200), 
                                                           IN ld_recnum bigint, 
                                                           IN ld_ls_conductivity_avg real,
                                                           IN ld_ls_temp_avg real,
                                                           IN ld_ls_rawpressure_avg real,
                                                           IN ld_ls_do_avg real,
                                                           IN ld_ls_chlorophyll_avg real,
                                                           IN ld_ls_cdom_avg real,
                                                           IN ld_ls_turbidity_avg real,
                                                           IN ld_lakesensor_battv_min real,
                                                           IN ld_bp_mmhg real,
                                                           IN ld_depth_m4c_avg real,
                                                           IN ld_depth_m4c_max real,
                                                           IN ld_depth_m4c_min real,
                                                           IN ld_waveheight real,
                                                           IN ld_conductivity25c_avg real)
BEGIN

	#DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    #SET d_dupcnt = (SELECT COUNT(*) FROM CR1000_NS_Cascade_Wifi_LakeData WHERE TmStamp = d_date);
    
    #IF d_dupcnt = 0 THEN
    
		INSERT INTO CR1000_NS_Cascade_Wifi_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg);
        
	#END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_dollar_point_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_dollar_point_modem_lakedata`(IN ld_tmstamp varchar(200), 
																 IN ld_recnum bigint, 
                                                                 IN ld_ls_conductivity_avg real,
                                                                 IN ld_ls_temp_avg real,
                                                                 IN ld_ls_rawpressure_avg real,
                                                                 IN ld_ls_do_avg real,
                                                                 IN ld_ls_chlorophyll_avg real,
                                                                 IN ld_ls_cdom_avg real,
                                                                 IN ld_ls_turbidity_avg real,
                                                                 IN ld_lakesensor_battv_min real,
                                                                 IN ld_bp_mmhg real,
                                                                 IN ld_depth_m4c_avg real,
                                                                 IN ld_depth_m4c_max real,
                                                                 IN ld_depth_m4c_min real,
                                                                 IN ld_waveheight real,
                                                                 IN ld_conductivity25c_avg real)
BEGIN

	#DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    #SET d_dupcnt = (SELECT COUNT(*) FROM CR1000_NS_Dollar_Point_Modem_LakeData WHERE TmStamp = d_date);
    
    #IF d_dupcnt = 0 THEN
    
		INSERT INTO CR1000_NS_Dollar_Point_Modem_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg);
        
	#END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_glenbrook_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_glenbrook_modem_lakedata`(IN ld_tmstamp varchar(200), 
																 IN ld_recnum bigint, 
                                                                 IN ld_ls_conductivity_avg real,
                                                                 IN ld_ls_temp_avg real,
                                                                 IN ld_ls_rawpressure_avg real,
                                                                 IN ld_ls_do_avg real,
                                                                 IN ld_ls_chlorophyll_avg real,
                                                                 IN ld_ls_cdom_avg real,
                                                                 IN ld_ls_turbidity_avg real,
                                                                 IN ld_lakesensor_battv_min real,
                                                                 IN ld_bp_mmhg real,
                                                                 IN ld_depth_m4c_avg real,
                                                                 IN ld_depth_m4c_max real,
                                                                 IN ld_depth_m4c_min real,
                                                                 IN ld_waveheight real,
                                                                 IN ld_conductivity25c_avg real)
BEGIN

	#DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    #SET d_dupcnt = (SELECT COUNT(*) FROM CR1000_NS_Glenbrook_Modem_LakeData WHERE TmStamp = d_date);
    
    #IF d_dupcnt = 0 THEN
    
		INSERT INTO CR1000_NS_Glenbrook_Modem_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg);
        
	#END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_homewood_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_homewood_modem_lakedata`(IN ld_tmstamp varchar(200), 
																 IN ld_recnum bigint, 
                                                                 IN ld_ls_conductivity_avg real,
                                                                 IN ld_ls_temp_avg real,
                                                                 IN ld_ls_rawpressure_avg real,
                                                                 IN ld_ls_do_avg real,
                                                                 IN ld_ls_chlorophyll_avg real,
                                                                 IN ld_ls_cdom_avg real,
                                                                 IN ld_ls_turbidity_avg real,
                                                                 IN ld_lakesensor_battv_min real,
                                                                 IN ld_bp_mmhg real,
                                                                 IN ld_depth_m4c_avg real,
                                                                 IN ld_depth_m4c_max real,
                                                                 IN ld_depth_m4c_min real,
                                                                 IN ld_waveheight real,
                                                                 IN ld_conductivity25c_avg real)
BEGIN

	#DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    #SET d_dupcnt = (SELECT COUNT(*) FROM CR1000_NS_Homewood_Modem_LakeData WHERE TmStamp = d_date);
    
    #IF d_dupcnt = 0 THEN
    
		INSERT INTO CR1000_NS_Homewood_Modem_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg);
        
	#END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_meeks_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_meeks_modem_lakedata`(IN ld_tmstamp varchar(200), 
																 IN ld_recnum bigint, 
                                                                 IN ld_ls_conductivity_avg real,
                                                                 IN ld_ls_temp_avg real,
                                                                 IN ld_ls_rawpressure_avg real,
                                                                 IN ld_ls_do_avg real,
                                                                 IN ld_ls_chlorophyll_avg real,
                                                                 IN ld_ls_cdom_avg real,
                                                                 IN ld_ls_turbidity_avg real,
                                                                 IN ld_lakesensor_battv_min real,
                                                                 IN ld_bp_mmhg real,
                                                                 IN ld_depth_m4c_avg real,
                                                                 IN ld_depth_m4c_max real,
                                                                 IN ld_depth_m4c_min real,
                                                                 IN ld_waveheight real,
                                                                 IN ld_conductivity25c_avg real)
BEGIN

	#DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    #SET d_dupcnt = (SELECT COUNT(*) FROM CR1000_NS_Meeks_Modem_LakeData WHERE TmStamp = d_date);
    
    #IF d_dupcnt = 0 THEN
    
		INSERT INTO CR1000_NS_Meeks_Modem_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg);
        
	#END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_rubicon_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_rubicon_modem_lakedata`(IN ld_tmstamp varchar(200), 
																 IN ld_recnum bigint, 
                                                                 IN ld_ls_conductivity_avg real,
                                                                 IN ld_ls_temp_avg real,
                                                                 IN ld_ls_rawpressure_avg real,
                                                                 IN ld_ls_do_avg real,
                                                                 IN ld_ls_chlorophyll_avg real,
                                                                 IN ld_ls_cdom_avg real,
                                                                 IN ld_ls_turbidity_avg real,
                                                                 IN ld_lakesensor_battv_min real,
                                                                 IN ld_bp_mmhg real,
                                                                 IN ld_depth_m4c_avg real,
                                                                 IN ld_depth_m4c_max real,
                                                                 IN ld_depth_m4c_min real,
                                                                 IN ld_waveheight real,
                                                                 IN ld_conductivity25c_avg real)
BEGIN

	#DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    #SET d_dupcnt = (SELECT COUNT(*) FROM CR1000_NS_Rubicon_Modem_LakeData WHERE TmStamp = d_date);
    
    #IF d_dupcnt = 0 THEN
    
		INSERT INTO CR1000_NS_Rubicon_Modem_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg);
        
	#END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_sand_harbor_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_sand_harbor_modem_lakedata`(IN ld_tmstamp varchar(200), 
																 IN ld_recnum bigint, 
                                                                 IN ld_ls_conductivity_avg real,
                                                                 IN ld_ls_temp_avg real,
                                                                 IN ld_ls_rawpressure_avg real,
                                                                 IN ld_ls_do_avg real,
                                                                 IN ld_ls_chlorophyll_avg real,
                                                                 IN ld_ls_cdom_avg real,
                                                                 IN ld_ls_turbidity_avg real,
                                                                 IN ld_lakesensor_battv_min real,
                                                                 IN ld_bp_mmhg real,
                                                                 IN ld_depth_m4c_avg real,
                                                                 IN ld_depth_m4c_max real,
                                                                 IN ld_depth_m4c_min real,
                                                                 IN ld_waveheight real,
                                                                 IN ld_conductivity25c_avg real)
BEGIN

	#DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    #SET d_dupcnt = (SELECT COUNT(*) FROM CR1000_NS_Sand_Harbor_Modem_LakeData WHERE TmStamp = d_date);
    
    #IF d_dupcnt = 0 THEN
    
		INSERT INTO CR1000_NS_Sand_Harbor_Modem_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg);
        
	#END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_tahoe_city_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_tahoe_city_modem_lakedata`(IN ld_tmstamp varchar(200), 
                                                               IN ld_recnum bigint, 
                                                               IN ld_ls_conductivity_avg real,
                                                               IN ld_ls_temp_avg real,
                                                               IN ld_ls_rawpressure_avg real,
                                                               IN ld_ls_do_avg real,
                                                               IN ld_ls_chlorophyll_avg real,
                                                               IN ld_ls_cdom_avg real,
                                                               IN ld_ls_turbidity_avg real,
                                                               IN ld_lakesensor_battv_min real,
                                                               IN ld_bp_mmhg real,
                                                               IN ld_depth_m4c_avg real,
                                                               IN ld_depth_m4c_max real,
                                                               IN ld_depth_m4c_min real,
                                                               IN ld_waveheight real,
                                                               IN ld_conductivity25c_avg real,
                                                               IN ld_ls_do_conc real,
                                                               IN ld_ls_do_probetemp_avg real)
BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
		INSERT INTO CR1000_NS_Tahoe_City_Modem_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg,
                                                    LS_DO_Conc_Avg,
                                                    LS_DO_ProbeTemp_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg,
                ld_ls_do_conc,
                ld_ls_do_probetemp_avg);
        
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_tahoe_vista_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_tahoe_vista_modem_lakedata`(IN ld_tmstamp varchar(200), 
																 IN ld_recnum bigint, 
                                                                 IN ld_ls_conductivity_avg real,
                                                                 IN ld_ls_temp_avg real,
                                                                 IN ld_ls_rawpressure_avg real,
                                                                 IN ld_ls_do_avg real,
                                                                 IN ld_ls_chlorophyll_avg real,
                                                                 IN ld_ls_cdom_avg real,
                                                                 IN ld_ls_turbidity_avg real,
                                                                 IN ld_lakesensor_battv_min real,
                                                                 IN ld_bp_mmhg real,
                                                                 IN ld_depth_m4c_avg real,
                                                                 IN ld_depth_m4c_max real,
                                                                 IN ld_depth_m4c_min real,
                                                                 IN ld_waveheight real,
                                                                 IN ld_conductivity25c_avg real)
BEGIN

	#DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    #SET d_dupcnt = (SELECT COUNT(*) FROM CR1000_NS_Tahoe_Vista_Modem_LakeData WHERE TmStamp = d_date);
    
    #IF d_dupcnt = 0 THEN
    
		INSERT INTO CR1000_NS_Tahoe_Vista_Modem_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg);
        
	#END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_ns_timber_cove_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_ns_timber_cove_modem_lakedata`(IN ld_tmstamp varchar(200), 
                                                               IN ld_recnum bigint, 
                                                               IN ld_ls_conductivity_avg real,
                                                               IN ld_ls_temp_avg real,
                                                               IN ld_ls_rawpressure_avg real,
                                                               IN ld_ls_do_avg real,
                                                               IN ld_ls_chlorophyll_avg real,
                                                               IN ld_ls_cdom_avg real,
                                                               IN ld_ls_turbidity_avg real,
                                                               IN ld_lakesensor_battv_min real,
                                                               IN ld_bp_mmhg real,
                                                               IN ld_depth_m4c_avg real,
                                                               IN ld_depth_m4c_max real,
                                                               IN ld_depth_m4c_min real,
                                                               IN ld_waveheight real,
                                                               IN ld_conductivity25c_avg real,
                                                               IN ld_ls_do_conc real,
                                                               IN ld_ls_do_probetemp_avg real)
BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
		INSERT INTO CR1000_NS_Timber_Cove_Modem_LakeData(TmStamp,
													RecNum,
                                                    LS_Conductivity_Avg,
                                                    LS_Temp_Avg,
                                                    LS_RawPressure_Avg,
                                                    LS_DO_Avg,
                                                    LS_Chlorophyll_Avg,
                                                    LS_CDOM_Avg,
                                                    LS_Turbidity_Avg,
                                                    LakeSensor_BattV_Min,
                                                    BP_mmHg,
                                                    Depth_m4C_Avg,
                                                    Depth_m4C_Max,
                                                    Depth_m4C_Min,
                                                    WaveHeight,
                                                    Conductivity25C_Avg,
                                                    LS_DO_Conc_Avg,
                                                    LS_DO_ProbeTemp_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg,
                ld_ls_do_conc,
                ld_ls_do_probetemp_avg);
        
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cr1000_tahoe_rbr_homewood_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_cr1000_tahoe_rbr_homewood_lakedata`(IN ld_tmstamp varchar(200), 
																 IN ld_recnum bigint, 
                                                                 IN ld_xr_t1 real,
                                                                 IN ld_xr_t2 real,
                                                                 IN ld_xr_t3 real,
                                                                 IN ld_xr_t4 real,
                                                                 IN ld_xr_t5 real,
                                                                 IN ld_xr_t6 real,
                                                                 IN ld_xr_t7 real,
                                                                 IN ld_xr_t8 real,
                                                                 IN ld_xr_t9 real,
                                                                 IN ld_xr_t10 real,
                                                                 IN ld_xr_t11 real,
                                                                 IN ld_xr_t12 real,
                                                                 IN ld_xr_t13 real,
                                                                 IN ld_xr_t14 real,
                                                                 IN ld_xr_t15 real,
                                                                 IN ld_xr_t16 real,
                                                                 IN ld_xr_DO2 real,
                                                                 IN ld_xr_raw_Z real,
                                                                 IN ld_xr_batt real,
                                                                 IN ld_bp_mmhg real,
                                                                 IN ld_o2_um_corr_t16 real,
                                                                 IN ld_pct_sat_t1 real,
                                                                 IN ld_o2_um_cal_t1 real,
                                                                 IN ld_depth_m4c real,
                                                                 IN ld_bp_mmhg_avg real,
                                                                 IN ld_bp_mmhgavg real)
BEGIN

	#DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    #SET d_dupcnt = (SELECT COUNT(*) FROM CR1000_Tahoe_RBR_Homewood_LakeData WHERE TmStamp = d_date);
    
    #IF d_dupcnt = 0 THEN
    
		INSERT INTO CR1000_Tahoe_RBR_Homewood_LakeData(TmStamp,
													RecNum,
                                                    XR_T1,
                                                    XR_T2,
                                                    XR_T3,
                                                    XR_T4,
                                                    XR_T5,
                                                    XR_T6,
                                                    XR_T7,
                                                    XR_T8,
                                                    XR_T9,
                                                    XR_T10,
                                                    XR_T11,
                                                    XR_T12,
                                                    XR_T13,
                                                    XR_T14,
                                                    XR_T15,
                                                    XR_T16,
                                                    XR_DO2,
                                                    XR_Raw_Z,
                                                    XR_Batt,
                                                    BP_mmHg,
                                                    O2_uM_corr_T16,
                                                    Pct_Sat_T1,
                                                    O2_uM_cal_T1,
                                                    Depth_m4C,
                                                    BP_mmHg_Avg,
                                                    BP_mmHgAVG)
		VALUES (d_date,
				ld_recnum,
                ld_xr_t1,
				ld_xr_t2,
				ld_xr_t3,
				ld_xr_t4,
			    ld_xr_t5,
				ld_xr_t6,
				ld_xr_t7,
				ld_xr_t8,
				ld_xr_t9,
				ld_xr_t10,
				ld_xr_t11,
				ld_xr_t12,
				ld_xr_t13,
				ld_xr_t14,
				ld_xr_t15,
				ld_xr_t16,
				ld_xr_DO2,
				ld_xr_raw_Z,
				ld_xr_batt,
				ld_bp_mmhg,
				ld_o2_um_corr_t16,
				ld_pct_sat_t1,
				ld_o2_um_cal_t1,
				ld_depth_m4c,
				ld_bp_mmhg_avg,
				ld_bp_mmhgavg);
        
	#END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_met_station_rawdata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_met_station_rawdata`(IN md_station_id varchar(50),
											   IN md_date_time_utc varchar(100),
											   IN md_date_time_posix bigint,
											   IN md_year int,
											   IN md_julian_day int,
											   IN md_time int,
                                               IN md_wind_spd1 real,
									           IN md_wind_spd2 real,
									           IN md_wind_dir real,
											   IN md_wind_dir_sd real,
											   IN md_gust real,
											   IN md_air_temp real,
									           IN md_air_temp_sd real,
									           IN md_rh real,
									           IN md_rh_sd real,
											   IN md_atm_pres real,
											   IN md_atm_pres_sd real,
									           IN md_precip real,
									           IN md_raft_dir real,
									           IN md_water_temp real,
											   IN md_water_temp_sd real,
									           IN md_batt real,
									           IN md_rd_note text,
                                               IN md_rd_station_id int)
BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(md_date_time_utc,'%Y-%m-%d %H:%i:%s');
    
    INSERT INTO Met_Stations_RawData(Station_ID,
									 RD_Date_Time_UTC,
									 RD_Date_Time_POSIX,
									 RD_Year,
									 RD_Julian_Day,
									 RD_Time,
									 Wind_Spd1,
									 Wind_Spd2,
									 Wind_Dir,
									 Wind_Dir_SD,
									 GUST,
									 Air_Temp,
									 Air_Temp_SD,
									 RH,
									 RH_SD,
									 Atm_Pres,
									 Atm_Pres_SD,
									 Precip,
									 Raft_Dir,
									 Water_Temp,
									 Water_Temp_SD,
									 BATT,
									 RD_Note,
                                     RD_Station_ID)
		VALUES (md_station_id,
				d_date,
				md_date_time_posix,
				md_year,
				md_julian_day,
				md_time,
                md_wind_spd1,
			    md_wind_spd2,
				md_wind_dir,
				md_wind_dir_sd,
				md_gust,
				md_air_temp,
				md_air_temp_sd,
				md_rh,
				md_rh_sd,
				md_atm_pres,
				md_atm_pres_sd,
				md_precip,
				md_raft_dir,
				md_water_temp,
				md_water_temp_sd,
				md_batt,
			    md_rd_note,
                md_rd_station_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_met_station_uscg_rawdata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_met_station_uscg_rawdata`(IN md_station_id varchar(50),
													IN md_date_time_utc varchar(100),
                                                    IN md_date_time_posix bigint,
                                                    IN md_year int,
                                                    IN md_julian_day int,
                                                    IN md_time int,
                                                    IN md_kz real,
                                                    IN md_kz_sd real,
                                                    IN md_epp_lw real,
                                                    IN md_epp_lw_sd real,
                                                    IN md_cnr1_rsin real,
                                                    IN md_cnr1_rsin_sd real,
                                                    IN md_cnr1_rsout real,
                                                    IN md_cnr1_rsout_sd real,
                                                    IN md_cnr1_rlin real,
                                                    IN md_cnr1_rlin_sd real,
                                                    IN md_cnr1_rlout real,
                                                    IN md_cnr1_rlout_sd real,
                                                    IN md_precip real,
                                                    IN md_atm_pres real,
                                                    IN md_atm_pres_sd real,
                                                    IN md_air_temp real,
                                                    IN md_air_temp_sd real,
                                                    IN md_rh real,
                                                    IN md_rh_sd real,
                                                    IN md_water_temp real,
                                                    IN md_water_temp_sd real,
                                                    IN md_wind_spd1 real,
                                                    IN md_wind_spd2 real,
                                                    IN md_wind_dir real,
                                                    IN md_wind_dir_sd real,
                                                    IN md_gust real,
                                                    IN md_os_wind_spd1 real,
                                                    IN md_os_wind_spd2 real,
                                                    IN md_os_wind_dir real,
                                                    IN md_os_wind_dir_sd real,
                                                    IN md_batt real,
                                                    IN md_rd_station_id int)
BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(md_date_time_utc,'%Y-%m-%d %H:%i:%s');
    
    INSERT INTO Met_Station_USCG_RawData(Station_ID,
										 RD_Date_Time_UTC,
										 RD_Date_Time_POSIX,
										 RD_Year,
										 RD_Julian_Day,
										 RD_Time,
										 KZ,
									     KZ_SD,
										 Epp_LW,
										 Epp_LW_SD,
										 CNR1_Rsin,
										 CNR1_Rsin_SD,
									     CNR1_Rsout,
									     CNR1_Rsout_SD,
										 CNR1_Rlin,
										 CNR1_Rlin_SD,
										 CNR1_Rlout,
										 CNR1_Rlout_SD,
										 Precip,
										 Atm_Pres,
										 Atm_Pres_SD,
										 Air_Temp,
										 Air_Temp_SD,
										 RH,
										 RH_SD,
										 Water_Temp,
										 Water_Temp_SD,
										 Wind_Spd1,
										 Wind_Spd2,
										 Wind_Dir,
										 Wind_Dir_SD,
										 GUST,
										 OS_Wind_Spd1,
										 OS_Wind_Spd2,
										 OS_Wind_Dir,
										 OS_Wind_Dir_SD,
										 BATT,
                                         RD_Station_ID)
		VALUES (md_station_id,
				d_date,
				md_date_time_posix,
				md_year,
				md_julian_day,
				md_time,
				md_kz,
				md_kz_sd,
			    md_epp_lw,
				md_epp_lw_sd,
			    md_cnr1_rsin,
				md_cnr1_rsin_sd,
				md_cnr1_rsout,
			    md_cnr1_rsout_sd,
				md_cnr1_rlin,
				md_cnr1_rlin_sd,
				md_cnr1_rlout,
				md_cnr1_rlout_sd, 
			    md_precip,
			    md_atm_pres,
				md_atm_pres_sd,
				md_air_temp,
				md_air_temp_sd,
			    md_rh,
				md_rh_sd,
		        md_water_temp,
			    md_water_temp_sd,
				md_wind_spd1,
			    md_wind_spd2,
				md_wind_dir,
				md_wind_dir_sd,
				md_gust,
			    md_os_wind_spd1,
				md_os_wind_spd2,
				md_os_wind_dir,
				md_os_wind_dir_sd,
				md_batt,
                md_rd_station_id);
        

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_nasa_tb_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_nasa_tb_data`(IN bd_tb_id int,
										IN bd_tb_name varchar(25),
										IN bd_tmstamp varchar(100),
										IN bd_date_rd varchar(25),
										IN bd_time_rd varchar(25),
										IN bd_rbr_5p5_m real,
										IN bd_rbr_5p0_m real,
										IN bd_rbr_4p0_m real,
										IN bd_rbr_3p0_m real,
										IN bd_rbr_2p0_m real,
										IN bd_rbr_1p5_m real,
										IN bd_rbr_1p0_m real,
										IN bd_rbr_0p5_m real,
										IN bd_windspeed_1 real,
										IN bd_winddir_1 real,
										IN bd_compass_1 real,
										IN bd_airtemp_1 real,
										IN bd_rh_1 real,
										IN bd_pressure_1 real,
										IN bd_windspeed_2 real,
										IN bd_winddir_2 real,
										IN bd_compass_2 real,
										IN bd_airtemp_2 real,
										IN bd_rh_2 real,
										IN bd_pressure_2 real)
BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(bd_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    INSERT INTO NASA_TB(TB_ID,
						TB_Name,
						TmStamp,
						Date_RD,
						Time_RD,
						RBR_5p5_m,
						RBR_5p0_m,
						RBR_4p0_m,
						RBR_3p0_m,
						RBR_2p0_m,
						RBR_1p5_m,
						RBR_1p0_m,
						RBR_0p5_m,
						WindSpeed_1,
						WindDir_1,
						Compass_1,
						AirTemp_1,
						RH_1,
						Pressure_1,
						WindSpeed_2,
						WindDir_2,
						Compass_2,
						AirTemp_2,
						RH_2,
						Pressure_2)
		VALUES (bd_tb_id,
				bd_tb_name,
				d_date,									
				bd_date_rd,
				bd_time_rd,
				bd_rbr_5p5_m,
				bd_rbr_5p0_m,
				bd_rbr_4p0_m,
				bd_rbr_3p0_m,
				bd_rbr_2p0_m,
				bd_rbr_1p5_m,
				bd_rbr_1p0_m,
				bd_rbr_0p5_m,
				bd_windspeed_1,
				bd_winddir_1,
				bd_compass_1,
				bd_airtemp_1,
				bd_rh_1,
				bd_pressure_1,
				bd_windspeed_2,
				bd_winddir_2,
				bd_compass_2,
				bd_airtemp_2,
				bd_rh_2,
				bd_pressure_2);
        
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_usgs_ws_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_insert_usgs_ws_data`(IN ws_site_id int,
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


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_camp_richardson_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_camp_richardson_modem_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Camp_Richardson_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_cascade_wifi_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_cascade_wifi_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Cascade_Wifi_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_dollar_point_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_dollar_point_modem_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Dollar_Point_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_glenbrook_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_glenbrook_modem_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Glenbrook_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_homewood_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_homewood_modem_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Homewood_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_meeks_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_meeks_modem_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Meeks_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_rubicon_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_rubicon_modem_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Rubicon_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_sand_harbor_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_sand_harbor_modem_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Sand_Harbor_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_tahoe_city_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_tahoe_city_modem_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Tahoe_City_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_tahoe_vista_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_tahoe_vista_modem_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Tahoe_Vista_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_ns_timber_cove_modem_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_ns_timber_cove_modem_lakedata`()
BEGIN

SELECT TmStamp,
	    LS_Conductivity_Avg,
        LS_Temp_Avg,
        LS_RawPressure_Avg,
	    LS_Chlorophyll_Avg,
	    LS_CDOM_Avg,
	    LS_Turbidity_Avg,
	    LakeSensor_BattV_Min,
	    BP_mmHg,
	    Depth_m4C_Avg,
	    Depth_m4C_Max,
	    Depth_m4C_Min,
	    WaveHeight,
	    Conductivity25C_Avg,
        LS_DO_Avg
FROM CR1000_NS_Timber_Cove_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_cr1000_tahoe_rbr_homewood_lakedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_cr1000_tahoe_rbr_homewood_lakedata`()
BEGIN

SELECT TmStamp
FROM CR1000_Tahoe_RBR_Homewood_LakeData
ORDER BY TmStamp desc
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_nasa_tb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_nasa_tb`(IN bd_tb_id int)
BEGIN

SELECT TmStamp,
	   TB_ID,
	   TB_Name
FROM NASA_TB
WHERE TB_ID = bd_tb_id
ORDER BY TmStamp desc
LIMIT 1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lastsync_usgs_ws` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_lastsync_usgs_ws`(IN ws_site_id int)
BEGIN

	SELECT TmStamp,
		   Site_ID,
	       Location
    FROM USGS_WS
    WHERE Site_ID = ws_site_id
    ORDER BY TmStamp desc
    LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_met_station_granrange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_met_station_granrange`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100), IN rpt_station int)
BEGIN

	DECLARE frm_terc_date datetime;
    DECLARE to_terc_date datetime;

    SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
    SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');
    
    SELECT Station_ID AS Station_Name, 
       RD_Date_Time_UTC, 
	   Wind_Spd1, 
       Wind_Spd2, 
       Wind_Dir, 
       Air_Temp,
       RD_Station_ID AS ID
    FROM Met_Stations_RawData 
    WHERE RD_Date_Time_UTC >= frm_terc_date
	      and
          RD_Date_Time_UTC <= to_terc_date
          and
          minute(RD_Date_Time_UTC) IN (0,20,40)
          and
          second(RD_Date_Time_UTC) = 0
          and
          RD_Station_ID = rpt_station
    
    UNION ALL
    
    SELECT Station_ID AS Station_Name, 
       RD_Date_Time_UTC, 
	   Wind_Spd1, 
       Wind_Spd2, 
       Wind_Dir, 
       Air_Temp,
       RD_Station_ID AS ID
    FROM Met_Station_USCG_RawData 
    WHERE RD_Date_Time_UTC >= frm_terc_date
	      and
          RD_Date_Time_UTC <= to_terc_date
          and
          minute(RD_Date_Time_UTC) IN (0,20,40)
          and
          second(RD_Date_Time_UTC) = 0
          and
          RD_Station_ID = rpt_station
          
    ORDER BY RD_Date_Time_UTC ASC;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_nasa_tb_granrange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_nasa_tb_granrange`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100), IN rpt_station int)
BEGIN

	DECLARE frm_terc_date datetime;
    DECLARE to_terc_date datetime;

    SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
    SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');
    
    SELECT TB_NAME AS Station_Name,
           TmStamp, 
	       RBR_0p5_m,
		   WindSpeed_1, 
           AirTemp_1, 
           WindSpeed_2,
           AirTemp_2,
           TB_ID AS ID
    FROM NASA_TB 
    WHERE TmStamp >= frm_terc_date
	      and
          TmStamp <= to_terc_date
          and
          minute(TmStamp) IN (0,20,40)
          and
          second(TmStamp) = 0
          and
          TB_ID = rpt_station
          
	ORDER BY TmStamp ASC;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_stations_latest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_stations_latest`()
BEGIN

	SELECT ts_id,
		   Station_Name,
		   TmStamp,
           LS_Conductivity_Avg,
           LS_Temp_Avg,
           LS_RawPressure_Avg,
	       LS_Chlorophyll_Avg,
	       LS_CDOM_Avg,
	       LS_Turbidity_Avg,
	       LakeSensor_BattV_Min,
	       BP_mmHg,
	       Depth_m4C_Avg,
	       Depth_m4C_Max,
	       Depth_m4C_Min,
	       WaveHeight,
	       Conductivity25C_Avg,
           LS_DO_Avg
    FROM NS_Stations_Latest_Rpt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_stations_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_stations_update`(IN rpt_ts_id int, 
                                              IN rpt_tmstamp varchar(200), 
											  IN rpt_ls_conductivity_avg real,
											  IN rpt_ls_temp_avg real,
											  IN rpt_ls_rawpressure_avg real,
											  IN rpt_ls_chlorophyll_avg real,
											  IN rpt_ls_cdom_avg real,
											  IN rpt_ls_turbidity_avg real,
											  IN rpt_lakesensor_battv_min real,
											  IN rpt_bp_mmhg real,
											  IN rpt_depth_m4c_avg real,
											  IN rpt_depth_m4c_max real,
											  IN rpt_depth_m4c_min real,
											  IN rpt_waveheight real,
											  IN rpt_conductivity25c_avg real,
                                              IN rpt_ls_do_avg real)
BEGIN

	DECLARE d_date datetime;
    
    SET d_date = str_to_date(rpt_tmstamp,'%Y-%m-%d %H:%i:%s');


    UPDATE NS_Stations_Latest_Rpt
    SET TmStamp = d_date,
        LS_Conductivity_Avg = rpt_ls_conductivity_avg,
        LS_Temp_Avg = rpt_ls_temp_avg,
        LS_RawPressure_Avg = rpt_ls_rawpressure_avg,
        LS_Chlorophyll_Avg = rpt_ls_chlorophyll_avg,
        LS_CDOM_Avg = rpt_ls_cdom_avg,
        LS_Turbidity_Avg = rpt_ls_turbidity_avg,
        LakeSensor_BattV_Min = rpt_lakesensor_battv_min,
        BP_mmHg = rpt_bp_mmhg,
        Depth_m4C_Avg = rpt_depth_m4c_avg,
        Depth_m4C_Max = rpt_depth_m4c_max,
        Depth_m4C_Min = rpt_depth_m4c_min,
        WaveHeight = rpt_waveheight,
        Conductivity25C_Avg = rpt_conductivity25c_avg,
        LS_DO_Avg = rpt_ls_do_avg
	WHERE ts_id = rpt_ts_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_camprichardson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_camprichardson`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Camp_Richardson_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      AND
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_cascade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_cascade`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Cascade_Wifi_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      AND
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_dollarpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_dollarpoint`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Dollar_Point_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      and
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_glenbrook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_glenbrook`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Glenbrook_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      and
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_homewood` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_homewood`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Homewood_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      and
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_meeks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_meeks`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Meeks_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      and
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_rubicon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_rubicon`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Rubicon_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      and
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_sandharbor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_sandharbor`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Sand_Harbor_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      and
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_tahoecity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_tahoecity`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Tahoe_City_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      AND
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_tahoevista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_tahoevista`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Tahoe_Vista_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      and
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_granrange_timbercove` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_granrange_timbercove`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Timber_Cove_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
      and
      minute(TmStamp) IN (0,20,40)
      AND
      second(TmStamp) = 0
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_camprichardson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_camprichardson`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');
  
SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Camp_Richardson_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_cascade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_cascade`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');
  
SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Cascade_Wifi_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_dollarpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_dollarpoint`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Dollar_Point_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_glenbrook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_glenbrook`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Glenbrook_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_homewood` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_homewood`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Homewood_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_meeks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_meeks`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Meeks_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_rubicon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_rubicon`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Rubicon_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_sandharbor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_sandharbor`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Sand_Harbor_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_tahoecity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_tahoecity`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');
  
SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Tahoe_City_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_tahoevista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_tahoevista`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');

SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Tahoe_Vista_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_ns_station_range_timbercove` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_ns_station_range_timbercove`(IN rpt_tmstamp_from varchar(100),IN rpt_tmstamp_to varchar(100))
BEGIN

DECLARE frm_terc_date datetime;
DECLARE to_terc_date datetime;

SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');
  
SELECT TmStamp,
	   LS_Chlorophyll_Avg,
       LS_Temp_Avg,
	   LS_Turbidity_Avg,
       WaveHeight
FROM CR1000_NS_Timber_Cove_Modem_LakeData
WHERE TmStamp >= frm_terc_date
	  and
      TmStamp <= to_terc_date
ORDER BY TmStamp asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_state_of_the_lake` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_state_of_the_lake`(IN rpt_year int)
BEGIN

	SELECT Report_Year,
	   Max_Air_Temp_Ave,	
	   Min_Air_Temp_Ave,	
	   Annual_Precipitation,	
	   Annual_Snow,
	   Snow_Propotion,
	   Monthly_Max_Air_Temp_Jan,	
	   Monthly_Max_Air_Temp_Feb,
	   Monthly_Max_Air_Temp_Mar,
	   Monthly_Max_Air_Temp_Apr,
	   Monthly_Max_Air_Temp_May,
	   Monthly_Max_Air_Temp_Jun,
	   Monthly_Max_Air_Temp_July,	
	   Monthly_Max_Air_Temp_Aug,	
	   Monthly_Max_Air_Temp_Sep,	
	   Monthly_Max_Air_Temp_Oct,
	   Monthly_Max_Air_Temp_Nov,
	   Monthly_Max_Air_Temp_Dec,
	   Monthly_Min_Air_Temp_Jan,
	   Monthly_Min_Air_Temp_Feb,
	   Monthly_Min_Air_Temp_Mar,
	   Monthly_Min_Air_Temp_Apr,
	   Monthly_Min_Air_Temp_May,
	   Monthly_Min_Air_Temp_Jun,
	   Monthly_Min_Air_Temp_July,
	   Monthly_Min_Air_Temp_Aug,
	   Monthly_Min_Air_Temp_Sep,
	   Monthly_Min_Air_Temp_Oct,
	   Monthly_Min_Air_Temp_Nov,
	   Monthly_Min_Air_Temp_Dec,
	   Monthly_Precipitation_Jan,
	   Monthly_Precipitation_Feb,
	   Monthly_Precipitation_Mar,
	   Monthly_Precipitation_Apr,
	   Monthly_Precipitation_May,
	   Monthly_Precipitation_Jun,
	   Monthly_Precipitation_July,
	   Monthly_Precipitation_Aug,
	   Monthly_Precipitation_Sep,
	   Monthly_Precipitation_Oct,
	   Monthly_Precipitation_Nov,
	   Monthly_Precipitation_Dec,
	   Surface_Water_Temp_Ave,
	   Secchi_Annual_Ave,
	   Secchi_Winter_Ave,
	   Secchi_Summer_Ave,
	   Chla_Ave
FROM State_Of_The_Lake
WHERE Report_Year = rpt_year;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_state_of_the_lake_range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_state_of_the_lake_range`(IN rpt_year int, IN rpt_year_end int)
BEGIN

SELECT Report_Year,
	   Max_Air_Temp_Ave,	
	   Min_Air_Temp_Ave,	
	   Annual_Precipitation,	
	   Annual_Snow,
	   Snow_Propotion,
	   Monthly_Max_Air_Temp_Jan,	
	   Monthly_Max_Air_Temp_Feb,
	   Monthly_Max_Air_Temp_Mar,
	   Monthly_Max_Air_Temp_Apr,
	   Monthly_Max_Air_Temp_May,
	   Monthly_Max_Air_Temp_Jun,
	   Monthly_Max_Air_Temp_July,	
	   Monthly_Max_Air_Temp_Aug,	
	   Monthly_Max_Air_Temp_Sep,	
	   Monthly_Max_Air_Temp_Oct,
	   Monthly_Max_Air_Temp_Nov,
	   Monthly_Max_Air_Temp_Dec,
	   Monthly_Min_Air_Temp_Jan,
	   Monthly_Min_Air_Temp_Feb,
	   Monthly_Min_Air_Temp_Mar,
	   Monthly_Min_Air_Temp_Apr,
	   Monthly_Min_Air_Temp_May,
	   Monthly_Min_Air_Temp_Jun,
	   Monthly_Min_Air_Temp_July,
	   Monthly_Min_Air_Temp_Aug,
	   Monthly_Min_Air_Temp_Sep,
	   Monthly_Min_Air_Temp_Oct,
	   Monthly_Min_Air_Temp_Nov,
	   Monthly_Min_Air_Temp_Dec,
	   Monthly_Precipitation_Jan,
	   Monthly_Precipitation_Feb,
	   Monthly_Precipitation_Mar,
	   Monthly_Precipitation_Apr,
	   Monthly_Precipitation_May,
	   Monthly_Precipitation_Jun,
	   Monthly_Precipitation_July,
	   Monthly_Precipitation_Aug,
	   Monthly_Precipitation_Sep,
	   Monthly_Precipitation_Oct,
	   Monthly_Precipitation_Nov,
	   Monthly_Precipitation_Dec,
	   Surface_Water_Temp_Ave,
	   Secchi_Annual_Ave,
	   Secchi_Winter_Ave,
	   Secchi_Summer_Ave,
	   Chla_Ave
FROM State_Of_The_Lake
WHERE Report_Year >= rpt_year
      and
      Report_Year <= rpt_year_end;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_usgs_ws_granrange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tercroot`@`%` PROCEDURE `sp_report_usgs_ws_granrange`(IN rpt_tmstamp_from varchar(100),
										     IN rpt_tmstamp_to varchar(100),
											 IN rpt_station int)
BEGIN

    DECLARE frm_terc_date datetime;
    DECLARE to_terc_date datetime;

    SET frm_terc_date = str_to_date(rpt_tmstamp_from,'%Y-%m-%d %H:%i:%s');
    SET to_terc_date = str_to_date(rpt_tmstamp_to,'%Y-%m-%d %H:%i:%s');
    
    SELECT Location,
           TmStamp,
           Latitude,
           Longitude,
           Lake_Level,
           Streamflow,
           Site_ID AS ID
    FROM USGS_WS 
    WHERE TmStamp >= frm_terc_date
	      and
          TmStamp <= to_terc_date
          and
          Site_ID = rpt_station
          
	ORDER BY TmStamp ASC;
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-29 12:45:48
