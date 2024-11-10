-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: gimnasio
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `NroSocio` int NOT NULL,
  `FechaRegistrada` date NOT NULL,
  `HoraRegistrada` time NOT NULL,
  PRIMARY KEY (`NroSocio`,`FechaRegistrada`,`HoraRegistrada`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`NroSocio`) REFERENCES `socio` (`NroSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (1,'2024-11-01','08:30:00'),(1,'2024-11-02','09:00:00'),(2,'2024-11-01','08:45:00'),(2,'2024-11-05','08:30:00'),(3,'2024-11-03','10:15:00'),(3,'2024-11-06','09:20:00'),(4,'2024-11-04','07:50:00'),(4,'2024-11-07','10:00:00'),(5,'2024-11-08','11:15:00'),(5,'2024-11-09','12:30:00');
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membresia`
--

DROP TABLE IF EXISTS `membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membresia` (
  `IdMembresia` int NOT NULL,
  `DiasHabiles` varchar(50) DEFAULT NULL,
  `Piscina` tinyint(1) DEFAULT NULL,
  `Spa` tinyint(1) DEFAULT NULL,
  `Costo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`IdMembresia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membresia`
--

LOCK TABLES `membresia` WRITE;
/*!40000 ALTER TABLE `membresia` DISABLE KEYS */;
INSERT INTO `membresia` VALUES (1,'Lunes a Viernes',1,1,50.00),(2,'Lunes a Sábado',1,0,45.00),(3,'Todos los días',0,0,40.00),(4,'Fines de Semana',1,1,30.00),(5,'Lunes a Miércoles',0,1,25.00);
/*!40000 ALTER TABLE `membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posee`
--

DROP TABLE IF EXISTS `posee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posee` (
  `NroSocio` int NOT NULL,
  `IdMembresia` int NOT NULL,
  PRIMARY KEY (`NroSocio`,`IdMembresia`),
  KEY `IdMembresia` (`IdMembresia`),
  CONSTRAINT `posee_ibfk_1` FOREIGN KEY (`NroSocio`) REFERENCES `socio` (`NroSocio`),
  CONSTRAINT `posee_ibfk_2` FOREIGN KEY (`IdMembresia`) REFERENCES `membresia` (`IdMembresia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posee`
--

LOCK TABLES `posee` WRITE;
/*!40000 ALTER TABLE `posee` DISABLE KEYS */;
INSERT INTO `posee` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `posee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `NroSocio` int NOT NULL,
  `DNI` varchar(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `NombreCompleto` varchar(100) DEFAULT NULL,
  `MetodoPago` varchar(50) DEFAULT NULL,
  `FechaPago` date DEFAULT NULL,
  `EstadoPago` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`NroSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (1,'12345678','Juan','Perez','555-1234','Juan Perez','Tarjeta','2024-01-01','Activo'),(2,'87654321','Maria','Lopez','555-5678','Maria Lopez','Efectivo','2024-02-15','Activo'),(3,'11223344','Carlos','Gomez','555-9101','Carlos Gomez','Transferencia','2024-03-10','Inactivo'),(4,'44332211','Ana','Martinez','555-1122','Ana Martinez','Tarjeta','2024-04-05','Activo'),(5,'55667788','Luis','Ramirez','555-3344','Luis Ramirez','Efectivo','2024-05-20','Inactivo');
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-09 23:35:28
