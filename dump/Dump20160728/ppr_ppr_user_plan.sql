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
-- Table structure for table `ppr_user_plan`
--

DROP TABLE IF EXISTS `ppr_user_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppr_user_plan` (
  `plan_id` int(11) NOT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `company_id` (`company_id`),
  KEY `subscription_id` (`subscription_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ppr_user_plan_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `ppr_company` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_10` FOREIGN KEY (`company_id`) REFERENCES `ppr_company` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_11` FOREIGN KEY (`subscription_id`) REFERENCES `ppr_subscription_period` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_12` FOREIGN KEY (`plan_id`) REFERENCES `ppr_plan_types` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_13` FOREIGN KEY (`user_id`) REFERENCES `ppr_users` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_14` FOREIGN KEY (`company_id`) REFERENCES `ppr_company` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_15` FOREIGN KEY (`subscription_id`) REFERENCES `ppr_subscription_period` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_16` FOREIGN KEY (`plan_id`) REFERENCES `ppr_plan_types` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_17` FOREIGN KEY (`user_id`) REFERENCES `ppr_users` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `ppr_company` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_3` FOREIGN KEY (`subscription_id`) REFERENCES `ppr_subscription_period` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_4` FOREIGN KEY (`plan_id`) REFERENCES `ppr_plan_types` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `ppr_users` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_6` FOREIGN KEY (`company_id`) REFERENCES `ppr_company` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_7` FOREIGN KEY (`subscription_id`) REFERENCES `ppr_subscription_period` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_8` FOREIGN KEY (`plan_id`) REFERENCES `ppr_plan_types` (`id`),
  CONSTRAINT `ppr_user_plan_ibfk_9` FOREIGN KEY (`user_id`) REFERENCES `ppr_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppr_user_plan`
--

LOCK TABLES `ppr_user_plan` WRITE;
/*!40000 ALTER TABLE `ppr_user_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppr_user_plan` ENABLE KEYS */;
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
