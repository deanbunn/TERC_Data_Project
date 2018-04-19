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
-- Table structure for table `NASA_TB`
--

DROP TABLE IF EXISTS `NASA_TB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NASA_TB` (
  `nd_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TB_ID` int(11) NOT NULL,
  `TB_Name` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `TmStamp` datetime NOT NULL,
  `Date_RD` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Time_RD` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `RBR_5p5_m` double DEFAULT NULL,
  `RBR_5p0_m` double DEFAULT NULL,
  `RBR_4p0_m` double DEFAULT NULL,
  `RBR_3p0_m` double DEFAULT NULL,
  `RBR_2p0_m` double DEFAULT NULL,
  `RBR_1p5_m` double DEFAULT NULL,
  `RBR_1p0_m` double DEFAULT NULL,
  `RBR_0p5_m` double DEFAULT NULL,
  `WindSpeed_1` double DEFAULT NULL,
  `WindDir_1` double DEFAULT NULL,
  `Compass_1` double DEFAULT NULL,
  `AirTemp_1` double DEFAULT NULL,
  `RH_1` double DEFAULT NULL,
  `Pressure_1` double DEFAULT NULL,
  `WindSpeed_2` double DEFAULT NULL,
  `WindDir_2` double DEFAULT NULL,
  `Compass_2` double DEFAULT NULL,
  `AirTemp_2` double DEFAULT NULL,
  `RH_2` double DEFAULT NULL,
  `Pressure_2` double DEFAULT NULL,
  PRIMARY KEY (`nd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=921932 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-02 13:25:51
