CREATE DATABASE  IF NOT EXISTS `transaction` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `transaction`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: transaction
-- ------------------------------------------------------
-- Server version	5.5.2-m2-community

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
-- Table structure for table `tb_client`
--

DROP TABLE IF EXISTS `tb_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_client` (
  `client_Id` int(8) NOT NULL AUTO_INCREMENT,
  `client_msisdn` varchar(20) NOT NULL,
  `client_imei` varchar(20) NOT NULL,
  `client_codepin` varchar(20) NOT NULL,
  PRIMARY KEY (`client_Id`),
  UNIQUE KEY `client_msisdn` (`client_msisdn`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_client`
--

LOCK TABLES `tb_client` WRITE;
/*!40000 ALTER TABLE `tb_client` DISABLE KEYS */;
INSERT INTO `tb_client` VALUES (2,'235698741\n','78455666\n','89566323'),(3,'0896306181\n','202020202','123'),(4,'0897396004\n','456987456','123'),(5,'0840851321\n','451245124','4512');
/*!40000 ALTER TABLE `tb_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_compte`
--

DROP TABLE IF EXISTS `tb_compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_compte` (
  `compteId` int(11) NOT NULL AUTO_INCREMENT,
  `client_msisdn` varchar(20) DEFAULT NULL,
  `compte_montant` varchar(20) DEFAULT NULL,
  `compte_mot_de_passe` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`compteId`),
  UNIQUE KEY `client_msisdn` (`client_msisdn`),
  CONSTRAINT `client_compte` FOREIGN KEY (`client_msisdn`) REFERENCES `tb_client` (`client_msisdn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_compte`
--

LOCK TABLES `tb_compte` WRITE;
/*!40000 ALTER TABLE `tb_compte` DISABLE KEYS */;
INSERT INTO `tb_compte` VALUES (1,'0896306181\n','500\n','123'),(4,'0897396004\n','1000\n','123');
/*!40000 ALTER TABLE `tb_compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_parametrages`
--

DROP TABLE IF EXISTS `tb_parametrages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_parametrages` (
  `id_param` int(11) NOT NULL,
  `proprietaire` varchar(30) NOT NULL,
  `etablissement` varchar(30) NOT NULL,
  `adresse` varchar(60) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `serialid` varchar(20) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_parametrages`
--

LOCK TABLES `tb_parametrages` WRITE;
/*!40000 ALTER TABLE `tb_parametrages` DISABLE KEYS */;
INSERT INTO `tb_parametrages` VALUES (9,'ETABLIS','TEST','OK','+243897396004','41345','AFD0012FGKH',1);
/*!40000 ALTER TABLE `tb_parametrages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaction`
--

DROP TABLE IF EXISTS `tb_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaction` (
  `transaction_Id` int(20) NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(20) NOT NULL,
  `transaction_montant` varchar(20) NOT NULL,
  `transaction_date` varchar(20) NOT NULL,
  `msisdn_appelant` varchar(20) NOT NULL,
  `msisdn_appelee` varchar(20) NOT NULL,
  PRIMARY KEY (`transaction_Id`),
  KEY `msisdn_appelant` (`msisdn_appelant`),
  KEY `msisdn_appelee` (`msisdn_appelee`),
  CONSTRAINT `cle_appelant` FOREIGN KEY (`msisdn_appelant`) REFERENCES `tb_client` (`client_msisdn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaction`
--

LOCK TABLES `tb_transaction` WRITE;
/*!40000 ALTER TABLE `tb_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `mpasse` varchar(30) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `privilege` int(11) NOT NULL DEFAULT '1',
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'krysngabisw','123456',1,2,NULL),(2,'mikesondie','2017',1,1,NULL),(3,'juniorkingidi','123456',1,1,NULL),(4,'blakings','123456',1,1,NULL),(5,'Aris','123456',1,1,NULL);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ventes`
--

DROP TABLE IF EXISTS `tb_ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ventes` (
  `id_vente` int(11) NOT NULL AUTO_INCREMENT,
  `id_produit` varchar(45) DEFAULT NULL,
  `montant` varchar(45) DEFAULT NULL,
  `datte` varchar(45) DEFAULT NULL,
  `idboutique` varchar(45) DEFAULT NULL,
  `updated` int(11) DEFAULT '0',
  PRIMARY KEY (`id_vente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ventes`
--

LOCK TABLES `tb_ventes` WRITE;
/*!40000 ALTER TABLE `tb_ventes` DISABLE KEYS */;
INSERT INTO `tb_ventes` VALUES (1,'1','3500','04-09-2017','1',0),(2,'1','4500','04-09-2017','1',0),(3,'2','4500','04-09-2017','2',0),(4,'2','4500','04-09-2017','2',0),(5,'3','10500','04-09-2017','1',0),(6,'4','32000','04-09-2017','3',0),(7,'5','88000','04-09-2017','2',0);
/*!40000 ALTER TABLE `tb_ventes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-08 15:39:27
