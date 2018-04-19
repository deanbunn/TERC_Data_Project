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
-- Table structure for table `GUV_RawData`
--

DROP TABLE IF EXISTS `GUV_RawData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GUV_RawData` (
  `RD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RD_Date_Time_UTC` datetime NOT NULL,
  `RD_Date_Time_POSIX` bigint(20) DEFAULT NULL,
  `Ed0Gnd` double DEFAULT NULL,
  `Ed0305` double DEFAULT NULL,
  `Ed0313` double DEFAULT NULL,
  `Ed0320` double DEFAULT NULL,
  `Ed0340` double DEFAULT NULL,
  `Ed0380` double DEFAULT NULL,
  `Ed0395` double DEFAULT NULL,
  `Ed0PAR` double DEFAULT NULL,
  `Ed0Temp` double DEFAULT NULL,
  `Ed0Vin` double DEFAULT NULL,
  `NumberSampled` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-02 13:26:04
