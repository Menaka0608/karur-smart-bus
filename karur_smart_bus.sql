-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: karur_smart_bus
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `bus_id` int NOT NULL AUTO_INCREMENT,
  `bus_number` varchar(20) NOT NULL,
  `bus_type` varchar(50) DEFAULT NULL,
  `total_seats` int DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1,'TN-47-1001','Ordinary',52,'Karur','Trichy'),(2,'TN-47-1002','Express',50,'Karur','Coimbatore'),(3,'TN-47-1003','Ordinary',52,'Karur','Erode'),(4,'TN-47-1004','Express',50,'Karur','Salem'),(5,'TN-47-1005','Ordinary',52,'Karur','Namakkal');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delay_data`
--

DROP TABLE IF EXISTS `delay_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delay_data` (
  `delay_id` int NOT NULL AUTO_INCREMENT,
  `route_id` int NOT NULL,
  `travel_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `traffic_level` varchar(20) DEFAULT NULL,
  `delay_minutes` int NOT NULL,
  PRIMARY KEY (`delay_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `delay_data_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delay_data`
--

LOCK TABLES `delay_data` WRITE;
/*!40000 ALTER TABLE `delay_data` DISABLE KEYS */;
INSERT INTO `delay_data` VALUES (1,1,'2026-09-01','06:00:00','Low',5),(2,1,'2026-09-01','09:00:00','High',18),(3,1,'2026-09-02','06:00:00','Medium',10),(4,2,'2026-09-01','06:30:00','Medium',12),(5,2,'2026-09-01','14:00:00','Low',4),(6,2,'2026-09-02','06:30:00','High',25),(7,3,'2026-09-01','07:00:00','Low',3),(8,3,'2026-09-01','16:00:00','High',20),(9,3,'2026-09-02','07:00:00','Medium',9),(10,4,'2026-09-01','06:15:00','High',22),(11,4,'2026-09-01','15:00:00','Medium',11),(12,5,'2026-09-01','08:00:00','Low',2),(13,5,'2026-09-01','17:00:00','High',17);
/*!40000 ALTER TABLE `delay_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_routes`
--

DROP TABLE IF EXISTS `favorite_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_routes` (
  `favorite_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `route_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`favorite_id`),
  KEY `user_id` (`user_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `favorite_routes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `favorite_routes_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_routes`
--

LOCK TABLES `favorite_routes` WRITE;
/*!40000 ALTER TABLE `favorite_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `route_id` int NOT NULL,
  `rating` int NOT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`feedback_id`),
  KEY `user_id` (`user_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`),
  CONSTRAINT `feedback_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `notification_type` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL,
  `notification_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`notification_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_history`
--

DROP TABLE IF EXISTS `passenger_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_history` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `bus_id` int NOT NULL,
  `route_id` int NOT NULL,
  `travel_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `traffic_level` varchar(20) DEFAULT NULL,
  `passenger_count` int NOT NULL,
  PRIMARY KEY (`passenger_id`),
  KEY `bus_id` (`bus_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `passenger_history_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`),
  CONSTRAINT `passenger_history_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_history`
--

