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
-- Table structure for table `CR1000_NS_Sand_Harbor_Modem_LakeData`
--

DROP TABLE IF EXISTS `CR1000_NS_Sand_Harbor_Modem_LakeData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CR1000_NS_Sand_Harbor_Modem_LakeData` (
  `ld_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TmStamp` datetime NOT NULL,
  `RecNum` bigint(20) DEFAULT NULL,
  `LS_Conductivity_Avg` double DEFAULT NULL,
  `LS_Temp_Avg` double DEFAULT NULL,
  `LS_RawPressure_Avg` double DEFAULT NULL,
  `LS_Chlorophyll_Avg` double DEFAULT NULL,
  `LS_CDOM_Avg` double DEFAULT NULL,
  `LS_Turbidity_Avg` double DEFAULT NULL,
  `LakeSensor_BattV_Min` double DEFAULT NULL,
  `BP_mmHg` double DEFAULT NULL,
  `Depth_m4C_Avg` double DEFAULT NULL,
  `Depth_m4C_Max` double DEFAULT NULL,
  `Depth_m4C_Min` double DEFAULT NULL,
  `WaveHeight` double DEFAULT NULL,
  `Conductivity25C_Avg` double DEFAULT NULL,
  `LS_DO_Avg` double DEFAULT NULL,
  PRIMARY KEY (`ld_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2562660 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-02 13:25:43
