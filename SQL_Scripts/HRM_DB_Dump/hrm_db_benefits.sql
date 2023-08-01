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
-- Table structure for table `benefits`
--

DROP TABLE IF EXISTS `benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benefits` (
  `benefit_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `benefit_type` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`benefit_id`),
  KEY `idx_benefits_employee` (`employee_id`),
  KEY `idx_benefits_type` (`benefit_type`),
  CONSTRAINT `benefits_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefits`
--

LOCK TABLES `benefits` WRITE;
/*!40000 ALTER TABLE `benefits` DISABLE KEYS */;
INSERT INTO `benefits` VALUES (1,1,'Health Insurance','2023-01-01','2024-12-31'),(2,2,'Health Insurance','2023-01-01','2024-12-31'),(3,3,'Health Insurance','2023-01-01','2024-12-31'),(4,4,'Health Insurance','2023-01-01','2024-12-31'),(5,5,'Health Insurance','2023-01-01','2024-12-31'),(6,1,'Dental Insurance','2023-01-01','2024-12-31'),(7,2,'Dental Insurance','2023-01-01','2024-12-31'),(8,3,'Dental Insurance','2023-01-01','2024-12-31'),(9,4,'Dental Insurance','2023-01-01','2024-12-31'),(10,5,'Dental Insurance','2023-01-01','2024-12-31'),(11,1,'Retirement Plan','2023-01-01','2024-12-31'),(12,2,'Retirement Plan','2023-01-01','2024-12-31'),(13,3,'Retirement Plan','2023-01-01','2024-12-31'),(14,4,'Retirement Plan','2023-01-01','2024-12-31'),(15,5,'Retirement Plan','2023-01-01','2024-12-31'),(16,1,'Paid Time Off','2023-01-01','2024-12-31'),(17,2,'Paid Time Off','2023-01-01','2024-12-31'),(18,3,'Paid Time Off','2023-01-01','2024-12-31'),(19,4,'Paid Time Off','2023-01-01','2024-12-31'),(20,5,'Paid Time Off','2023-01-01','2024-12-31');
/*!40000 ALTER TABLE `benefits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-01  0:05:28
