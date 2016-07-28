-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ppr
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `ProjectId` int(11) NOT NULL,
  `name` text,
  `project_status` varchar(45) DEFAULT NULL,
  `checkin_date` datetime DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  `ProjectFile` blob,
  `readstat` int(11) DEFAULT '0',
  `creationDate` datetime DEFAULT NULL,
  `isSampleFile` int(11) DEFAULT NULL,
  `projectOwner` text,
  `sourceOfProject` int(11) DEFAULT NULL,
  `title` text,
  `NewTaskDefault` int(11) DEFAULT '1',
  `CalendarId` int(11) DEFAULT '-1',
  `CalendarLastUpdated` datetime DEFAULT NULL,
  `PROJECTMANUALSTARTDATE` datetime DEFAULT NULL,
  `CurrencySymbol` text,
  `HOURSPERDAY` float DEFAULT NULL,
  `DROPBOXFILE` blob,
  `ProjectColor` int(11) DEFAULT '1',
  `ProjectListOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Sample Software development plan.xml','A','2014-08-16 00:00:00','2014-08-16 00:00:00','2014-11-14 00:00:00',NULL,1,NULL,1,'',-1,'Sample Software development plan.xml',1,-1,NULL,'2014-08-16 08:00:00','$',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-28 13:44:04
