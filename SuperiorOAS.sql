-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: MBIP
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `role` varchar(50) DEFAULT 'ADMIN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Laurence','123456','ADMIN'),(2,'Lucy','123456','ADMIN'),(3,'Ted','123456','ADMIN');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (6,'Title 1','Electricity','this is event 1','2023-12-24 00:00:00','2023-12-24 00:00:00'),(7,'Wtr Dec','Water','Water Comp Dec','2024-01-01 00:00:00','2024-01-01 00:00:00'),(8,'Rcy Dec','Recycle','Rcy Comp Dec','2024-01-01 00:00:00','2024-01-01 00:00:00');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `cover_image` varchar(300) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publisher` (`publisher`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`publisher`) REFERENCES `admin` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (4,'News Title 4','News Content 4','image4.jpg','Laurence','2023-01-04 14:00:00','2023-01-04 14:00:00'),(5,'News Title 5','News Content 5','image5.jpg','Lucy','2023-01-05 15:00:00','2023-01-05 15:00:00'),(9,'Innovative Recycling Techniques for a Greener Planet','Researchers develop new recycling methods to combat waste pollution...','news1.jpeg,https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/b37429d6-b8e5-4576-81c5-7381e03e988a.jpeg','Laurence','2024-01-13 00:00:00','2024-01-13 00:00:00'),(10,'Advancements in Hydropower: Sustainable Energy for the Future','Hydropower gains attention as a sustainable energy source...','news2.jpeg,https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/343f7f14-f1ff-479b-951d-4e6945d0031d.jpeg','Laurence','2024-01-13 00:00:00','2024-01-13 00:00:00');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Shampoo',10,10.5),(2,'Biscuit',10,15.75),(3,'Cocomilk',10,19.99),(4,'Ramen Noodle',10,12.99),(5,'prod etc',10,30.75),(6,'Another Product 1',10,25.99),(7,'Another Product 2',10,18.5),(8,'Another Product 3',10,14.25),(9,'Another Product 4',10,22),(10,'Another Product 5',10,16.5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regEvent`
--

