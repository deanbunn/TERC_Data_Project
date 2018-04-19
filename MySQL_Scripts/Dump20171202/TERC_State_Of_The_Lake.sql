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
-- Table structure for table `State_Of_The_Lake`
--

DROP TABLE IF EXISTS `State_Of_The_Lake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `State_Of_The_Lake` (
  `Report_Year` int(11) NOT NULL,
  `Max_Air_Temp_Ave` double DEFAULT NULL,
  `Min_Air_Temp_Ave` double DEFAULT NULL,
  `Annual_Precipitation` double DEFAULT NULL,
  `Annual_Snow` double DEFAULT NULL,
  `Snow_Propotion` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_Jan` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_Feb` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_Mar` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_Apr` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_May` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_Jun` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_July` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_Aug` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_Sep` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_Oct` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_Nov` double DEFAULT NULL,
  `Monthly_Max_Air_Temp_Dec` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_Jan` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_Feb` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_Mar` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_Apr` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_May` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_Jun` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_July` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_Aug` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_Sep` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_Oct` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_Nov` double DEFAULT NULL,
  `Monthly_Min_Air_Temp_Dec` double DEFAULT NULL,
  `Monthly_Precipitation_Jan` double DEFAULT NULL,
  `Monthly_Precipitation_Feb` double DEFAULT NULL,
  `Monthly_Precipitation_Mar` double DEFAULT NULL,
  `Monthly_Precipitation_Apr` double DEFAULT NULL,
  `Monthly_Precipitation_May` double DEFAULT NULL,
  `Monthly_Precipitation_Jun` double DEFAULT NULL,
  `Monthly_Precipitation_July` double DEFAULT NULL,
  `Monthly_Precipitation_Aug` double DEFAULT NULL,
  `Monthly_Precipitation_Sep` double DEFAULT NULL,
  `Monthly_Precipitation_Oct` double DEFAULT NULL,
  `Monthly_Precipitation_Nov` double DEFAULT NULL,
  `Monthly_Precipitation_Dec` double DEFAULT NULL,
  `Surface_Water_Temp_Ave` double DEFAULT NULL,
  `Secchi_Annual_Ave` double DEFAULT NULL,
  `Secchi_Winter_Ave` double DEFAULT NULL,
  `Secchi_Summer_Ave` double DEFAULT NULL,
  `Chla_Ave` double DEFAULT NULL,
  PRIMARY KEY (`Report_Year`)
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

-- Dump completed on 2017-12-02 13:25:39
