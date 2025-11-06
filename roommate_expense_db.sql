-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: roommate_expense_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payer` varchar(50) NOT NULL,
  `participants` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `split_amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,'Riya','Riya,Aditi,Disha',900.00,300.00,'2025-01-02','Groceries','Monthly breakfast groceries'),(2,'Aditi','Riya,Aditi,Disha',450.00,150.00,'2025-01-03','Milk & Bread','Milk packets and bread'),(3,'Disha','Riya,Aditi,Disha',1200.00,400.00,'2025-01-05','Electricity Bill','Shared electricity expense'),(4,'Riya','Riya,Aditi',600.00,300.00,'2025-01-07','Laundry','Laundry service for 2 people'),(5,'Aditi','Aditi,Disha',300.00,150.00,'2025-01-08','Snacks','Evening snacks from cafe'),(6,'Disha','Riya,Disha',800.00,400.00,'2025-01-10','Gas Cylinder','Shared kitchen gas refill'),(7,'Riya','Riya,Aditi,Disha',750.00,250.00,'2025-01-12','Fruits & Vegetables','Weekly veggies'),(8,'Aditi','Riya,Aditi,Disha',1500.00,500.00,'2025-01-15','Water Can + Cleaning Materials','Water cans & soap'),(9,'Disha','Riya,Disha',400.00,200.00,'2025-01-17','Uber Ride','Ride to shopping'),(10,'Riya','Riya,Aditi,Disha',2100.00,700.00,'2025-01-20','Groceries Big Stock','Monthly grocery bulk'),(11,'Aditi','Riya,Aditi',350.00,175.00,'2025-01-21','Movies','Movie ticket expense'),(12,'Disha','Aditi,Disha',600.00,300.00,'2025-01-23','Mess Recharge','Compulsory mess meal top-up'),(13,'Aditi','Riya,Aditi,Disha',300.00,100.00,'2025-01-24','Tea & Snacks','Canteen evening snacks'),(14,'Disha','Riya,Aditi,Disha',900.00,300.00,'2025-01-26','Transport Pass','City bus pass shared'),(15,'Riya','Riya,Aditi',200.00,100.00,'2025-01-27','Room Cleaning','Paid cleaner maid'),(16,'Aditi','Aditi,Disha',800.00,400.00,'2025-01-28','Cafe Dinner','Dinner outing'),(17,'Disha','Riya,Aditi,Disha',1050.00,350.00,'2025-01-29','Internet Bill','Monthly WiFi recharge'),(18,'Riya','Riya,Disha',500.00,250.00,'2025-01-30','Groceries','Cooking essentials'),(19,'Aditi','Riya,Aditi,Disha',240.00,80.00,'2025-02-01','Stationery','Pens & notebooks'),(20,'Disha','Riya,Aditi,Disha',600.00,200.00,'2025-02-02','Cleaning Supplies','Detergent & mop refills');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-05 22:18:16
