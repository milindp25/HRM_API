-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hrm_db
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `recruitment`
--

DROP TABLE IF EXISTS `recruitment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitment` (
  `recruitment_id` int NOT NULL AUTO_INCREMENT,
  `position_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`recruitment_id`),
  KEY `idx_recruitment_position` (`position_id`),
  KEY `idx_recruitment_department` (`department_id`),
  CONSTRAINT `recruitment_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `recruitment_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment`
--

LOCK TABLES `recruitment` WRITE;
/*!40000 ALTER TABLE `recruitment` DISABLE KEYS */;
INSERT INTO `recruitment` VALUES (1,1,1,'2023-01-01','2023-02-28','Closed'),(2,2,1,'2023-03-01','2023-04-30','Open'),(3,3,1,'2023-05-01','2023-06-30','Closed'),(4,4,1,'2023-07-01','2023-08-31','Open'),(5,5,1,'2023-09-01','2023-10-31','Closed'),(6,1,2,'2023-01-01','2023-02-28','Open'),(7,2,2,'2023-03-01','2023-04-30','Closed'),(8,3,2,'2023-05-01','2023-06-30','Open'),(9,4,2,'2023-07-01','2023-08-31','Closed'),(10,5,2,'2023-09-01','2023-10-31','Open'),(11,1,3,'2023-01-01','2023-02-28','Closed'),(12,2,3,'2023-03-01','2023-04-30','Open'),(13,3,3,'2023-05-01','2023-06-30','Closed'),(14,4,3,'2023-07-01','2023-08-31','Open'),(15,5,3,'2023-09-01','2023-10-31','Closed'),(16,1,4,'2023-01-01','2023-02-28','Open'),(17,2,4,'2023-03-01','2023-04-30','Closed'),(18,3,4,'2023-05-01','2023-06-30','Open'),(19,4,4,'2023-07-01','2023-08-31','Closed'),(20,5,4,'2023-09-01','2023-10-31','Open'),(21,1,5,'2023-01-01','2023-02-28','Closed'),(22,2,5,'2023-03-01','2023-04-30','Open'),(23,3,5,'2023-05-01','2023-06-30','Closed'),(24,4,5,'2023-07-01','2023-08-31','Open'),(25,5,5,'2023-09-01','2023-10-31','Closed'),(26,1,1,'2023-11-01','2023-12-31','Open'),(27,2,2,'2023-11-01','2023-12-31','Closed'),(28,3,3,'2023-11-01','2023-12-31','Open'),(29,4,4,'2023-11-01','2023-12-31','Closed'),(30,5,5,'2023-11-01','2023-12-31','Open'),(31,3,2,'2023-07-17','2023-07-31','Open');
/*!40000 ALTER TABLE `recruitment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-01  0:05:29
