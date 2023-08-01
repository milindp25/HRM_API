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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `street_address_1` varchar(255) DEFAULT NULL,
  `street_address_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `user_type` char(1) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `idx_employee_department` (`department_id`),
  KEY `idx_employee_name` (`first_name`,`last_name`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'John','Doe','johndoe1@example.com','123-456-7891','1990-01-01','123 Main St',NULL,'New York','NY',1,'2011-01-01','M',33,'Test123'),(2,'Jane','Doe','janedoe2@example.com','123-456-7892','1991-02-02','234 Main St',NULL,'Los Angeles','CA',2,'2011-02-02','E',32,'Test123'),(3,'James','Smith','jamessmith3@example.com','123-456-7893','1992-03-03','345 Main St',NULL,'Chicago','IL',3,'2011-03-03','E',31,'Test123'),(4,'Jessica','Johnson','jessicajohnson4@example.com','123-456-7894','1993-04-04','456 Main St',NULL,'Houston','TX',1,'2011-04-04','E',30,'Test123'),(5,'Joseph','Williams','josephwilliams5@example.com','123-456-7895','1994-05-05','567 Main St',NULL,'Philadelphia','PA',2,'2011-05-05','E',29,'Test123'),(6,'Jennifer','Brown','jenniferbrown6@example.com','123-456-7896','1995-06-06','678 Main St',NULL,'Phoenix','AZ',3,'2011-06-06','E',28,'Test123'),(7,'Jacob','Jones','jacobjones7@example.com','123-456-7897','1996-07-07','789 Main St',NULL,'San Antonio','TX',1,'2011-07-07','E',27,'Test123'),(8,'Julia','Miller','juliamiller8@example.com','123-456-7898','1997-08-08','890 Main St',NULL,'San Diego','CA',2,'2011-08-08','E',25,'Test123'),(9,'Jason','Davis','jasondavis9@example.com','123-456-7899','1998-09-09','901 Main St',NULL,'Dallas','TX',3,'2011-09-09','E',24,'Test123'),(10,'Julie','Garcia','juliegarcia10@example.com','123-456-7810','1999-10-10','102 Main St',NULL,'San Jose','CA',1,'2011-10-10','E',23,'Test123'),(11,'Jeffrey','Rodriguez','jeffreyrodriguez11@example.com','123-456-7811','1999-11-11','113 Main St',NULL,'Austin','TX',2,'2011-11-11','E',23,'Test123'),(12,'Jasmine','Wilson','jasminewilson12@example.com','123-456-7812','1999-12-12','124 Main St',NULL,'Jacksonville','FL',3,'2011-12-12','E',23,'Test123'),(13,'Jerry','Martinez','jerrymartinez13@example.com','123-456-7813','2000-01-13','135 Main St',NULL,'San Francisco','CA',1,'2012-01-13','E',23,'Test123'),(14,'Janet','Anderson','janetanderson14@example.com','123-456-7814','2000-02-14','146 Main St',NULL,'Columbus','OH',2,'2012-02-14','E',23,'Test123'),(15,'Jack','Taylor','jacktaylor15@example.com','123-456-7815','2000-03-15','157 Main St',NULL,'Fort Worth','TX',3,'2012-03-15','E',23,'Test123'),(16,'Joyce','Thomas','joycethomas16@example.com','123-456-7816','2000-04-16','168 Main St',NULL,'Indianapolis','IN',1,'2012-04-16','E',23,'Test123'),(17,'Jeremy','Hernandez','jeremyhernandez17@example.com','123-456-7817','2000-05-17','179 Main St',NULL,'Charlotte','NC',2,'2012-05-17','E',23,'Test123'),(18,'Jill','Moore','jillmoore18@example.com','123-456-7818','2000-06-18','180 Main St',NULL,'Seattle','WA',3,'2012-06-18','E',23,'Test123'),(19,'Justin','Martin','justinmartin19@example.com','123-456-7819','2000-07-19','191 Main St',NULL,'Denver','CO',1,'2012-07-19','E',23,'Test123'),(20,'Joan','Jackson','joanjackson20@example.com','123-456-7820','2000-08-20','202 Main St',NULL,'El Paso','TX',2,'2012-08-20','E',22,'Test123'),(21,'Jonathan','Thompson','jonathanthompson21@example.com','123-456-7821','2000-09-21','213 Main St',NULL,'Detroit','MI',3,'2012-09-21','E',22,'Test123'),(22,'June','White','junewhite22@example.com','123-456-7822','2000-10-22','224 Main St',NULL,'Boston','MA',1,'2012-10-22','E',22,'Test123'),(23,'Jordan','Harris','jordanharris23@example.com','123-456-7823','2000-11-23','235 Main St',NULL,'Nashville','TN',2,'2012-11-23','E',22,'Test123'),(24,'Judith','Clark','judithclark24@example.com','123-456-7824','2000-12-24','246 Main St',NULL,'Memphis','TN',3,'2012-12-24','E',22,'Test123'),(25,'Jared','Robinson','jaredrobinson25@example.com','123-456-7825','2001-01-25','257 Main St',NULL,'Portland','OR',1,'2013-01-25','E',22,'Test123'),(26,'Jean','Lewis','jeanlewis26@example.com','123-456-7826','2001-02-26','268 Main St',NULL,'Oklahoma City','OK',2,'2013-02-26','E',22,'Test123'),(27,'Jake','Walker','jakewalker27@example.com','123-456-7827','2001-03-27','279 Main St',NULL,'Las Vegas','NV',3,'2013-03-27','E',22,'Test123'),(28,'Judy','Perez','judyperez28@example.com','123-456-7828','2001-04-28','280 Main St',NULL,'Louisville','KY',1,'2013-04-28','E',22,'Test123'),(29,'Joel','Hall','joelhall29@example.com','123-456-7829','2001-05-29','291 Main St',NULL,'Baltimore','MD',2,'2013-05-29','E',22,'Test123'),(30,'Jenna','Young','jennayoung30@example.com','123-456-7830','2001-06-30','302 Main St',NULL,'Milwaukee','WI',3,'2013-06-30','E',22,'Test123'),(31,'Test','test','test123@gmail.com','67678676','2023-07-04','test','','Chicago','IL',NULL,'2023-07-31','M',0,'Test123');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
