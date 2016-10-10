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
-- Table structure for table `ppr_users`
--

DROP TABLE IF EXISTS `ppr_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppr_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `contact` varchar(200) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `reportingto` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `user_status_id` int(11) DEFAULT NULL,
  `costforuse` int(11) DEFAULT NULL,
  `costforhour` int(11) DEFAULT NULL,
  `isenterprise` tinyint(1) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `language` varchar(200) DEFAULT NULL,
  `uploadfile` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `role_id` (`role_id`),
  KEY `user_status_id` (`user_status_id`),
  CONSTRAINT `ppr_users_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `ppr_company` (`id`),
  CONSTRAINT `ppr_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `ppr_user_roles` (`id`),
  CONSTRAINT `ppr_users_ibfk_3` FOREIGN KEY (`user_status_id`) REFERENCES `ppr_user_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppr_users`
--

LOCK TABLES `ppr_users` WRITE;
/*!40000 ALTER TABLE `ppr_users` DISABLE KEYS */;
INSERT INTO `ppr_users` VALUES (3,'abcd','9960177963',5,NULL,'akhilesh.shete@akshayit.com',1,'4b91acfa8cf2691a081ca4026a5aca5a',1,NULL,NULL,0,'India','English','windows.png'),(6,'TM','12345',1,3,'team.member@gmail.com',3,'202cb962ac59075b964b07152d234b70',1,100,200,0,'india','english','windows.png'),(7,'Mika','  91',NULL,NULL,'mila@Kunis.com',1,'5f4dcc3b5aa765d61d8327deb882cf99',1,NULL,NULL,0,'IN',' ','undefined'),(8,'test1','12345',1,3,'test1@gmail.com',3,'5a105e8b9d40e1329780d62ea2265d8a',1,100,150,0,'India','English','windows.png'),(9,'sidd','8983366555',NULL,NULL,'sidd@gmail.com',1,'355c1b4d961a78319747ce27f4bf86a3',1,NULL,NULL,0,'GB','en_GB','undefined');
/*!40000 ALTER TABLE `ppr_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-28 13:44:01
