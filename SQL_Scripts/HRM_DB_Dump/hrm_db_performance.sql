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
-- Table structure for table `performance`
--

DROP TABLE IF EXISTS `performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance` (
  `performance_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`performance_id`),
  KEY `idx_performance_employee` (`employee_id`),
  KEY `idx_performance_date` (`date`),
  CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance`
--

LOCK TABLES `performance` WRITE;
/*!40000 ALTER TABLE `performance` DISABLE KEYS */;
INSERT INTO `performance` VALUES (1,1,'2023-01-01',4,'Good performance this quarter.'),(2,2,'2023-01-01',3,'Average performance this quarter.'),(3,3,'2023-01-01',5,'Excellent performance this quarter.'),(4,4,'2023-01-01',4,'Good performance this quarter.'),(5,5,'2023-01-01',2,'Below average performance this quarter.'),(6,1,'2023-04-01',5,'Excellent performance this quarter.'),(7,2,'2023-04-01',4,'Good performance this quarter.'),(8,3,'2023-04-01',3,'Average performance this quarter.'),(9,4,'2023-04-01',2,'Below average performance this quarter.'),(10,5,'2023-04-01',4,'Good performance this quarter.'),(11,1,'2023-07-01',3,'Average performance this quarter.'),(12,2,'2023-07-01',2,'Below average performance this quarter.'),(13,3,'2023-07-01',4,'Good performance this quarter.'),(14,4,'2023-07-01',5,'Excellent performance this quarter.'),(15,5,'2023-07-01',3,'Average performance this quarter.'),(16,1,'2023-10-01',2,'Below average performance this quarter.'),(17,2,'2023-10-01',4,'Good performance this quarter.'),(18,3,'2023-10-01',3,'Average performance this quarter.'),(19,4,'2023-10-01',5,'Excellent performance this quarter.'),(20,5,'2023-10-01',4,'Good performance this quarter.'),(21,1,'2024-01-01',5,'Excellent performance this quarter.'),(22,2,'2024-01-01',3,'Average performance this quarter.'),(23,3,'2024-01-01',4,'Good performance this quarter.'),(24,4,'2024-01-01',2,'Below average performance this quarter.'),(25,5,'2024-01-01',5,'Excellent performance this quarter.'),(26,1,'2024-04-01',4,'Good performance this quarter.'),(27,2,'2024-04-01',5,'Excellent performance this quarter.'),(28,3,'2024-04-01',3,'Average performance this quarter.'),(29,4,'2024-04-01',4,'Good performance this quarter.'),(30,5,'2024-04-01',2,'Below average performance this quarter.'),(31,19,'2023-07-31',4,'Very Good Performance');
/*!40000 ALTER TABLE `performance` ENABLE KEYS */;
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
