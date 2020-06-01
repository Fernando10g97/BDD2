-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Spotify
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB-1:10.4.13+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Albumes`
--

DROP TABLE IF EXISTS `Albumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Albumes` (
  `IdAlbumes` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `FechaLanzamiento` date NOT NULL,
  PRIMARY KEY (`IdAlbumes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albumes`
--

LOCK TABLES `Albumes` WRITE;
/*!40000 ALTER TABLE `Albumes` DISABLE KEYS */;
INSERT INTO `Albumes` VALUES (1,'Corazon partido','2018-02-16'),(2,'Noches de luna llena','2013-05-15'),(3,'Amanecer bonito','2014-03-08'),(4,'Llegamos a la disco','2022-07-15'),(5,'Canciones del ayer','2017-12-18'),(6,'Caminando entre tus brazos','2003-11-17'),(7,'Volando alto','2001-01-18'),(8,'Nadando entre tus besos','2019-04-15'),(9,'Atrevete a darlo todo','2017-08-17'),(10,'un singlo sin ti','2016-11-16');
/*!40000 ALTER TABLE `Albumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artista`
--

DROP TABLE IF EXISTS `Artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artista` (
  `IdArtista` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `CorreoElectronico` varchar(50) NOT NULL,
  `FechaInicio` date NOT NULL,
  PRIMARY KEY (`IdArtista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artista`
--

LOCK TABLES `Artista` WRITE;
/*!40000 ALTER TABLE `Artista` DISABLE KEYS */;
INSERT INTO `Artista` VALUES (1,'Shakira','shakira24@gmail.com','2012-01-14'),(2,'Reik','reik45@gmail.com','2014-05-15'),(3,'Ozuna','ozuna34@gmail.com','2025-03-12'),(4,'J Balvin','jbalvin95@gmail.com','2005-02-13'),(5,'Rio Roma','rioroma12@gmail.com','2017-11-15'),(6,'Sin Bandera','sinbandera64@gmail.com','2023-10-16'),(7,'Camilo Echeverry','camilo96@gmail.com','2009-04-12'),(8,'Camila Cabello','camila89@gmail.com','2005-08-17'),(9,'Manuel Turizo','manuel65@gmail.com','2028-09-15'),(10,'Evaluna','evaluna45@gmail.com','2013-12-13');
/*!40000 ALTER TABLE `Artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Canciones`
--

DROP TABLE IF EXISTS `Canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Canciones` (
  `IdCanciones` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `FechaLanzamiento` date NOT NULL,
  `IdAlbumes` int(11) NOT NULL,
  `IdArtista` int(11) NOT NULL,
  `IdGenero` int(11) NOT NULL,
  PRIMARY KEY (`IdCanciones`),
  KEY `IdAlbumes` (`IdAlbumes`),
  KEY `IdArtista` (`IdArtista`),
  KEY `IdGenero` (`IdGenero`),
  CONSTRAINT `Canciones_ibfk_1` FOREIGN KEY (`IdAlbumes`) REFERENCES `Albumes` (`IdAlbumes`),
  CONSTRAINT `Canciones_ibfk_2` FOREIGN KEY (`IdArtista`) REFERENCES `Artista` (`IdArtista`),
  CONSTRAINT `Canciones_ibfk_3` FOREIGN KEY (`IdGenero`) REFERENCES `Genero` (`IdGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canciones`
--

LOCK TABLES `Canciones` WRITE;
/*!40000 ALTER TABLE `Canciones` DISABLE KEYS */;
INSERT INTO `Canciones` VALUES (1,'Despacito','2017-04-16',1,1,4),(2,'Abrazame','2015-06-15',2,1,2),(3,'Tu y yo','2011-07-17',2,2,5),(4,'Volverte a ver','2025-08-18',2,1,2),(5,'Amanecer','2012-10-16',3,3,3),(6,'El adios','2002-11-15',3,2,1),(7,'Vivir sin ti','2007-12-17',4,3,3),(8,'Sabor a miel','2018-01-18',4,4,1),(9,'Quedate','2019-01-19',1,2,2),(10,'Hasta ayer','2016-12-17',5,3,1);
/*!40000 ALTER TABLE `Canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CancionesFavoritas`
--

DROP TABLE IF EXISTS `CancionesFavoritas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CancionesFavoritas` (
  `IdCanciones` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  KEY `IdCanciones` (`IdCanciones`),
  CONSTRAINT `CancionesFavoritas_ibfk_1` FOREIGN KEY (`IdCanciones`) REFERENCES `Canciones` (`IdCanciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CancionesFavoritas`
--

LOCK TABLES `CancionesFavoritas` WRITE;
/*!40000 ALTER TABLE `CancionesFavoritas` DISABLE KEYS */;
/*!40000 ALTER TABLE `CancionesFavoritas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CancionesSugeridas`
--

DROP TABLE IF EXISTS `CancionesSugeridas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CancionesSugeridas` (
  `IdCanciones` int(11) NOT NULL,
  `IdPlaylist` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  KEY `IdCanciones` (`IdCanciones`),
  KEY `IdPlaylist` (`IdPlaylist`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `CancionesSugeridas_ibfk_1` FOREIGN KEY (`IdCanciones`) REFERENCES `Canciones` (`IdCanciones`),
  CONSTRAINT `CancionesSugeridas_ibfk_2` FOREIGN KEY (`IdPlaylist`) REFERENCES `Playlist` (`IdPlaylist`),
  CONSTRAINT `CancionesSugeridas_ibfk_3` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CancionesSugeridas`
--

