-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: employeemanager
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `categorys`
--

DROP TABLE IF EXISTS `categorys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorys`
--

LOCK TABLES `categorys` WRITE;
/*!40000 ALTER TABLE `categorys` DISABLE KEYS */;
INSERT INTO `categorys` VALUES (1,'Thể Thao','the-thao',NULL,NULL,NULL,NULL),(2,'Pháp Luật','phap-luat',NULL,NULL,NULL,NULL),(3,'Công Nghệ','cong-nghe',NULL,NULL,NULL,NULL),(4,'Đời Sống','doi-song',NULL,NULL,NULL,NULL),(5,'Khởi Nghiệp','khoi-nghiep',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categorys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `new_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_news` (`new_id`),
  KEY `fk_comments_users` (`user_id`),
  CONSTRAINT `fk_comments_news` FOREIGN KEY (`new_id`) REFERENCES `news` (`id`),
  CONSTRAINT `fk_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `short_description` text,
  `content` text,
  `category_id` bigint(20) NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_news_categorys` (`category_id`),
  CONSTRAINT `fk_news_categorys` FOREIGN KEY (`category_id`) REFERENCES `categorys` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (15,'Bài viết 21',NULL,'Bài viết 21',NULL,1,'2020-06-28 16:46:16',NULL,'',NULL),(16,'Bài viết 2',NULL,'Bài viết 2',NULL,1,'2020-06-28 16:46:30',NULL,'',NULL),(17,'Bài viết 5',NULL,'Bài viết 5',NULL,1,'2020-06-28 16:46:35',NULL,'',NULL),(18,'Bài viết 3',NULL,'Bài viết 3',NULL,1,'2020-07-01 08:14:00',NULL,'',NULL),(19,'Bài viết 30',NULL,'Bài viết 30',NULL,1,'2020-07-01 08:14:17',NULL,'',NULL),(20,'Bài viết 30',NULL,'Bài viết 30',NULL,1,'2020-07-27 10:31:24',NULL,'',NULL),(21,'Bài viết 33',NULL,'Bài viết 33',NULL,1,'2020-07-27 10:32:44',NULL,'',NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (5,'quan tri','user-admin',NULL,NULL,NULL,NULL),(6,'nguoi dung','user-user',NULL,NULL,NULL,NULL),(7,'cong tac vien','user-ctv',NULL,NULL,NULL,NULL),(8,'chu so huu ','user-owner',NULL,NULL,NULL,NULL),(9,'xem danh sach bai viet','see-post',NULL,NULL,NULL,NULL),(10,'xoa bai viet','delete-post',NULL,NULL,NULL,NULL),(11,'sua bai viet','edit-post',NULL,NULL,NULL,NULL),(12,'xem danh sach nguoi dung','see-user',NULL,NULL,NULL,NULL),(13,'sua nguoi dung','edit-user',NULL,NULL,NULL,NULL),(14,'xoa nguoi dung','delete-user',NULL,NULL,NULL,NULL),(15,'cap quyen ','set-role',NULL,NULL,NULL,NULL),(16,'them bai viet','add-post',NULL,NULL,NULL,NULL),(17,'them nguoi dung','add-user',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `role_code` varchar(500) NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_roles` (`role_id`),
  CONSTRAINT `fk_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'quangnhu_ctv','123456',NULL,1,7,'add-post,add-user,see-users,edit-user,',NULL,'2020-10-25 03:17:33',NULL,'quangnhu_owner'),(2,'quangnhu_admin','123456',NULL,1,5,'edit-post,edit-user,delete-post,add-user,see-users,',NULL,'2020-10-25 05:43:40',NULL,'quangnhu_owner'),(3,'quangnhu_owner','123456',NULL,1,8,'add-post,edit-post,delete-post,set-role,delete-user,edit-user,add-user,see-users,see-posts,',NULL,NULL,NULL,NULL),(4,'quangnhu_user','123456',NULL,1,6,'delete-post,add-user,edit-user,see-users,',NULL,'2020-10-25 03:49:25',NULL,'quangnhu_owner'),(5,'quangnhu_demo','123456',NULL,1,6,'delete-post,','2020-10-20 16:48:25','2020-10-25 06:11:03','','quangnhu_admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'employeemanager'
--

--
-- Dumping routines for database 'employeemanager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-25 14:18:29
