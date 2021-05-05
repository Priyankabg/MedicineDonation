-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: medicine
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `username` varchar(20) NOT NULL DEFAULT 'custom',
  `password` varchar(20) NOT NULL DEFAULT 'custom'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('bhagyashri','2609841');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `did` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` char(10) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `medicine` varchar(255) DEFAULT NULL,
  `exp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (76,'SNEHAL','BHAMARE','187/A','9028671147','banglore','Karnataka','trazer','2020-06-25'),(78,'sandhya','BHAMARE','Plot no 121 kansai section amaranth east thane','7249504830','Ambarnath','Maharashtra','trazer','2020-06-25'),(79,'Shoba','Nikam','khote Nagar,Jalgaon','8624861414','Jalgaon','undefined','dolo','2020-06-26'),(80,'kalpana ','Sonawane','gilha peth, Jalgaon','2164333356','Jalgaon','undefined','dolo','2020-06-24'),(82,'lata','sharama','thane','9087654327','thane','undefined','crocin','2020-12-25'),(83,'snehal','fadtare','thane','7249504830','thane','undefined','disprine','2021-03-26'),(84,'sandhya','bhamare','thane','9023145698','thane','undefined','torulo','2020-11-18'),(98,'sneha','c','187/A','7249504830','banglore','undefined','traurl','2020-07-05');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illness`
--

DROP TABLE IF EXISTS `illness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `illness` (
  `name` varchar(500) NOT NULL DEFAULT 'custom',
  `city` varchar(500) NOT NULL DEFAULT 'custom',
  `contact` varchar(500) NOT NULL DEFAULT 'custom',
  `medicine` varchar(500) NOT NULL DEFAULT 'custom',
  `illness` varchar(500) NOT NULL DEFAULT 'custom',
  `medicom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illness`
--

LOCK TABLES `illness` WRITE;
/*!40000 ALTER TABLE `illness` DISABLE KEYS */;
INSERT INTO `illness` VALUES ('Bhagyashri','Ambarnath','7894651235','vgcgtcg','hhsgfygf',NULL),('Bhagyashri','Ambarnath','7894561235','trazer','headache',NULL),('sneha','banglore','7894561235','tuoro','fever',NULL),('Bhagyashri','Ambarnath','12345698874','trazer','headache',NULL),('Bhagyashri','Ambarnath','1234569874','ghuiyt','headache',NULL),('Bhagyashri','Ambarnath','7894561234','tre','headahe',NULL),('Bhagyashri','Ambarnath','1236549874','ujiko','hv.h.vk',NULL),('Bhagyashri','Ambarnath','1236547895','vhvcge','hkebeg',NULL),('Bhagyashri','Ambarnath','1236547895','vhvcge','hkebeg',NULL),('Bhagyashri','Ambarnath','7249504830','gvcgc','gvvhkvhk',NULL),('Bhagyashri','Ambarnath','78994561235','BGEBGEEGB','egejljnjnr',NULL),('Bhagyashri','Ambarnath','7249504830','BGEBGEEGB','egejljnjnr',NULL),('Bhagyashri','Ambarnath','7249504830','BGEBGEEGB','egejljnjnr',NULL),('Bhagyashri','Ambarnath','7894561235','gcgc','kvhvhkbkbjk',NULL),('Bhagyashri','Ambarnath','7249504830','vcgjjxc','vhvhvkhvh',NULL),('Bhagyashri','Ambarnath','7894561234','bhagu','hnbjljb','hvvhhv'),('SNEHAL','banglore','9028671147','trazer','headahe','vhecevhecce'),('Bhagyashri','Ambarnath','7894561235','turlo','fever','hvggVGR'),('sandhya','Ambarnath','7249504830','trazer','hvadbhvvd','VKHVdhv'),('Shoba','Jalgaon','8624861414','dolo','fever','paracetamol'),('kalpana ','Jalgaon','2164333356','dolo','fever','paracetamol'),('kamini','Jalgaon','4523183423','dolo','fever','paracetamol'),('lata','thane','9087654327','crocin','headache','hgdcuewge'),('snehal','thane','7249504830','disprine','headache','hdgvyzwrygwrg'),('sandhya','thane','9023145698','torulo','headache','jbuvbEYH'),('Bhagyashri','Ambarnath','2609841562','yui','headacje','hbhbhbh'),('Bhagyashri','Ambarnath','7894561235','bhhgvg','hbibhhbhyv','bjbjhib'),('Bhagyashri','Ambarnath','7894561235','bhhgvg','hbibhhbhyv','bjbjhib'),('Bhagyashri','Ambarnath','729504830','bcheb','vjjvv','dvbjvbe'),('Bhagyashri','Ambarnath','7249504830','7249504830','IHAVH','huEBFEHU'),('Bhagyashri','Ambarnath','7249504830','7249504830','IHAVH','huEBFEHU'),('tanvi','Ambarnath','4561239874','dolpo','headache','tyuio'),('SNEHAL','banglore','789456123654','trazer ','bjubojujnjn','jnlb/bj'),('SNEHAL','banglore','789456123654','trazer ','bjubojujnjn','jnlb/bj'),('SNEHAL','banglore','7249504830','vtft','nkkmkmml','jnnkk'),('Bhagyashri','Ambarnath','9028671149','gionj','cgcgc','gnknnj'),('Bhagyashri','Ambarnath','7249504830','dolo','yfvtfo','ggfct'),('Bhagyashri','Ambarnath','8529637415','guktugck','vggylyg','iyglyg'),('pojitha','banglore','7894561235','turlo','fever','pertimon'),('sandhya','banglore','7894561235','fihjyu','headache','giopiuy'),('sneha','banglore','7249504830','turolo','headahe','dyuiop'),('sneha','banglore','7249504830','traurl','fever','azroton'),('sneha','banglore','7249504830','trazer','fever','arozone'),('priyanke','Ambarnath','7894561235','dolo','fever','rultru');
/*!40000 ALTER TABLE `illness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `money`
--

DROP TABLE IF EXISTS `money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `money` (
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `amount` int NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(200) NOT NULL,
  `cardname` varchar(100) NOT NULL,
  `expmonth` varchar(16) NOT NULL,
  `cvv` int NOT NULL,
  `cardno` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money`
--

LOCK TABLES `money` WRITE;
/*!40000 ALTER TABLE `money` DISABLE KEYS */;
INSERT INTO `money` VALUES ('Bhagyashri','bhamare.bhagyashri1999@gmail.com',500,'Ambarnath','Maharashtra','bhgyashri','september',352,'1111222233334444','2018',0),('SNEHAL BHAMARE','bhamare.bhagyashri1999@gmail.com',25000,'banglore','Karnataka','snehal','september',521,'1111444422225555','2018',1),('Bhagyashri','bhamare.bhagyashri1999@gmail.com',2852,'Ambarnath','Maharashtra','sandhya','11',789,'7894561239658741','2032',1),('priyanke','bhagyashri@gmail.com',25000,'banglore','Karnataka','priyanka','08',123,'1123456974581235','2025',1);
/*!40000 ALTER TABLE `money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngo`
--

DROP TABLE IF EXISTS `ngo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ngo` (
  `name` varchar(200) NOT NULL DEFAULT 'custom',
  `did` int NOT NULL AUTO_INCREMENT,
  `address` varchar(200) NOT NULL DEFAULT 'custom',
  `city` varchar(100) NOT NULL DEFAULT 'custom',
  `state` varchar(100) NOT NULL DEFAULT 'custom',
  `phoneno` varchar(10) NOT NULL DEFAULT 'custom',
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngo`
--

LOCK TABLES `ngo` WRITE;
/*!40000 ALTER TABLE `ngo` DISABLE KEYS */;
INSERT INTO `ngo` VALUES ('astha ',53,'187/A','banglore','Karnataka','7028671149','snehac661@gmail.com'),('yoge ',54,'Plot no 121 kansai section amaranth east thane','Ambarnath','Maharashtra','8502867114','priyahem7@gmail.com'),('miytri',55,'187/A','thane','Maharashtra','9028671149','bhamare.7791@gmail.com');
/*!40000 ALTER TABLE `ngo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'medicine'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `e_daily` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = cp850 */ ;;
/*!50003 SET character_set_results = cp850 */ ;;
/*!50003 SET collation_connection  = cp850_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `e_daily` ON SCHEDULE EVERY 1 MINUTE STARTS '2020-06-07 12:53:52' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Saves total number of sessions then clears the table each day' DO BEGIN
        DELETE FROM donor WHERE exp < NOW();
      END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'medicine'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20 10:41:16
