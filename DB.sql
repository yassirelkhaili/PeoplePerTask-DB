-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sys3
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(45) NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categorieID_UNIQUE` (`categoryID`),
  UNIQUE KEY `categoryName_UNIQUE` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Category 1'),(10,'Category 10'),(11,'Category 11'),(12,'Category 12'),(13,'Category 13'),(14,'Category 14'),(15,'Category 15'),(2,'Category 2'),(3,'Category 3'),(4,'Category 4'),(5,'Category 5'),(6,'Category 6'),(7,'Category 7'),(8,'Category 8'),(9,'Category 9'),(31,'new category'),(32,'random category');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `offersID` int NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `userID` int NOT NULL,
  `projectID` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `edited_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delay` datetime NOT NULL,
  `status` enum('pending','accepted') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`offersID`),
  UNIQUE KEY `offersID_UNIQUE` (`offersID`),
  KEY `userID_idx` (`userID`),
  KEY `projectIDoffers_idx` (`projectID`),
  CONSTRAINT `projectIDoffers` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`),
  CONSTRAINT `userIDoffers` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (11,12312300,'message',151,73,'2023-12-10 18:31:54',NULL,'2023-12-11 00:52:31','2023-12-13 00:00:00','accepted'),(14,21312,'another message',151,55,'2023-12-10 21:51:48',NULL,'2023-12-11 00:40:37','2023-12-15 00:00:00','accepted'),(16,13412,'message',151,54,'2023-12-10 21:56:15',NULL,'2023-12-11 00:53:38','2023-12-21 00:00:00','accepted'),(17,13412,'message',151,54,'2023-12-10 21:56:17',NULL,'2023-12-11 00:55:54','2023-12-21 00:00:00','accepted'),(18,13412,'message',151,54,'2023-12-10 21:56:19',NULL,'2023-12-10 21:56:19','2023-12-21 00:00:00','pending'),(19,13412,'message',151,54,'2023-12-10 21:56:21',NULL,'2023-12-10 21:56:21','2023-12-21 00:00:00','pending'),(20,123124,'message',151,55,'2023-12-10 22:17:51',NULL,'2023-12-11 00:53:03','2023-12-26 00:00:00','accepted'),(21,123123,'offer message',158,77,'2023-12-11 08:37:06',NULL,'2023-12-11 08:38:06','2023-12-21 00:00:00','accepted');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_skills`
--

DROP TABLE IF EXISTS `project_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_skills` (
  `projectID` int NOT NULL,
  `skillID` int NOT NULL,
  KEY `skillIDskills_idx` (`skillID`),
  KEY `projectIDskills_idx` (`projectID`),
  CONSTRAINT `projectIDskills` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`),
  CONSTRAINT `skillIDskills` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_skills`
--

LOCK TABLES `project_skills` WRITE;
/*!40000 ALTER TABLE `project_skills` DISABLE KEYS */;
INSERT INTO `project_skills` VALUES (73,9),(73,10),(73,11),(73,12),(73,13),(77,14),(77,15),(77,16);
/*!40000 ALTER TABLE `project_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `projectID` int NOT NULL AUTO_INCREMENT,
  `projectTitle` varchar(50) NOT NULL,
  `projectDesc` varchar(255) NOT NULL,
  `categoryID` int NOT NULL,
  `sub_categoryID` int NOT NULL,
  `userID` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `edited_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectID`),
  UNIQUE KEY `projectID_UNIQUE` (`projectID`),
  KEY `categoryID_INDEX` (`categoryID`),
  KEY `sub_categoryID_INDEX` (`sub_categoryID`),
  KEY `userID_idx` (`userID`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_categoryID` FOREIGN KEY (`sub_categoryID`) REFERENCES `sub_categories` (`sub_categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (54,'ProjectX','Description',3,1,144,'2023-11-25 10:54:05',NULL,'2023-11-27 15:17:30'),(55,'Project 10','Description for Project 10',1,2,145,'2023-11-25 10:54:05',NULL,'2023-11-25 10:54:05'),(56,'Project 11','Description for Project 11',2,1,146,'2023-11-25 10:54:05',NULL,'2023-11-25 10:54:05'),(57,'Project 12','Description for Project 12',3,2,147,'2023-11-25 10:54:05',NULL,'2023-11-25 10:54:05'),(58,'Project 13','Description for Project 13',1,1,148,'2023-11-25 10:54:05',NULL,'2023-11-25 10:54:05'),(59,'Project 14','Description for Project 14',2,2,149,'2023-11-25 10:54:05',NULL,'2023-11-25 10:54:05'),(69,'Project X','Description for Prowefweect 4',3,2,149,'2023-11-26 11:14:32',NULL,'2023-11-26 11:14:37'),(73,'ProjectX','rowefweect 4',11,16,151,'2023-11-27 23:05:57',NULL,'2023-12-08 11:15:22'),(76,'project12','desc12',13,5,151,'2023-12-10 22:19:17',NULL,'2023-12-10 22:19:17'),(77,'Project321','Description for Projec',12,2,156,'2023-12-11 08:17:11',NULL,'2023-12-11 08:17:11');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skillID` int NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(255) NOT NULL,
  PRIMARY KEY (`skillID`),
  UNIQUE KEY `skillID_UNIQUE` (`skillID`),
  UNIQUE KEY `skill_name_UNIQUE` (`skill_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (13,'newSkills'),(14,'tag1'),(15,'tag2'),(16,'tag3'),(10,'tagqf'),(11,'tagqfqwd'),(12,'tagqfqwdwdwd'),(9,'tags');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `sub_categoryID` int NOT NULL AUTO_INCREMENT,
  `sub_categoryName` varchar(45) NOT NULL,
  `categoryID` int NOT NULL,
  PRIMARY KEY (`sub_categoryID`),
  UNIQUE KEY `sub_categoryID_UNIQUE` (`sub_categoryID`),
  UNIQUE KEY `sub_categoryName_UNIQUE` (`sub_categoryName`),
  KEY `categoryID_INDEX` (`categoryID`),
  CONSTRAINT `categoryID` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'SubCategory 1',1),(2,'SubCategory 2',1),(3,'SubCategory 3',2),(4,'SubCategory 4',2),(5,'SubCategory 5',3),(6,'SubCategory 6',3),(7,'SubCategory 7',4),(8,'SubCategory 8',4),(9,'SubCategory 9',5),(10,'SubCategory 10',5),(11,'SubCategory 11',6),(12,'SubCategory 12',6),(13,'SubCategory 13',7),(14,'SubCategory 14',7),(15,'SubCategory 15',8),(16,'SubCategory 16',8),(17,'SubCategory 17',9),(18,'SubCategory 18',9),(19,'SubCategory 19',10),(20,'SubCategory 20',10),(22,'random subcategory',5),(23,'random',1);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `testimonialID` int NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) NOT NULL,
  `userID` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `edited_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`testimonialID`),
  UNIQUE KEY `tastimonialID_UNIQUE` (`testimonialID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  CONSTRAINT `userIDtestimonials` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (138,'Always delivers exceptional work.',148,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44'),(139,'Pleasure to have as a user.',139,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44'),(140,'Consistently exceeds expectations.',140,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44'),(141,'Highly recommend working with.',149,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44'),(142,'A valuable member of our community.',142,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44'),(143,'Reliable and dedicated.',150,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44'),(144,'Exceptional skills and professionalism.',141,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44'),(145,'Always completes tasks on time.',137,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44'),(146,'Very knowledgeable and helpful.',143,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44'),(147,'Consistently delivers high-quality work.',144,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44'),(148,'A pleasure to work with.',145,'2023-11-26 14:17:44',NULL,'2023-11-26 14:17:44');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `city` varchar(45) NOT NULL,
  `role` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `edited_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `Userscol_UNIQUE` (`email`),
  UNIQUE KEY `phoneNumber_UNIQUE` (`phoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (137,'JaneSmith','hashed_password_2','jane.smith@email.com','9876543210','1985-05-20','Los Angeles',0,'2023-11-25 10:52:22',NULL,'2023-11-25 10:52:22'),(138,'AliceJones','hashed_password_3','alice.jones@email.com','5551234567','1992-09-08','Chicago',0,'2023-11-25 10:52:22',NULL,'2023-11-25 10:52:22'),(139,'BobMiller','hashed_password_4','bob.miller@email.com','9998887777','1988-03-25','Houston',0,'2023-11-25 10:52:22',NULL,'2023-11-25 10:52:22'),(140,'EvaWilliams','hashed_password_5','eva.williams@email.com','4445556666','1995-11-12','Miami',0,'2023-11-25 10:52:22',NULL,'2023-11-25 10:52:22'),(141,'CharlieBrown','hashed_password_6','charlie.brown@email.com','1239874560','1982-07-30','San Francisco',1,'2023-11-25 10:52:22',NULL,'2023-12-09 18:24:23'),(142,'GraceTaylor','hashed_password_7','grace.taylor@email.com','7896541230','1993-04-18','Seattle',0,'2023-11-25 10:52:22',NULL,'2023-11-25 10:52:22'),(143,'DavidClark','hashed_password_8','david.clark@email.com','3216549870','1987-12-05','Denver',0,'2023-11-25 10:52:22',NULL,'2023-11-25 10:52:22'),(144,'SophieBaker','hashed_password_9','sophie.baker@email.com','4567890123','1998-02-22','Boston',1,'2023-11-25 10:52:22',NULL,'2023-12-09 18:25:28'),(145,'RyanCarter','hashed_password_10','ryan.carter@email.com','9870123456','1984-06-10','Atlanta',1,'2023-11-25 10:52:22',NULL,'2023-12-09 18:24:23'),(146,'OliviaHill','hashed_password_11','olivia.hill@email.com','6547890123','1991-08-28','Phoenix',0,'2023-11-25 10:52:22',NULL,'2023-11-25 10:52:22'),(147,'WilliamWard','hashed_password_12','william.ward@email.com','2345678901','1989-10-15','Dallas',0,'2023-11-25 10:52:22',NULL,'2023-11-25 10:52:22'),(148,'EmmaFisher','hashed_password_13','emma.fisher@email.com','8765432109','1997-01-03','Detroit',0,'2023-11-25 10:52:22',NULL,'2023-11-25 10:52:22'),(149,'MichaelWright','hashed_password_14','michael.wright@email.com','1357924680','1986-09-20','Philadelphia',1,'2023-11-25 10:52:22',NULL,'2023-12-09 18:24:23'),(150,'AvaMartin','hashed_password_15','ava.martin@email.com','6789012345','1994-07-07','Minneapolis',0,'2023-11-25 10:52:22',NULL,'2023-11-25 10:52:22'),(151,'AitMarouane','$2y$10$BFk3Y68rwDPmXMAdJXggnO1kagHxQ0ifbrlu0YDf2dKVSVpwQanBO','elkhailiyassir@gmail.com','+1 (291) 147-2325','2023-12-07','Marrakech',0,'2023-12-08 11:11:27',NULL,'2023-12-10 22:18:13'),(152,'client1','$2y$10$ACcqJJn9XhwgRQ.M3SVQ8uMZp1mdmm0a5Xs.rm3NL1NAm1cDtFfq2','client1@gmail.com','+212 623 683260','2023-12-19','Marrakech',0,'2023-12-08 14:04:12',NULL,'2023-12-08 14:04:12'),(153,'client2','$2y$10$bGkIEz8rZ8mPsA8hN2N/gu5xeT7fIFOd4nUSWuwBtMR7I4XcP/2IO','client2@gmail.com','+212623683260','2023-12-27','Marrakech',0,'2023-12-08 14:07:39',NULL,'2023-12-09 18:25:28'),(156,'AMarouane','$2y$10$.6zV.HUzLXK759qOhRBAbeNN9e8XfDwITSfMWueVGIok2kQOJHSdC','client4@gmail.com','0623683260','2023-12-21','Marrakech',0,'2023-12-11 08:15:52',NULL,'2023-12-11 08:15:52'),(158,'MylesBullock','$2y$10$713xzgBlYkfCGufchGKy4eramhF0MxO0wsPmJbGCUGpM8wB5VnpEW','soqovun@mailinator.com','+1 (338) 669-7137','2022-12-04','Griffith Payne',1,'2023-12-11 08:34:31',NULL,'2023-12-11 08:34:31');
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

-- Dump completed on 2023-12-11 11:16:25