LOCK TABLES `passenger_history` WRITE;
/*!40000 ALTER TABLE `passenger_history` DISABLE KEYS */;
INSERT INTO `passenger_history` VALUES (1,1,1,'2026-09-01','06:00:00','Low',28),(2,1,1,'2026-09-02','06:00:00','Medium',35),(3,1,1,'2026-09-03','06:00:00','High',46),(4,1,1,'2026-09-04','09:00:00','Medium',38),(5,2,2,'2026-09-01','06:30:00','Medium',32),(6,2,2,'2026-09-02','06:30:00','High',45),(7,2,2,'2026-09-03','14:00:00','Low',24),(8,2,2,'2026-09-04','14:00:00','Medium',30),(9,3,3,'2026-09-01','07:00:00','Low',22),(10,3,3,'2026-09-02','07:00:00','Medium',31),(11,3,3,'2026-09-03','16:00:00','High',44),(12,4,4,'2026-09-01','06:15:00','Medium',36),(13,4,4,'2026-09-02','06:15:00','High',47),(14,4,4,'2026-09-03','15:00:00','Low',25),(15,5,5,'2026-09-01','08:00:00','Low',20),(16,5,5,'2026-09-02','08:00:00','Medium',29),(17,5,5,'2026-09-03','17:00:00','High',43);
/*!40000 ALTER TABLE `passenger_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `route_id` int NOT NULL AUTO_INCREMENT,
  `bus_id` int NOT NULL,
  `route_name` varchar(150) NOT NULL,
  `distance_km` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `bus_id` (`bus_id`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,1,'Karur - Trichy',80.00),(2,2,'Karur - Coimbatore',120.00),(3,3,'Karur - Erode',65.00),(4,4,'Karur - Salem',95.00),(5,5,'Karur - Namakkal',45.00);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_history`
--

DROP TABLE IF EXISTS `search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_history` (
  `search_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `source` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `search_date` date NOT NULL,
  `search_time` time NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `search_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_history`
--

LOCK TABLES `search_history` WRITE;
/*!40000 ALTER TABLE `search_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stop`
--

DROP TABLE IF EXISTS `stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stop` (
  `stop_id` int NOT NULL AUTO_INCREMENT,
  `route_id` int NOT NULL,
  `stop_name` varchar(100) NOT NULL,
  `stop_order` int NOT NULL,
  PRIMARY KEY (`stop_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `stop_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stop`
--

LOCK TABLES `stop` WRITE;
/*!40000 ALTER TABLE `stop` DISABLE KEYS */;
INSERT INTO `stop` VALUES (1,1,'Karur',1),(2,1,'Kulithalai',2),(3,1,'Musiri',3),(4,1,'Trichy',4),(5,2,'Karur',1),(6,2,'Vellakoil',2),(7,2,'Kangeyam',3),(8,2,'Coimbatore',4),(9,3,'Karur',1),(10,3,'Vellode',2),(11,3,'Erode',3),(12,4,'Karur',1),(13,4,'Vennandur',2),(14,4,'Salem',3),(15,5,'Karur',1),(16,5,'Pugalur',2),(17,5,'Namakkal',3);
/*!40000 ALTER TABLE `stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timing`
--

DROP TABLE IF EXISTS `timing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timing` (
  `timing_id` int NOT NULL AUTO_INCREMENT,
  `route_id` int NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `journey_minutes` int DEFAULT NULL,
  `day_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`timing_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `timing_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timing`
--

LOCK TABLES `timing` WRITE;
/*!40000 ALTER TABLE `timing` DISABLE KEYS */;
INSERT INTO `timing` VALUES (1,1,'06:00:00','07:45:00',105,'Weekday'),(2,1,'09:00:00','10:45:00',105,'Weekday'),(3,2,'06:30:00','09:30:00',180,'Weekday'),(4,2,'14:00:00','17:00:00',180,'Weekday'),(5,3,'07:00:00','08:30:00',90,'Weekday'),(6,3,'16:00:00','17:30:00',90,'Weekday'),(7,4,'06:15:00','08:30:00',135,'Weekday'),(8,4,'15:00:00','17:15:00',135,'Weekday'),(9,5,'08:00:00','09:00:00',60,'Weekday'),(10,5,'17:00:00','18:00:00',60,'Weekday');
/*!40000 ALTER TABLE `timing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traffic_data`
--

DROP TABLE IF EXISTS `traffic_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traffic_data` (
  `traffic_id` int NOT NULL AUTO_INCREMENT,
  `route_id` int NOT NULL,
  `travel_date` date NOT NULL,
  `time_slot` time NOT NULL,
  `traffic_level` varchar(20) NOT NULL,
  PRIMARY KEY (`traffic_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `traffic_data_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traffic_data`
--

LOCK TABLES `traffic_data` WRITE;
/*!40000 ALTER TABLE `traffic_data` DISABLE KEYS */;
INSERT INTO `traffic_data` VALUES (1,1,'2026-09-01','06:00:00','Low'),(2,1,'2026-09-01','09:00:00','High'),(3,1,'2026-09-02','06:00:00','Medium'),(4,2,'2026-09-01','06:30:00','Medium'),(5,2,'2026-09-01','14:00:00','Low'),(6,2,'2026-09-02','06:30:00','High'),(7,3,'2026-09-01','07:00:00','Low'),(8,3,'2026-09-01','16:00:00','High'),(9,3,'2026-09-02','07:00:00','Medium'),(10,4,'2026-09-01','06:15:00','High'),(11,4,'2026-09-01','15:00:00','Medium'),(12,5,'2026-09-01','08:00:00','Low'),(13,5,'2026-09-01','17:00:00','High');
/*!40000 ALTER TABLE `traffic_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_time_data`
--

DROP TABLE IF EXISTS `travel_time_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_time_data` (
  `travel_time_id` int NOT NULL AUTO_INCREMENT,
  `route_id` int NOT NULL,
  `travel_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `traffic_level` varchar(20) DEFAULT NULL,
  `travel_time_minutes` int NOT NULL,
  PRIMARY KEY (`travel_time_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `travel_time_data_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_time_data`
--

LOCK TABLES `travel_time_data` WRITE;
/*!40000 ALTER TABLE `travel_time_data` DISABLE KEYS */;
INSERT INTO `travel_time_data` VALUES (1,1,'2026-09-15','06:00:00','Low',105),(2,1,'2026-09-16','09:00:00','Medium',115),(3,1,'2026-09-17','06:00:00','High',130),(4,2,'2026-09-15','06:30:00','Medium',185),(5,2,'2026-09-16','14:00:00','Low',175),(6,2,'2026-09-17','06:30:00','High',210),(7,3,'2026-09-15','07:00:00','Low',90),(8,3,'2026-09-16','16:00:00','Medium',100),(9,3,'2026-09-17','07:00:00','High',115),(10,4,'2026-09-15','06:15:00','Medium',140),(11,4,'2026-09-16','15:00:00','Low',130),(12,4,'2026-09-17','06:15:00','High',160),(13,5,'2026-09-15','08:00:00','Low',60),(14,5,'2026-09-16','17:00:00','Medium',70),(15,5,'2026-09-17','08:00:00','High',80);
/*!40000 ALTER TABLE `travel_time_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@karursmartbus.com','TEMP_HASH_ADMIN','admin'),(2,'student','student@karursmartbus.com','TEMP_HASH_USER','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-21 15:49:04