DROP TABLE IF EXISTS `regEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regEvent` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `user_id` int unsigned DEFAULT '0',
  `user_username` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `family_members` int DEFAULT '1',
  `proof_image` varchar(300) DEFAULT NULL,
  `recycle` varchar(50) DEFAULT '',
  `ele_Quantity` decimal(10,2) DEFAULT NULL,
  `wtr_Quantity` decimal(10,2) DEFAULT NULL,
  `avg_ele_quantity` decimal(10,2) DEFAULT NULL,
  `avg_wtr_quantity` decimal(10,2) DEFAULT NULL,
  `reg_month` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regEvent`
--

LOCK TABLES `regEvent` WRITE;
/*!40000 ALTER TABLE `regEvent` DISABLE KEYS */;
INSERT INTO `regEvent` VALUES (2,'Sample Event 1','Water','Sample content for Event 1',0,'user1','John Doe','password1',3,'proof_image_1.jpg','recycle1',10.50,25.70,12.30,20.50,12,'2023-12-28 00:00:00','2023-12-28 12:30:00'),(3,'Sample Event 2','Water','Sample content for Event 2',0,'user2','Jane Doe','password2',4,'proof_image_2.jpg','recycle1',15.80,30.20,18.60,25.30,12,'2023-12-29 00:00:00','2023-12-29 10:45:00'),(4,'Sample Event 3','Water','Sample content for Event 3',0,'user3','Test','123456',2,'proof_image_3.jpg','',8.20,22.10,10.10,18.40,12,'2023-12-30 00:00:00','2023-12-30 15:20:00'),(5,'Title 1','Electricity','this is event 1',3,'user4','Bob','123456',1,'w.jsp','',40.50,NULL,40.50,NULL,12,'2023-12-29 00:00:00','2023-12-29 00:00:00'),(6,'Title 1','Recycle','this is event 1',4,'user8','Alice','123456',1,'https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/9efdb759-0a28-498e-85b0-a2cc8579436f.jpg','recycle1',40.50,NULL,40.50,NULL,12,'2023-12-29 00:00:00','2023-12-29 00:00:00'),(7,'Title 1','Recycle','this is event 1',3,'user4','Bob','123456',1,'https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/78b8413e-4ca2-4560-915b-cd07c227d3fe.jpg','recycle1',12.00,NULL,12.00,NULL,12,'2023-12-01 00:00:00','2023-12-29 00:00:00'),(8,'Title 1','Recycle','this is event 1',4,'user8','Alice','123456',10,'https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/60d6f223-aece-4721-ab94-2c149099f211.jpg','recycle3',30.50,NULL,3.05,NULL,12,'2023-12-29 00:00:00','2023-12-29 00:00:00'),(9,'Title 1','Electricity','this is event 1',12,'user1','Jack','123',1,'','',30.50,NULL,30.50,NULL,12,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(10,'Title 1','Electricity','this is event 1',5,'user5','Charlie','123456',2,'','',40.50,NULL,40.50,NULL,10,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(11,'Wtr Dec','Water','Water Comp Dec',5,'user5','Charlie','123456',1,'','recycle1',NULL,23.30,NULL,3.00,12,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(13,'Rcy Dec','Recycle','Rcy Comp Dec',5,'user5','Charlie','123456',1,'','recycle1',NULL,NULL,NULL,NULL,12,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(14,'Rcy Dec','Recycle','Rcy Comp Dec',5,'user5','Charlie','123456',1,'','recycle1',NULL,NULL,NULL,NULL,12,'2023-12-22 00:00:00','2023-12-31 00:00:00'),(15,'Rcy Dec','Recycle','Rcy Comp Dec',5,'user5','Charlie','123456',1,'','recycle2',NULL,NULL,NULL,NULL,10,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(16,'Wtr Dec','Water','Water Comp Dec',6,'user6','Diana','123456',8,'',NULL,NULL,60.00,NULL,7.50,10,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(17,'Rcy Dec','Recycle','Rcy Comp Dec',6,'user6','Diana','123456',10,'https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/9a03c988-50d9-4eb3-acb7-f84b02ac7ca0.jpg','recycle1',NULL,NULL,NULL,NULL,10,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(18,'Rcy Dec','Recycle','Rcy Comp Dec',6,'user6','Diana','123456',1,'https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/539d8888-8937-436d-b507-f9f15ac9faa9.jpg','recycle1',NULL,NULL,NULL,NULL,10,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(19,'Wtr Dec','Water','Water Comp Dec',7,'user7','Edward','123456',5,'https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/a20c75a6-0edd-4cf4-bbcd-e4cae698740e.jpg','',NULL,60.66,NULL,12.13,10,'2023-12-01 00:00:00','2023-12-31 00:00:00'),(20,'Rcy Dec','Recycle','Rcy Comp Dec',7,'user7','Edward','123456',4,'https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/c95da78d-65b7-4f30-9c5a-033a67ec0b4b.jpg','recycle1',NULL,NULL,NULL,NULL,10,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(21,'Title 1','Electricity','this is event 1',7,'user7','Edward','123456',2,'https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/91b2c26e-2b60-40fb-98a3-f81339148cc6.jpg','',90.00,NULL,45.00,NULL,10,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(22,'Rcy Dec','Recycle','Rcy Comp Dec',7,'user7','Edward','123456',5,'','recycle1',NULL,NULL,NULL,NULL,10,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(23,'Rcy Dec','Recycle','Rcy Comp Dec',7,'user7','Edward','123456',1,'','recycle1',NULL,NULL,NULL,NULL,10,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(24,'Rcy Dec','Recycle','Rcy Comp Dec',7,'user7','Edward','123456',1,'','recycle1',NULL,NULL,NULL,NULL,1,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(25,'Rcy Dec','Recycle','Rcy Comp Dec',7,'user7','Edward','123456',1,'','recycle1',NULL,NULL,NULL,NULL,10,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(26,'Rcy Dec','Recycle','Rcy Comp Dec',12,'user1','Jack','123',1,'','recycle1',NULL,NULL,NULL,NULL,1,'2023-12-31 00:00:00','2023-12-31 00:00:00'),(27,'Wtr Dec','Water','Water Comp Dec',3,'user2','Bob','123456',1,'https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/c4fa04cc-be12-4103-b880-98570074958f.jpg','recycle1',NULL,23.30,NULL,23.30,1,'2024-01-03 00:00:00','2024-01-03 00:00:00'),(28,'Rcy Dec','Recycle','Rcy Comp Dec',12,'user1','Jack','123',1,'','recycle1',NULL,NULL,NULL,NULL,1,'2024-01-13 00:00:00','2024-01-13 00:00:00'),(29,'Wtr Dec','Water','Water Comp Dec',23,'user3','Marry','123456',3,'',NULL,NULL,55.00,NULL,18.33,1,'2024-01-13 00:00:00','2024-01-13 00:00:00'),(30,'Wtr Dec','Water','Water Comp Dec',4,'user4','Alice','123456',1,'',NULL,NULL,60.66,NULL,60.66,1,'2024-01-14 00:00:00','2024-01-14 00:00:00'),(31,'Rcy Dec','Recycle','Rcy Comp Dec',12,'user1','Jack','123',1,'','recycle1',NULL,NULL,NULL,NULL,1,'2024-01-14 00:00:00','2024-01-14 00:00:00'),(32,'Rcy Dec','Recycle','Rcy Comp Dec',4,'user4','Alice','123456',1,'','recycle1',NULL,NULL,NULL,NULL,1,'2024-01-14 00:00:00','2024-01-14 00:00:00'),(33,'Rcy Dec','Recycle','Rcy Comp Dec',12,'user1','Jack','123',1,'','recycle1',NULL,NULL,NULL,NULL,1,'2024-01-16 00:00:00','2024-01-16 00:00:00'),(34,'Rcy Dec','Recycle','Rcy Comp Dec',12,'user1','Jack','123',1,'','recycle1',NULL,NULL,NULL,NULL,1,'2024-01-16 00:00:00','2024-01-16 00:00:00'),(35,'Rcy Dec','Recycle','Rcy Comp Dec',12,'user1','Jack','123',1,'','recycle1',NULL,NULL,NULL,NULL,1,'2024-01-17 00:00:00','2024-01-17 00:00:00');
/*!40000 ALTER TABLE `regEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `profile_photo` varchar(300) DEFAULT NULL,
  `wtr_status` varchar(5) DEFAULT 'NO',
  `ele_status` varchar(5) DEFAULT 'NO',
  `rcy_status` varchar(5) DEFAULT 'NO',
  `register_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `role` varchar(50) DEFAULT 'USER',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'user2','Bob','123456','M','https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/fbb339e3-44b2-4b1a-b68f-9b30c8837fad.jpg','NO','NO','NO','2023-12-28','2024-01-13','USER'),(4,'user4','Alice','123456','M','https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/9f855774-fae1-4948-bb34-0ff47761a84c.jpg','YES','YES','NO','2023-12-28','2024-01-14','USER'),(5,'user5','Charlie','123456','M','https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/50d4dc4b-8cf7-4564-840c-b79197d3bea6.jpg','YES','YES','NO','2023-12-28','2023-12-31','USER'),(6,'user6','Diana','123456','M','https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/f737d9bf-0763-488e-ad60-f61dcbb28188.jpg','YES','NO','NO','2023-12-28','2023-12-31','USER'),(7,'user7','Edward','123456','M','https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/d1888c91-5b4a-4d8f-8c78-754f10a7066d.jpg','YES','YES','YES','2023-12-28','2023-12-31','USER'),(8,'user8','Fiona','123456','F','photo8.jpg','NO','NO','NO','2023-12-28','2023-12-28','USER'),(9,'user9','George','123456','F','photo9.jpg','NO','NO','NO','2023-12-28','2023-12-28','USER'),(12,'user1','Jack','123','M','https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/1d092c94-e097-41ca-936d-006d8192bd8a.jpg','NO','NO','NO','2023-12-29','2023-12-31','USER'),(23,'user3','Marry','123456','M','','YES','NO','NO','2023-12-01','2024-01-13','USER'),(28,'user456','xiaolong','123456','F','https://lau-tlias01.oss-cn-shenzhen.aliyuncs.com/5797b3d0-eb2e-44e0-8869-50c424643f3b.jpg',NULL,NULL,NULL,'2024-01-13','2024-01-13','USER'),(29,'user7888','788','123456','M','',NULL,NULL,NULL,'2024-01-31','2024-01-13','USER'),(30,'sdfff','sdfff','123456','M','',NULL,NULL,NULL,'2024-01-12','2024-01-13','USER'),(31,'test456','456','123','M','',NULL,NULL,NULL,'2024-01-31','2024-01-13','USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-20 13:39:09
