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
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `ProjectId` int(11) DEFAULT NULL,
  `UID` int(11) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL,
  `Name` text,
  `WBS` text,
  `Start` datetime DEFAULT NULL,
  `Finish` datetime DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Work` int(11) DEFAULT NULL,
  `Milestone` int(11) DEFAULT NULL,
  `Summary` int(11) DEFAULT NULL,
  `Critical` int(11) DEFAULT NULL,
  `FreeSlack` int(11) DEFAULT NULL,
  `TotalSlack` int(11) DEFAULT NULL,
  `PercentComplete` int(11) DEFAULT NULL,
  `PercentWorkComplete` int(11) DEFAULT NULL,
  `Cost` int(11) DEFAULT NULL,
  `ActualStart` datetime DEFAULT NULL,
  `ActualFinish` datetime DEFAULT NULL,
  `ActualDuration` int(11) DEFAULT NULL,
  `ActualCost` int(11) DEFAULT NULL,
  `ConstraintType` int(11) DEFAULT NULL,
  `ConstraintDate` datetime DEFAULT NULL,
  `Notes` text,
  `BaselineStart` datetime DEFAULT NULL,
  `BaselineDuration` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `ShowinTimeline` int(11) DEFAULT '0',
  `Manual` int(11) DEFAULT '1',
  `ManualStart` datetime DEFAULT NULL,
  `IsNullTask` int(11) DEFAULT '0',
  `MINSDURATION` int(11) DEFAULT '0',
  `MINSACTUALDURATION` int(11) DEFAULT '0',
  `MINSFREESLACK` int(11) DEFAULT '0',
  `MINSTOTALSLACK` int(11) DEFAULT '0',
  `MINSWORK` int(11) DEFAULT '0',
  `DURATIONFORMAT` int(11) DEFAULT '7',
  `TASKGANTTCOLORINDEX` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-28 13:44:00