LOCK TABLES `CancionesSugeridas` WRITE;
/*!40000 ALTER TABLE `CancionesSugeridas` DISABLE KEYS */;
/*!40000 ALTER TABLE `CancionesSugeridas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clave`
--

DROP TABLE IF EXISTS `Clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clave` (
  `IdClave` int(11) NOT NULL,
  `ClaveEncriptada` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  PRIMARY KEY (`IdClave`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `Clave_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clave`
--

LOCK TABLES `Clave` WRITE;
/*!40000 ALTER TABLE `Clave` DISABLE KEYS */;
INSERT INTO `Clave` VALUES (1,79465647,1),(2,54345323,2),(3,40254045,3),(4,78076780,4),(5,28870070,5),(6,58907897,6),(7,71237543,7),(8,78254045,8),(9,65468711,9),(10,13453873,10);
/*!40000 ALTER TABLE `Clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Escuchado`
--

DROP TABLE IF EXISTS `Escuchado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Escuchado` (
  `IdEscuchado` int(11) NOT NULL,
  `IdAlbumes` int(11) NOT NULL,
  PRIMARY KEY (`IdEscuchado`),
  KEY `IdAlbumes` (`IdAlbumes`),
  CONSTRAINT `Escuchado_ibfk_1` FOREIGN KEY (`IdAlbumes`) REFERENCES `Albumes` (`IdAlbumes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escuchado`
--

LOCK TABLES `Escuchado` WRITE;
/*!40000 ALTER TABLE `Escuchado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Escuchado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genero`
--

DROP TABLE IF EXISTS `Genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genero` (
  `IdGenero` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`IdGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genero`
--

LOCK TABLES `Genero` WRITE;
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;
INSERT INTO `Genero` VALUES (1,'Baladas'),(2,'Rock'),(3,'Pop'),(4,'Reggaeton'),(5,'Electronica'),(6,'Boleros'),(7,'Pasillos'),(8,'Instrumental'),(9,'Folklorica'),(10,'Nacional');
/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Playlist`
--

DROP TABLE IF EXISTS `Playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Playlist` (
  `IdPlaylist` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `IdCanciones` int(11) NOT NULL,
  `IdUsuarioPremium` int(11) NOT NULL,
  PRIMARY KEY (`IdPlaylist`),
  KEY `IdCanciones` (`IdCanciones`),
  KEY `IdUsuarioPremium` (`IdUsuarioPremium`),
  CONSTRAINT `Playlist_ibfk_1` FOREIGN KEY (`IdCanciones`) REFERENCES `Canciones` (`IdCanciones`),
  CONSTRAINT `Playlist_ibfk_2` FOREIGN KEY (`IdUsuarioPremium`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Playlist`
--

LOCK TABLES `Playlist` WRITE;
/*!40000 ALTER TABLE `Playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `Playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registro`
--

DROP TABLE IF EXISTS `Registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Registro` (
  `IdRegistro` int(11) NOT NULL,
  `TiempoReproduccion` time NOT NULL,
  `IdCanciones` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  PRIMARY KEY (`IdRegistro`),
  KEY `IdCanciones` (`IdCanciones`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `Registro_ibfk_1` FOREIGN KEY (`IdCanciones`) REFERENCES `Canciones` (`IdCanciones`),
  CONSTRAINT `Registro_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registro`
--

LOCK TABLES `Registro` WRITE;
/*!40000 ALTER TABLE `Registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `IdRoles` int(11) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`IdRoles`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Administrador'),(2,'Premium'),(3,'Básico');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tarjeta`
--

DROP TABLE IF EXISTS `Tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tarjeta` (
  `IdTarjeta` int(11) NOT NULL,
  `Numero` int(11) NOT NULL,
  `FechaDeExpiracion` date NOT NULL,
  `Cvc` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  PRIMARY KEY (`IdTarjeta`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `Tarjeta_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tarjeta`
--

LOCK TABLES `Tarjeta` WRITE;
/*!40000 ALTER TABLE `Tarjeta` DISABLE KEYS */;
INSERT INTO `Tarjeta` VALUES (1,205456789,'2020-05-22',852,1),(2,538798796,'2010-07-22',456,2),(3,789014763,'2015-10-21',786,3),(4,456075807,'2018-08-22',354,4),(5,870870768,'2003-11-21',238,5),(6,744414565,'2009-03-22',345,6),(7,121456875,'2027-02-21',895,7),(8,474456789,'2030-11-22',123,8),(9,874789785,'2017-05-22',741,9),(10,998123452,'2028-01-22',936,10);
/*!40000 ALTER TABLE `Tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `CorreoElectronico` varchar(50) NOT NULL,
  `FechaInicio` date NOT NULL,
  `IdRoles` int(11) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  KEY `IdRoles` (`IdRoles`),
  CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`IdRoles`) REFERENCES `Roles` (`IdRoles`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Fernando10g','fernando10g@gmail.com','2010-01-17',1),(2,'Luis97m','luis97m@gmail.com','2012-05-18',1),(3,'Camila12d','camila12d@gmail.com','2015-03-19',2),(4,'Maria24t','maria24t@gmail.com','2020-02-17',3),(5,'Carlos30s','carlos30s@gmail.com','2018-11-18',2),(6,'Juan4w','juan4w@gmail.com','2005-10-17',2),(7,'Cristina21r','cristina21r@gmail.com','2002-04-20',2),(8,'Dayana10p','dayana10p@gmail.com','2014-08-17',3),(9,'Marcos15v','marcos15v@gmail.com','2019-09-17',3),(10,'Sabrina12k','sabrina12k@gmail.com','2010-12-17',2);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-01  6:44:30
