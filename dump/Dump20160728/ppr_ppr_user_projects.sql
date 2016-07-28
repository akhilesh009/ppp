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
-- Table structure for table `ppr_user_projects`
--

DROP TABLE IF EXISTS `ppr_user_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppr_user_projects` (
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `ppr_user_projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ppr_users` (`id`),
  CONSTRAINT `ppr_user_projects_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `ppr_users` (`id`),
  CONSTRAINT `ppr_user_projects_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`ProjectId`),
  CONSTRAINT `ppr_user_projects_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `ppr_users` (`id`),
  CONSTRAINT `ppr_user_projects_ibfk_5` FOREIGN KEY (`project_id`) REFERENCES `projects` (`ProjectId`),
  CONSTRAINT `ppr_user_projects_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `ppr_users` (`id`),
  CONSTRAINT `ppr_user_projects_ibfk_7` FOREIGN KEY (`project_id`) REFERENCES `projects` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppr_user_projects`
--

LOCK TABLES `ppr_user_projects` WRITE;
/*!40000 ALTER TABLE `ppr_user_projects` DISABLE KEYS */;
INSERT INTO `ppr_user_projects` VALUES (8,1);
/*!40000 ALTER TABLE `ppr_user_projects` ENABLE KEYS */;
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
