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
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `expense_type` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `expense_status` char(3) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `idx_expense_employee` (`employee_id`),
  KEY `idx_expense_type` (`expense_type`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (1,1,'Travel','2023-01-10','APR',500.00),(2,1,'Meal','2023-01-15','APR',150.00),(3,2,'Travel','2023-01-20','PND',600.00),(4,2,'Equipment','2023-01-25','APR',700.00),(5,3,'Travel','2023-01-30','PND',800.00),(6,3,'Meal','2023-02-01','APR',250.00),(7,4,'Travel','2023-02-10','APR',300.00),(8,4,'Equipment','2023-02-15','APR',200.00),(9,5,'Travel','2023-02-20','APR',1000.00),(10,5,'Meal','2023-02-25','APR',350.00),(11,1,'Travel','2023-03-10','PND',1200.00),(12,1,'Equipment','2023-03-15','APR',250.00),(13,2,'Travel','2023-03-20','APR',650.00),(14,2,'Meal','2023-03-25','PND',450.00),(15,3,'Travel','2023-03-30','APR',1500.00),(16,3,'Equipment','2023-04-01','APR',550.00),(17,4,'Travel','2023-04-10','PND',900.00),(18,4,'Meal','2023-04-15','APR',650.00),(19,5,'Travel','2023-04-20','APR',1100.00),(20,5,'Equipment','2023-04-25','APR',750.00),(21,3,'Meals & Entertainment','2023-07-25','PND',400.00),(22,2,'Office Supplies','2023-07-20','PND',500.00),(23,2,'Training & Seminars','2023-07-05','PND',450.00);
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
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
