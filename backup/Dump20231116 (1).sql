-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: placas
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (157575625,'marcelo','gutierrez',3),(257357562,'maria','ledesma',2),(357575625,'dario','abate',1),(407547565,'agustina','salas',4);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,2,3,500000);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `nuevosproductos`
--

LOCK TABLES `nuevosproductos` WRITE;
/*!40000 ALTER TABLE `nuevosproductos` DISABLE KEYS */;
INSERT INTO `nuevosproductos` VALUES (1,'nvidia3060',250000,'2023-11-16','root@localhost','insert'),(2,'nvidia3090',350000,'2023-11-16','root@localhost','insert'),(3,'amd5700',120000,'2023-11-16','root@localhost','insert'),(4,'amd6700xt',450000,'2023-11-16','root@localhost','insert');
/*!40000 ALTER TABLE `nuevosproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `nuevosusuarios`
--

LOCK TABLES `nuevosusuarios` WRITE;
/*!40000 ALTER TABLE `nuevosusuarios` DISABLE KEYS */;
INSERT INTO `nuevosusuarios` VALUES (1,'usuarioDario','dario_email@gmail.com','2023-11-16','root@localhost','insert'),(2,'usuarioMaria','maria_email@gmail.com','2023-11-16','root@localhost','insert'),(3,'usuarioMarcelo','marcelo_email@gmail.com','2023-11-16','root@localhost','insert'),(4,'usuarioAgustina','agustina_email@gmail.com','2023-11-16','root@localhost','insert');
/*!40000 ALTER TABLE `nuevosusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'2023-11-11'),(2,2,'2022-11-11'),(3,3,'2021-11-11'),(4,4,'2000-11-11');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'nvidia3060',30,250000),(2,1,'nvidia3090',10,350000),(3,1,'amd5700',25,120000),(4,1,'amd6700xt',5,450000);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productoseliminados`
--

LOCK TABLES `productoseliminados` WRITE;
/*!40000 ALTER TABLE `productoseliminados` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoseliminados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'criptoVentas','calle 20 numero 2323');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'usuarioDario','123456','dario_email@gmail.com'),(2,'usuarioMaria','asd123','maria_email@gmail.com'),(3,'usuarioMarcelo','abc123','marcelo_email@gmail.com'),(4,'usuarioAgustina','123456','agustina_email@gmail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarioseliminados`
--

LOCK TABLES `usuarioseliminados` WRITE;
/*!40000 ALTER TABLE `usuarioseliminados` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarioseliminados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-16 20:53:14
