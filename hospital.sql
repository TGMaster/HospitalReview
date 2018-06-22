CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 35.198.229.164    Database: hospital
-- ------------------------------------------------------
-- Server version	5.7.14-google

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_uindex` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'tttien@gmail.com','$2a$10$swmy4DlaDn1RU7IfIo.mWeaaEvn.x4j87./qrPSy6wNOAzxtQHa3S');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarkdoctor`
--

DROP TABLE IF EXISTS `bookmarkdoctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarkdoctor` (
  `p_id` bigint(20) unsigned NOT NULL,
  `d_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`p_id`,`d_id`),
  KEY `d_id` (`d_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `bookmarkdoctor_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  CONSTRAINT `bookmarkdoctor_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarkdoctor`
--

LOCK TABLES `bookmarkdoctor` WRITE;
/*!40000 ALTER TABLE `bookmarkdoctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarkdoctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarkhospital`
--

DROP TABLE IF EXISTS `bookmarkhospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarkhospital` (
  `p_id` bigint(20) unsigned NOT NULL,
  `h_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`p_id`,`h_id`),
  KEY `h_id` (`h_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `bookmarkhospital_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `hospital` (`h_id`),
  CONSTRAINT `bookmarkhospital_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarkhospital`
--

LOCK TABLES `bookmarkhospital` WRITE;
/*!40000 ALTER TABLE `bookmarkhospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarkhospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `c_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `c_comment` varchar(255) NOT NULL,
  `d_id` bigint(20) unsigned NOT NULL,
  `p_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `d_id` (`d_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'good',1,1),(2,'bad',2,1),(3,'good',3,1),(4,'bad',4,1),(5,'good',5,1),(6,'bad',6,1),(7,'good',7,1),(8,'bad',8,1),(9,'good',9,1),(10,'bad',10,1),(11,'good',11,2),(12,'good',12,2),(13,'bad',13,2),(14,'good',14,2),(15,'good',15,2),(16,'bad',16,2),(17,'good',17,2),(18,'good',18,2),(19,'bad',19,2),(20,'good',20,2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinate`
--

DROP TABLE IF EXISTS `coordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinate` (
  `c_id` bigint(20) unsigned NOT NULL,
  `h_id` bigint(20) unsigned NOT NULL,
  `x` float unsigned NOT NULL,
  `y` float unsigned NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `h_id` (`h_id`),
  CONSTRAINT `coordinate_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `hospital` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinate`
--

LOCK TABLES `coordinate` WRITE;
/*!40000 ALTER TABLE `coordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deactivehospital`
--

DROP TABLE IF EXISTS `deactivehospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deactivehospital` (
  `DH_id` bigint(20) unsigned NOT NULL,
  `h_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`DH_id`),
  KEY `h_id` (`h_id`),
  CONSTRAINT `deactivehospital_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `hospital` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deactivehospital`
--

LOCK TABLES `deactivehospital` WRITE;
/*!40000 ALTER TABLE `deactivehospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `deactivehospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `d_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `d_fname` varchar(150) NOT NULL,
  `d_lname` varchar(150) NOT NULL,
  `d_gender` varchar(45) NOT NULL,
  `d_degree` varchar(150) NOT NULL,
  `d_insurance` tinyint(4) NOT NULL,
  `d_speciality` varchar(150) NOT NULL,
  `d_hour` varchar(150) NOT NULL,
  `languages` varchar(45) NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Hong Hoa','Dang','Female','phD',1,'Osteopathy','8AM-4PM','Vietnamese, English'),(2,'Vang Thuong','Nguyen','Male','Professor',0,'Gastrointestinal','9AM-3PM','Vietnamese, English'),(3,'Thi THu Hien','Do','Female','Masters',1,'Dermatology','10AM-4PM','English'),(4,'Vu','Nguyen','Male','phD',0,'Neurological','8AM-11AM','Vietnamese'),(5,'Danh Hoa','Nguyen','Male','phD',0,'Rheumatology','1PM-5PM','Vietnamese, English'),(6,'Quoc Tuan','Tran','Male','Masters',1,'Hematology','8AM-11AM','English'),(7,'Quang Binh','Truong','Male','Professor',1,'Psychiatry','8AM-11AM','Vietnamese, English'),(8,'Anh Tuan ','Ho','Male','phD',0,'Infectious Disease','1PM-5PM','Vietnamese, English'),(9,'Minh Tuan','Do','Male','Masters',0,'Cardiology','1PM-5PM','Vietnamese'),(10,'Kim Thanh','Do','Male','phD',0,'Rheumatology','9AM-12PM','Vietnamese, English'),(11,'Hien','Bui','Male','phD',1,'Gastrointestinal','10AM-3PM','Vietnamese'),(12,'Thi Thanh','Nguyen','Female','Bachelors',0,'Hematology','8AM-5PM','Vietnamese, English'),(13,'Thanh Tu','Tran','Female','Professor',0,'Obstetrics','8AM-4PM','Vietnamese'),(14,'Tien Duc','Cao','Male','Professor',1,'Psychology','9AM-2PM','Vietnamese'),(15,'Hoang Kiem','Ha','Male','Professor',1,'Psychiatry','1PM-5PM','English'),(16,'Bach','Nguyen','Male','phD',0,'Otolaryngology','9AM-2PM','English'),(17,'Ngoc Lan','Do','Female','Bachelor',0,'Gastroenterology','10AM-3PM','Vietnamese, English'),(18,'Huu Thinh','Cao','Male','Masters',1,'Dermatology','8AM-11AM','Vietnamese'),(19,'Dinh Toan','Duong','Male','phD',1,'Rheumatology','9AM-2PM','Vietnamese, English'),(20,'Ngoc','Ha','Female','Masters',0,'Gastroenterology','8AM-2PM','German');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorreview`
--

DROP TABLE IF EXISTS `doctorreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorreview` (
  `d_id` bigint(20) unsigned NOT NULL,
  `allowReview` int(11) DEFAULT '1',
  PRIMARY KEY (`d_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `doctorreview_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorreview`
--

LOCK TABLES `doctorreview` WRITE;
/*!40000 ALTER TABLE `doctorreview` DISABLE KEYS */;
INSERT INTO `doctorreview` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1);
/*!40000 ALTER TABLE `doctorreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `h_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `h_name` varchar(45) NOT NULL,
  `h_address` varchar(150) NOT NULL,
  `h_website` varchar(150) NOT NULL,
  `adname` varchar(150) NOT NULL,
  `ademail` varchar(150) NOT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (2,'Bach Mai','78 Giai Phong, Phuong Mai Ward, Dong Da District, Ha Noi','http://bachmai.gov.vn','Duyet Pham','duyetpham@gmail.com'),(3,'Cho Ray','201B Nguyen Chi Thanh, Ward 12 ,District 5,Ho Chi Minh City','http://choray.vn/','Hung Cao','bvchoray@choray.vn'),(4,'Y Duoc Ha Noi','1 Ton That Tung,Kim Lien Ward,Dong Da District, Ha Noi','http://www.benhviendaihocyhanoi.com/','Tien Tran','bvdhyd@umc.edu.vn'),(5,'Y Duoc Ho Chi Minh','215 Hong Bang, Ward 11, District 5, Ho Chi Minh City','http://www.bvdaihoc.com.vn/','Hung Phan','hungphan6969@gmail.com'),(6,'FV Hospital','6 Nguyen Luong Bang,Tan Phu Ward,District 7, Ho Chi Minh City','http://fvhospital.com/','Sinh Nguyen','fapvn@fapvn.vn'),(7,'115','527 Su Vanh Hanh, Ward 12, District 10, Ho Chi Minh City','http://benhvien115.com.vn/','Vinh Pham','115@gmail.com'),(8,'103','261 Phung Hung.Phuc La Ward,Ha Dong District, Ha Noi','http://benhvien103.vn/','Son Nguyen','bv103@gmail.ocm'),(9,'Tu Du','284 Cong Quynh, Pham Ngu Lao Ward,Distric 1,Ho Chi Minh City','http://tudu.com.vn/','Le Duc','tudu@tuduhos.com'),(10,'Viet Duc','40 Trang Thi, Hang Bong Ward,Hoan Kiem District ,Ha Noi','http://benhvienvietduc.org/','Bao Tran','vietduc@vietducvn.com');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `p_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `p_fname` varchar(45) NOT NULL,
  `p_lname` varchar(45) NOT NULL,
  `p_gender` varchar(45) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `p_address` varchar(150) NOT NULL,
  `languages` varchar(45) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `patient_uindex` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Pham','Duyet','male','duyetphamm@gmail.com','$2a$10$fDFeaiMySVovHyCxOdty9OsHey93mfDjZBngIByCE1S0oUM3prS5y','Tran Cao Van','vi_VN','active'),(2,'Phan','Hung','male','dtpm7777777@gmail.com','$2a$10$fDFeaiMySVovHyCxOdty9OsHey93mfDjZBngIByCE1S0oUM3prS5y','Bui Thi Xuan','en_US','active'),(3,'Bap','Duy','male','hhung957@yahoo.com','$2a$10$v4SyEqrfvDilDPKBrxWboebBZXbYUU0w9.CWqZ4oNGIc/J9/N8gDS','73 Bui Thi Xuan','vi_VN','inactive');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate` (
  `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `r_rate` float unsigned NOT NULL,
  `d_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`r_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,1,6),(7,2,7),(8,3,8),(9,4,9),(10,5,10),(11,1,11),(12,2,12),(13,3,13),(14,4,14),(15,5,15),(16,1,16),(17,2,17),(18,3,18),(19,4,19),(20,5,20);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speciality` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `specialty` varchar(50) NOT NULL,
  `specific_specialty` varchar(50) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciality`
--

LOCK TABLES `speciality` WRITE;
/*!40000 ALTER TABLE `speciality` DISABLE KEYS */;
INSERT INTO `speciality` VALUES (1,'Gastroenterology','Gastrointestinal'),(2,'Gastroenterology','Dietician'),(3,'Gastroenterology','Endoscopy'),(4,'Gastroenterology','Digestion'),(5,'General Surgery','Rheumatology'),(6,'General Surgery','Dermatology'),(7,'General Surgery','Physiotherapy'),(8,'Obstetric','Obstetric'),(9,'Obstetric','Fertility specialist'),(10,'General Internal','Cardiology'),(11,'General Internal','Gastrointestinal'),(12,'General Internal','Endoscopy'),(13,'General Internal','Nephrology'),(14,'General Internal','Pulmonology'),(15,'General Internal','Infectious Disease'),(16,'Neurology','Neurosurgery'),(17,'Neurology','Neurological'),(18,'Psychiatrist','Psychiatrist');
/*!40000 ALTER TABLE `speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `p_id` bigint(20) unsigned NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `attempt` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,3,'$2a$10$UFO9GgNQS7kgpN4v8cY0BOH08bFzYT6JgncbNN1YqHNc11Ca0qkAe',0,'2018-05-30 16:08:41');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-22 11:05:08
