-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: grabble
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(12) DEFAULT '0',
  `url` varchar(250) DEFAULT NULL,
  `main` tinyint(1) DEFAULT '0',
  `soft_deleted` char(0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,4,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:07:56','2015-04-25 13:07:56'),(2,5,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:09:50','2015-04-25 13:09:50'),(3,6,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:10:36','2015-04-25 13:10:36'),(4,7,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:11:19','2015-04-25 13:11:19'),(5,7,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image2xxl.jpg',0,NULL,'2015-04-25 13:11:19','2015-04-25 13:11:19'),(6,7,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image3xxl.jpg',0,NULL,'2015-04-25 13:11:19','2015-04-25 13:11:19'),(7,7,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image4xxl.jpg',0,NULL,'2015-04-25 13:11:19','2015-04-25 13:11:19'),(8,8,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:22:50','2015-04-25 13:22:50'),(9,8,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image2xxl.jpg',0,NULL,'2015-04-25 13:22:50','2015-04-25 13:22:50'),(10,8,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image3xxl.jpg',0,NULL,'2015-04-25 13:22:50','2015-04-25 13:22:50'),(11,8,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image4xxl.jpg',0,NULL,'2015-04-25 13:22:50','2015-04-25 13:22:50'),(12,9,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:24:52','2015-04-25 13:24:52'),(13,9,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image2xxl.jpg',0,NULL,'2015-04-25 13:24:52','2015-04-25 13:24:52'),(14,9,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image3xxl.jpg',0,NULL,'2015-04-25 13:24:53','2015-04-25 13:24:53'),(15,9,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image4xxl.jpg',0,NULL,'2015-04-25 13:24:53','2015-04-25 13:24:53'),(16,10,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:24:54','2015-04-25 13:24:54'),(17,10,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image2xxl.jpg',0,NULL,'2015-04-25 13:24:54','2015-04-25 13:24:54'),(18,10,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image3xxl.jpg',0,NULL,'2015-04-25 13:24:54','2015-04-25 13:24:54'),(19,10,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image4xxl.jpg',0,NULL,'2015-04-25 13:24:54','2015-04-25 13:24:54'),(20,11,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:30:14','2015-04-25 13:30:14'),(21,11,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image2xxl.jpg',0,NULL,'2015-04-25 13:30:14','2015-04-25 13:30:14'),(22,11,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image3xxl.jpg',0,NULL,'2015-04-25 13:30:14','2015-04-25 13:30:14'),(23,11,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image4xxl.jpg',0,NULL,'2015-04-25 13:30:14','2015-04-25 13:30:14'),(24,12,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:31:03','2015-04-25 13:31:03'),(25,12,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image2xxl.jpg',0,NULL,'2015-04-25 13:31:03','2015-04-25 13:31:03'),(26,12,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image3xxl.jpg',0,NULL,'2015-04-25 13:31:03','2015-04-25 13:31:03'),(27,12,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image4xxl.jpg',0,NULL,'2015-04-25 13:31:03','2015-04-25 13:31:03'),(28,13,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:31:33','2015-04-25 13:31:33'),(29,13,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image2xxl.jpg',0,NULL,'2015-04-25 13:31:33','2015-04-25 13:31:33'),(30,13,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image3xxl.jpg',0,NULL,'2015-04-25 13:31:34','2015-04-25 13:31:34'),(31,13,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image4xxl.jpg',0,NULL,'2015-04-25 13:31:34','2015-04-25 13:31:34'),(32,14,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:32:04','2015-04-25 13:32:04'),(33,14,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image2xxl.jpg',0,NULL,'2015-04-25 13:32:04','2015-04-25 13:32:04'),(34,14,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image3xxl.jpg',0,NULL,'2015-04-25 13:32:04','2015-04-25 13:32:04'),(35,14,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image4xxl.jpg',0,NULL,'2015-04-25 13:32:04','2015-04-25 13:32:04'),(36,15,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/white/image1xxl.jpg',1,NULL,'2015-04-25 13:43:03','2015-04-25 13:43:03'),(37,15,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image2xxl.jpg',0,NULL,'2015-04-25 13:43:03','2015-04-25 13:43:03'),(38,15,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image3xxl.jpg',0,NULL,'2015-04-25 13:43:03','2015-04-25 13:43:03'),(39,15,'http://images.asos-media.com/inv/media/8/2/8/3/5153828/image4xxl.jpg',0,NULL,'2015-04-25 13:43:03','2015-04-25 13:43:03');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_swipes`
--

DROP TABLE IF EXISTS `product_swipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_swipes` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(12) DEFAULT '0',
  `product_id` int(12) DEFAULT '0',
  `swipe` enum('grab','discard') DEFAULT 'grab',
  `soft_deleted` char(0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `swipe` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_swipes`
--

LOCK TABLES `product_swipes` WRITE;
/*!40000 ALTER TABLE `product_swipes` DISABLE KEYS */;
INSERT INTO `product_swipes` VALUES (1,1,1,'grab',NULL,'2015-04-25 14:03:48','2015-04-25 14:03:48'),(2,1,13,'grab',NULL,'2015-04-25 14:03:53','2015-04-25 14:03:53'),(3,1,10,'discard',NULL,'2015-04-25 14:04:07','2015-04-25 14:04:07');
/*!40000 ALTER TABLE `product_swipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `price` float DEFAULT '0',
  `sale_price` float DEFAULT '0',
  `soft_deleted` char(0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 12:55:35','2015-04-25 12:55:35'),(2,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:07:26','2015-04-25 13:07:26'),(3,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:07:46','2015-04-25 13:07:46'),(4,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:07:56','2015-04-25 13:07:56'),(5,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:09:50','2015-04-25 13:09:50'),(6,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:10:36','2015-04-25 13:10:36'),(7,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:11:19','2015-04-25 13:11:19'),(8,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:22:50','2015-04-25 13:22:50'),(9,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:24:52','2015-04-25 13:24:52'),(10,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:24:54','2015-04-25 13:24:54'),(11,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:30:14','2015-04-25 13:30:14'),(12,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:31:03','2015-04-25 13:31:03'),(13,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:31:33','2015-04-25 13:31:33'),(14,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:32:04','2015-04-25 13:32:04'),(15,'Ohh Deer Mum You Are This Great Card',3,2,NULL,'2015-04-25 13:43:03','2015-04-25 13:43:03');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(60) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `username` varchar(60) NOT NULL,
  `user_type` enum('normal','admin') DEFAULT 'normal',
  `soft_deleted` char(0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'$2y$10$3IrVZS3SWbQ8Zt0wm0dpouC4lp5tFQACudwcRFo/XtRG3AInwNe92','TamerQtaish@gmail.com','Tamer Qtaish','admin',NULL,'2015-04-25 13:40:32','2015-04-25 13:40:32');
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

-- Dump completed on 2015-04-25 15:04:41
