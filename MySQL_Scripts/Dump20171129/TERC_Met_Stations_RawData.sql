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
-- Table structure for table `Met_Stations_RawData`
--

DROP TABLE IF EXISTS `Met_Stations_RawData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Met_Stations_RawData` (
  `RD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Station_ID` varchar(50) DEFAULT NULL,
  `RD_Date_Time_UTC` datetime NOT NULL,
  `RD_Date_Time_POSIX` bigint(20) DEFAULT NULL,
  `RD_Year` int(11) DEFAULT NULL,
  `RD_Julian_Day` int(11) DEFAULT NULL,
  `RD_Time` int(11) DEFAULT NULL,
  `Wind_Spd1` double DEFAULT NULL,
  `Wind_Spd2` double DEFAULT NULL,
  `Wind_Dir` double DEFAULT NULL,
  `Wind_Dir_SD` double DEFAULT NULL,
  `GUST` double DEFAULT NULL,
  `Air_Temp` double DEFAULT NULL,
  `Air_Temp_SD` double DEFAULT NULL,
  `RH` double DEFAULT NULL,
  `RH_SD` double DEFAULT NULL,
  `Atm_Pres` double DEFAULT NULL,
  `Atm_Pres_SD` double DEFAULT NULL,
  `Precip` double DEFAULT NULL,
  `Raft_Dir` double DEFAULT NULL,
  `Water_Temp` double DEFAULT NULL,
  `Water_Temp_SD` double DEFAULT NULL,
  `BATT` double DEFAULT NULL,
  `RD_Note` text,
  `RD_Station_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=221784 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-29 12:45:43
