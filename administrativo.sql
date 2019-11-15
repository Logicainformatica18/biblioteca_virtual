-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: administrativo
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `Cod_Persona` char(11) NOT NULL,
  `Paterno` varchar(50) DEFAULT NULL,
  `Materno` varchar(50) DEFAULT NULL,
  `Nombres` varchar(50) DEFAULT NULL,
  `Direccion` longtext,
  `Ubigeo` char(6) DEFAULT NULL,
  `Fec_Nacimiento` datetime(6) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Te_Estado_Civil` char(2) DEFAULT NULL,
  `Te_Doc_Identidad` char(2) DEFAULT NULL,
  `Numero_Documento` varchar(10) DEFAULT NULL,
  `Ruc` varchar(18) DEFAULT NULL,
  `Telefono` varchar(18) DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `Logins` varchar(20) DEFAULT NULL,
  `Clave` longtext,
  `Foto` longblob,
  `Email` longtext,
  `Estado` char(1) DEFAULT NULL,
  `Fec_Reg` datetime(6) DEFAULT NULL,
  `Fec_Mod` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Cod_Persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=22072;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alumno_mensaje`
--

DROP TABLE IF EXISTS `alumno_mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_mensaje` (
  `cod_Habitante_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `cod_persona` char(11) DEFAULT NULL,
  `mensaje` varchar(1000) DEFAULT NULL,
  `imagen` longblob,
  `url_youtube` varchar(200) DEFAULT NULL,
  `url_pdf` varchar(200) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_Habitante_mensaje`),
  KEY `fk_alumno_mensaje_alumno` (`cod_persona`),
  CONSTRAINT `fk_alumno_mensaje_alumno` FOREIGN KEY (`cod_persona`) REFERENCES `alumno` (`Cod_Persona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `cod_asistencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `cod_registro_detalle` int(11) DEFAULT NULL,
  `estado` varchar(1) DEFAULT 'F',
  `fec_reg` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`cod_asistencia`),
  KEY `asistencia_ibfk_1` (`cod_registro_detalle`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`cod_registro_detalle`) REFERENCES `registro_detalle` (`Cod_registro_detalle`)
) ENGINE=InnoDB AUTO_INCREMENT=3781 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=65;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `Cod_curso` bigint(20) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `ciclo` varchar(5) DEFAULT NULL,
  `Cod_Sublinea` char(3) DEFAULT NULL,
  `foto` longblob,
  PRIMARY KEY (`Cod_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=564;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `Cod_horario` bigint(20) NOT NULL AUTO_INCREMENT,
  `Hora_inicial` time DEFAULT NULL,
  `Hora_final` time DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_horario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `Cod_Marca` char(2) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Ruc` varchar(11) DEFAULT NULL,
  `Aliass` varchar(20) DEFAULT NULL,
  `Des_Larga` varchar(100) DEFAULT NULL,
  `Des_Corta` varchar(20) DEFAULT NULL,
  `Des_Sunat` varchar(100) DEFAULT NULL,
  `Resolucion` longtext,
  `Dir_R_S_D` varchar(50) DEFAULT NULL,
  `Cod_Responasable` char(11) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `Fec_Reg` datetime(6) DEFAULT NULL,
  `Fec_Mod` datetime(6) DEFAULT NULL,
  `Cod_Usuario` varchar(20) DEFAULT NULL,
  `Vinculado` char(1) DEFAULT NULL,
  `Resolucion_Creacion` longtext,
  `Resolucion_Autorizacion_Modulo` longtext,
  PRIMARY KEY (`Cod_Marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `cod_modulo` varchar(1) NOT NULL,
  `Descripcion` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`cod_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `cod_notas` bigint(20) NOT NULL AUTO_INCREMENT,
  `cod_registro_detalle` int(11) DEFAULT NULL,
  `n1` decimal(2,0) DEFAULT '0',
  `n2` decimal(2,0) DEFAULT '0',
  `n3` decimal(2,0) DEFAULT '0',
  `n4` decimal(2,0) DEFAULT '0',
  `n5` decimal(2,0) DEFAULT '0',
  `ex1` decimal(2,0) DEFAULT '0',
  `p1` int(2) GENERATED ALWAYS AS ((((((((`n1` + `n2`) + `n3`) + `n4`) + `n5`) / 5) + `ex1`) / 2)) VIRTUAL,
  `n7` decimal(2,0) DEFAULT '0',
  `n8` decimal(2,0) DEFAULT '0',
  `n9` decimal(2,0) DEFAULT '0',
  `n10` decimal(2,0) DEFAULT '0',
  `n11` decimal(2,0) DEFAULT '0',
  `ex2` decimal(2,0) DEFAULT '0',
  `p2` int(2) GENERATED ALWAYS AS ((((((((`n7` + `n8`) + `n9`) + `n10`) + `n11`) / 5) + `ex2`) / 2)) VIRTUAL,
  `pfinal` int(2) GENERATED ALWAYS AS ((((((((((`n1` + `n2`) + `n3`) + `n4`) + `n5`) / 5) + `ex1`) / 2) + (((((((`n7` + `n8`) + `n9`) + `n10`) + `n11`) / 5) + `ex2`) / 2)) / 2)) VIRTUAL,
  `calificacion` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fec_reg` datetime DEFAULT NULL,
  `fec_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_notas`),
  KEY `notas_ibfk_1` (`cod_registro_detalle`),
  CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`cod_registro_detalle`) REFERENCES `registro_detalle` (`Cod_registro_detalle`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=197;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Cod_Marca` char(2) NOT NULL,
  `Cod_Linea` char(3) NOT NULL,
  `Cod_Sublinea` char(3) NOT NULL,
  `Cod_Producto` char(5) NOT NULL,
  `Descripcion` longtext,
  `Programa_Regular` char(1) DEFAULT NULL,
  `Secuencia` tinyint(3) unsigned DEFAULT NULL,
  `Cod_Producto_Ant` char(5) DEFAULT NULL,
  `Aliass` varchar(30) DEFAULT NULL,
  `Estado_SG` char(1) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `Fec_Reg` datetime(6) DEFAULT NULL,
  `Fec_Mod` datetime(6) DEFAULT NULL,
  `Cod_Usuario` varchar(20) DEFAULT NULL,
  `Vinculado` char(1) DEFAULT NULL,
  PRIMARY KEY (`Cod_Marca`,`Cod_Linea`,`Cod_Sublinea`,`Cod_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=150;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profesorist`
--

DROP TABLE IF EXISTS `profesorist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesorist` (
  `Dni` char(10) NOT NULL,
  `Paterno` varchar(50) DEFAULT NULL,
  `Materno` varchar(50) DEFAULT NULL,
  `Nombres` varchar(50) DEFAULT NULL,
  `Direccion` longtext,
  `Fec_Nacimiento` date DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Te_Estado_Civil` char(2) DEFAULT NULL,
  `Telefono` varchar(18) DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `Clave` longtext,
  `Foto` longblob,
  `Email` longtext,
  `Fec_Reg` datetime(6) DEFAULT NULL,
  `Fec_Mod` datetime(6) DEFAULT NULL,
  `Fec_conexion` datetime DEFAULT NULL,
  PRIMARY KEY (`Dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=24576;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion` (
  `cod_publicacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni` char(10) NOT NULL,
  `cod_curso` bigint(20) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `semana` varchar(2) NOT NULL,
  `mensaje` longtext NOT NULL,
  `url_youtube` varchar(200) DEFAULT NULL,
  `url_pdf` varchar(200) DEFAULT NULL,
  `fec_reg` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_publicacion`),
  KEY `publicacion_ibfk_1` (`dni`),
  KEY `publicacion_ibfk_2` (`cod_curso`),
  CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `profesorist` (`Dni`),
  CONSTRAINT `publicacion_ibfk_2` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`Cod_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `Cod_Registro` bigint(20) NOT NULL AUTO_INCREMENT,
  `Cod_profesorist` char(10) DEFAULT NULL,
  `Cod_Marca` char(2) NOT NULL,
  `Cod_curso` bigint(20) NOT NULL,
  `Cod_Horario` bigint(20) NOT NULL,
  `Cod_frecuencia` bigint(20) NOT NULL,
  `Fecha_inicio` date DEFAULT NULL,
  `Fecha_fin` date DEFAULT NULL,
  `entregado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Cod_Registro`),
  KEY `fk_registro_curso1` (`Cod_curso`),
  KEY `fk_registro_horario1` (`Cod_Horario`),
  KEY `fk_registro_marca1` (`Cod_Marca`),
  KEY `fk_registro_profesorist1` (`Cod_profesorist`),
  KEY `fk_registro_registro_frecuencia1` (`Cod_frecuencia`),
  CONSTRAINT `fk_registro_curso1` FOREIGN KEY (`Cod_curso`) REFERENCES `curso` (`Cod_curso`),
  CONSTRAINT `fk_registro_horario1` FOREIGN KEY (`Cod_Horario`) REFERENCES `horario` (`Cod_horario`),
  CONSTRAINT `fk_registro_marca1` FOREIGN KEY (`Cod_Marca`) REFERENCES `marca` (`Cod_Marca`),
  CONSTRAINT `fk_registro_profesorist1` FOREIGN KEY (`Cod_profesorist`) REFERENCES `profesorist` (`Dni`),
  CONSTRAINT `fk_registro_registro_frecuencia1` FOREIGN KEY (`Cod_frecuencia`) REFERENCES `registro_frecuencia` (`Cod_Frecuencia`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro_detalle`
--

DROP TABLE IF EXISTS `registro_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_detalle` (
  `Cod_registro_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_registro` bigint(20) NOT NULL,
  `Cod_Persona` char(11) NOT NULL,
  `Cod_modulo` varchar(1) DEFAULT NULL,
  `Cod_Sublinea` char(3) NOT NULL,
  `Fec_Reg` datetime(6) DEFAULT NULL,
  `Fec_Mod` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Cod_registro_detalle`),
  KEY `fk_registro_detalle_alumno1` (`Cod_Persona`),
  KEY `fk_registro_detalle_modulo1` (`Cod_modulo`),
  KEY `fk_registro_detalle_registro1` (`Cod_registro`),
  KEY `fk_registro_detalle_sub_linea1_idx` (`Cod_Sublinea`),
  CONSTRAINT `fk_registro_detalle_alumno1` FOREIGN KEY (`Cod_Persona`) REFERENCES `alumno` (`Cod_Persona`),
  CONSTRAINT `fk_registro_detalle_modulo1` FOREIGN KEY (`Cod_modulo`) REFERENCES `modulo` (`cod_modulo`),
  CONSTRAINT `fk_registro_detalle_registro1` FOREIGN KEY (`Cod_registro`) REFERENCES `registro` (`Cod_Registro`),
  CONSTRAINT `fk_registro_detalle_sub_linea1` FOREIGN KEY (`Cod_Sublinea`) REFERENCES `sub_linea` (`Cod_Sublinea`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=197;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro_frecuencia`
--

DROP TABLE IF EXISTS `registro_frecuencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_frecuencia` (
  `Cod_Frecuencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Frecuencia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_linea`
--

DROP TABLE IF EXISTS `sub_linea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_linea` (
  `Cod_Marca` char(2) DEFAULT NULL,
  `Cod_Linea` char(3) DEFAULT NULL,
  `Cod_Sublinea` char(3) NOT NULL,
  `Numero` char(2) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `TE_Tipo_Especialidad` char(2) DEFAULT NULL,
  `Aliass` varchar(15) DEFAULT NULL,
  `Estado_Sg` char(1) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `Fec_Reg` datetime(6) DEFAULT NULL,
  `Fec_Mod` datetime(6) DEFAULT NULL,
  `Cod_Usuario` varchar(20) DEFAULT NULL,
  `Vinculado` char(1) DEFAULT NULL,
  PRIMARY KEY (`Cod_Sublinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=237;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'administrativo'
--

--
-- Dumping routines for database 'administrativo'
--
/*!50003 DROP PROCEDURE IF EXISTS `ab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ab`(IN `Cod_registro_in` BIGINT(10), IN `cod_registro_detalle_in` BIGINT)
BEGIN

  SET @v1 = (SELECT

      r.fecha_inicio

    FROM registro r

    WHERE r.cod_registro = cod_registro_in);



  WHILE @v1 <= (SELECT

        r.fecha_fin

      FROM registro r

      WHERE r.cod_registro = cod_registro_in) DO

    INSERT INTO asistencia (cod_registro_detalle, fec_reg)

      VALUES (cod_registro_detalle_in, @v1);

    SET @v1 = ADDDATE(@v1, INTERVAL 7 DAY);

  END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alumno_Cambiar_clave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Cambiar_clave`(IN `Cod_persona_in` CHAR(11) CHARSET utf8, IN `Clave_in` VARCHAR(200) CHARSET utf8)
BEGIN

  UPDATE alumno

  SET Clave = Clave_in

  WHERE  Numero_Documento  = Cod_persona_in;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alumno_foto_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_foto_delete`(IN `Cod_persona_in` CHAR(11) CHARSET utf8)
BEGIN

  UPDATE alumno

  SET Foto = ''

  WHERE  Numero_Documento  = Cod_persona_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alumno_foto_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_foto_insert`(IN `Cod_persona_in` CHAR(11) CHARSET utf8, IN `Foto_in` LONGBLOB)
BEGIN

  UPDATE alumno

  SET foto = Foto_in

  WHERE  Numero_Documento = Cod_persona_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alumno_foto_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_foto_update`(IN `Cod_persona_in` CHAR(11) CHARSET utf8, IN `Foto_in` LONGBLOB)
BEGIN

  UPDATE alumno

  SET Foto = Foto_in

  WHERE  Numero_Documento  = Cod_persona_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alumno_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Insert`(IN `Cod_Persona_in` CHAR(11) CHARSET utf8, IN `Paterno_in` VARCHAR(50) CHARSET utf8, IN `Materno_in` VARCHAR(50) CHARSET utf8, IN `Nombres_in` VARCHAR(50) CHARSET utf8, IN `Direccion_in` LONGTEXT CHARSET utf8, IN `Fec_Nacimiento_in` DATE, IN `Sexo_in` CHAR(1) CHARSET utf8, IN `Te_Estado_Civil_in` CHAR(2) CHARSET utf8, IN `Numero_Documento_in` VARCHAR(10) CHARSET utf8, IN `Telefono_in` VARCHAR(18) CHARSET utf8, IN `Celular_in` VARCHAR(20) CHARSET utf8, IN `Clave_in` LONGTEXT CHARSET utf8, IN `Email_in` LONGTEXT CHARSET utf8)
BEGIN

  INSERT INTO alumno (cod_persona, paterno, Materno, Nombres, direccion, fec_nacimiento, sexo,

  te_estado_civil, numero_documento, telefono, celular, clave, email, Fec_Reg)

    VALUES (cod_persona_in, paterno_in, Materno_in, Nombres_in, direccion_in, fec_nacimiento_in, sexo_in, te_estado_civil_in, numero_documento_in, telefono_in, celular_in, clave_in, email_in, NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alumno_mensaje_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_mensaje_insert`(IN `Cod_persona_in` VARCHAR(200) CHARSET utf8, IN `mensaje_in` VARCHAR(1000), IN `imagen_in` LONGBLOB, IN `url_youtube_in` VARCHAR(200), IN `url_pdf_in` VARCHAR(200))
BEGIN

  INSERT INTO alumno_mensaje (Cod_persona, mensaje, imagen, url_youtube, url_pdf, fecha)

    VALUES (Cod_persona_in, mensaje_in, imagen_in, url_youtube_in, url_pdf_in, NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alumno_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_search`(IN `criterio_in` VARCHAR(200) CHARSET utf8, IN `tipo_in` VARCHAR(1))
BEGIN

  IF tipo_in = '2' THEN

    SELECT

      cod_persona,

      paterno,

      materno,

      nombres

    FROM alumno

    WHERE CONCAT(PATERNO, ' ', MATERNO, ' ', NOMBRES) LIKE CONCAT(criterio_in, '%')

    ORDER BY paterno;

  ELSEIF tipo_in = '1' THEN

    SELECT

      cod_persona,

      paterno,

      materno,

      nombres

    FROM alumno

    WHERE cod_persona LIKE criterio_in

    ORDER BY paterno;

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alumno_Select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Select`(IN `Cod_persona_in` CHAR(11) CHARSET utf8)
BEGIN

  SELECT

    *

  FROM alumno

  WHERE cod_persona = cod_persona_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alumno_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Update`(IN `Cod_Persona_in` CHAR(11) CHARSET utf8, IN `Direccion_in` LONGTEXT, IN `Te_Estado_Civil_in` CHAR(2), IN `Numero_Documento_in` VARCHAR(10), IN `Celular_in` VARCHAR(20), IN `Email_in` LONGTEXT)
BEGIN

  UPDATE alumno

  SET direccion = direccion_in,

      te_estado_civil = te_estado_civil_in,

      numero_documento = numero_documento_in,

      Celular = celular_in,

      email = email_in,

      Fec_Mod = NOW()

  WHERE cod_persona = cod_persona_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alumno_Update_Select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Update_Select`(IN `Cod_persona_in` CHAR(11) CHARSET utf8)
BEGIN

  SELECT

    direccion,

    te_estado_civil,

    numero_documento,

    Celular,

    email

  FROM alumno

  WHERE cod_persona = cod_persona_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `asistencia_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `asistencia_insert`(IN `cod_registro_detalle_in` INT, IN `fecha_marcar_in` DATE)
BEGIN

  SET @fecha = (SELECT

      fec_reg

    FROM asistencia

    WHERE cod_registro_detalle = cod_registro_detalle_in

    AND fec_reg = fecha_marcar_in);



  IF fecha_marcar_in = @fecha THEN

    UPDATE asistencia

    SET estado = 'A',

        hora = CURTIME()

    WHERE cod_registro_detalle = cod_registro_detalle_in

    AND fec_reg = @fecha;

  ELSE

    -- lanzar error

    SIGNAL SQLSTATE '45000'

    SET MESSAGE_TEXT = 'Error de marcación';

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `asistencia_marcar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `asistencia_marcar`(IN `cod_registro_detalle_in` varchar(11))
BEGIN
if (select estado from asistencia where cod_registro_detalle=cod_registro_detalle_in and fec_reg=date(now()))='F' then
        UPDATE asistencia
        SET estado = 'A',
        hora=time(now())
        WHERE cod_registro_detalle = cod_registro_detalle_in and fec_reg=date(now());
        else
        UPDATE asistencia
        SET estado = 'F',
        hora=null
        WHERE cod_registro_detalle = cod_registro_detalle_in and fec_reg=date(now()) ;
        end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `asistencia_reporte_actual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `asistencia_reporte_actual`(IN `cod_registro_in` BIGINT)
BEGIN

  SELECT

    al.cod_persona,

    al.paterno,

    al.materno,

    al.nombres,

    a.estado,

    a.hora

  FROM asistencia a,

       registro_detalle rd,

       alumno al

  WHERE a.fec_reg = CURDATE()

  AND rd.cod_registro_detalle = a.cod_registro_detalle

  AND rd.cod_persona = al.cod_persona

  AND rd.cod_registro = cod_registro_in

  --  and a.estado='A'

  ORDER BY al.paterno ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Carrera_superior_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Carrera_superior_select`()
BEGIN

  SELECT

    Cod_sublinea,

    Descripcion

  FROM Sub_Linea

  WHERE cod_linea = '001'

  AND cod_marca = '01';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Curso_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Curso_insert`(IN `Descripcion_in` VARCHAR(100), IN `ciclo_in` VARCHAR(5), IN `Cod_Sublinea_in` CHAR(3))
BEGIN

  INSERT INTO curso (Descripcion, ciclo, Cod_Sublinea)

    VALUES (Descripcion_in, ciclo_in, Cod_Sublinea_in);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Curso_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Curso_select`()
BEGIN

  SELECT

    c.Descripcion,

    c.ciclo,

    s.descripcion

  FROM curso c,

       sub_linea s

  WHERE c.Cod_sublinea = s.Cod_sublinea

  AND s.cod_linea = '001'

  AND s.cod_marca = '01'

  ORDER BY c.ciclo ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Habitante_ver_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Habitante_ver_nota`(IN `Cod_persona_in` CHAR(11), IN `Cod_Producto_SG_in` CHAR(5), IN `Cod_Linea_in` CHAR(3), IN `Cod_Marca_in` CHAR(2), IN `Cod_Local_SG_in` CHAR(2), IN `Cod_Sublinea_SG_in` CHAR(3))
BEGIN

  SELECT

    p.descripcion,

    n.nota

  FROM notas_alumno_sg n,

       producto_cursos_sg_new p

  WHERE n.cod_persona = Cod_persona_in

  AND n.cod_producto_sg = Cod_Producto_SG_in

  AND n.cod_linea = Cod_Linea_in

  AND n.cod_marca = Cod_Marca_in

  AND n.Cod_local_sg = Cod_Local_SG_in

  AND n.cod_sublinea_sg = Cod_Sublinea_SG_in

  AND n.cod_producto_sg = p.cod_producto_sg

  AND n.cod_linea = p.cod_linea

  AND n.cod_sublinea_sg = p.cod_sublinea_sg

  AND n.cod_marca = p.cod_marca

  AND n.Cod_Plan_SG = p.cod_plan_sg

  AND n.Cod_Curso_SG = p.Cod_Curso_SG;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mensaje_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mensaje_select`()
BEGIN

  SELECT

    Nombres,

    FECHA,

    MENSAJE,

    imagen,

    url_youtube,

    url_pdf

  FROM Alumno_mensaje,

       Alumno

  WHERE Alumno_mensaje.Cod_persona = Alumno.Cod_persona

  ORDER BY Alumno_mensaje.FECHA DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `notas_alumno_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `notas_alumno_insert`(IN `cod_registro_detalle_in` BIGINT, IN `n1_in` NUMERIC(2), IN `n2_in` NUMERIC(2), IN `n3_in` NUMERIC(2), IN `n4_in` NUMERIC(2), IN `n5_in` NUMERIC(2), IN `ex1_in` NUMERIC(2), IN `n7_in` NUMERIC(2), IN `n8_in` NUMERIC(2), IN `n9_in` NUMERIC(2), IN `n10_in` NUMERIC(2), IN `n11_in` NUMERIC(2), IN `ex2_in` NUMERIC(2))
BEGIN

  UPDATE notas

  SET n1 = n1_in,

      n2 = n2_in,

      n3 = n3_in,

      n4 = n4_in,

      n5 = n5_in,

      ex1 = ex1_in,

      n7 = n7_in,

      n8 = n8_in,

      n9 = n9_in,

      n10 = n10_in,

      n11 = n11_in,

      ex2 = ex2_in,

      fec_mod = NOW()

  WHERE cod_registro_detalle = cod_registro_detalle_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `notas_alumno_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `notas_alumno_select`(IN `cod_registro_in` BIGINT(20), IN `cod_persona_in` CHAR(11))
BEGIN

  SELECT

    a.cod_persona,

    a.paterno,

    a.materno,

    a.nombres,

    c.descripcion,

    n.n1,

    n.n2,

    n.n3,

    n.n4,

    n.n5,

    n.ex1,

    n.p1,

    n.n7,

    n.n8,

    n.n9,

    n.n10,

    n.n11,

    n.ex2,

    n.p2,

    n.pfinal,

    rd.cod_registro_detalle

  FROM alumno a,

       notas n,

       registro_detalle rd,

       curso c,

       registro r

  WHERE a.cod_persona = rd.cod_persona

  AND rd.cod_registro_detalle = n.cod_registro_detalle

  AND c.cod_curso = r.cod_curso

  AND rd.cod_registro = r.cod_registro

  AND rd.cod_registro = cod_registro_in

  AND rd.cod_persona = cod_persona_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `notas_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `notas_insert`(IN `cod_registro_detalle_in` INT)
BEGIN

  INSERT INTO notas (cod_registro_detalle, fec_reg, fec_mod)

    VALUES (cod_registro_detalle_in, NOW(), NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `notas_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `notas_update`(IN `cod_registro_detalle_in` BIGINT, IN `n1_in` NUMERIC(2), IN `n2_in` NUMERIC(2), IN `n3_in` NUMERIC(2), IN `n4_in` NUMERIC(2), IN `n5_in` NUMERIC(2), IN `ex1_in` NUMERIC(2), IN `n7_in` NUMERIC(2), IN `n8_in` NUMERIC(2), IN `n9_in` NUMERIC(2), IN `n10_in` NUMERIC(2), IN `n11_in` NUMERIC(2), IN `ex2_in` NUMERIC(2))
BEGIN

  IF (n1_in > -1

    AND n1_in < 21)

    AND (n2_in > -1

    AND n2_in < 21)

    AND (n3_in > -1

    AND n3_in < 21)

    AND (n4_in > -1

    AND n4_in < 21)

    AND (n5_in > -1

    AND n5_in < 21)

    AND (ex1_in > -1

    AND ex1_in < 21)

    AND (n7_in > -1

    AND n7_in < 21)

    AND (n8_in > -1

    AND n8_in < 21)

    AND (n9_in > -1

    AND n9_in < 21)

    AND (n10_in > -1

    AND n10_in < 21)

    AND (n11_in > -1

    AND n11_in < 21)

    AND (ex2_in > -1

    AND ex2_in < 21) THEN

    UPDATE notas

    SET n1 = n1_in,

        n2 = n2_in,

        n3 = n3_in,

        n4 = n4_in,

        n5 = n5_in,

        ex1 = ex1_in,

        n7 = n7_in,

        n8 = n8_in,

        n9 = n9_in,

        n10 = n10_in,

        n11 = n11_in,

        ex2 = ex2_in,

        fec_mod = NOW()

    WHERE cod_registro_detalle = cod_registro_detalle_in;

  ELSE

    -- lanzar error

    SIGNAL SQLSTATE '45000'

    SET MESSAGE_TEXT = 'Error de modificacion';

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nota_curso_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nota_curso_select`(`Cod_persona_in` CHAR(11) CHARSET utf8)
BEGIN

  SELECT

    c.*

  FROM registro_detalle rd,

       registro r,

       alumno a,

       curso c

  WHERE rd.Cod_Persona = Cod_persona_in

  AND r.cod_registro = rd.cod_registro

  AND a.cod_persona = rd.cod_persona

  AND r.cod_curso = c.cod_curso;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorist_cambiar_clave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorist_cambiar_clave`(IN `dni_in` VARCHAR(10) CHARSET utf8, IN `clave_in` VARCHAR(100))
BEGIN

  UPDATE profesorist

  SET clave = clave_in

  WHERE dni = dni_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorist_foto_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorist_foto_delete`(IN `Dni_in` VARCHAR(10) CHARSET utf8)
BEGIN

  UPDATE profesorist

  SET Foto = ''

  WHERE Dni = Dni_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorist_foto_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorist_foto_update`(IN `Dni_in` VARCHAR(10) CHARSET utf8, IN `Foto_in` LONGBLOB)
BEGIN

  UPDATE profesorist

  SET Foto = Foto_in

  WHERE Dni = Dni_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorist_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorist_Insert`(IN `Dni_in` CHAR(11) CHARSET utf8, IN `Paterno_in` VARCHAR(50), IN `Materno_in` VARCHAR(50), IN `Nombres_in` VARCHAR(50), IN `Direccion_in` LONGTEXT, IN `Fec_Nacimiento_in` DATE, IN `Sexo_in` CHAR(1), IN `Te_Estado_Civil_in` CHAR(2), IN `Telefono_in` VARCHAR(18), IN `Celular_in` VARCHAR(20), IN `Clave_in` LONGTEXT, IN `Email_in` LONGTEXT)
BEGIN

  INSERT INTO profesorist (dni, paterno, Materno, Nombres, direccion, fec_nacimiento, sexo,

  te_estado_civil, telefono, celular, clave, email, Fec_Reg, Fec_Mod, Fec_conexion)

    VALUES (dni_in, paterno_in, Materno_in, Nombres_in, direccion_in, fec_nacimiento_in, sexo_in, te_estado_civil_in, telefono_in, celular_in, clave_in, email_in, NOW(), NOW(), NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorIST_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorIST_login`(IN `Dni_in` VARCHAR(10) CHARSET utf8, IN `clave_in` VARCHAR(100) CHARSET utf8)
BEGIN

  UPDATE profesorist

  SET Fec_conexion = NOW()

  WHERE Dni = Dni_in

  AND clave = clave_in;

  SELECT

    *

  FROM profesorist

  WHERE Dni = Dni_in

  AND clave = clave_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorIST_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorIST_select`(IN `Dni_in` VARCHAR(10) CHARSET utf8)
BEGIN

  SELECT

    *

  FROM profesorIST

  WHERE Dni = Dni_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorist_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorist_Update`(IN `Dni_in` CHAR(10) CHARSET utf8, IN `Direccion_in` LONGTEXT, IN `Te_Estado_Civil_in` CHAR(2), IN `Celular_in` VARCHAR(20), IN `Email_in` LONGTEXT)
BEGIN

  UPDATE profesorist

  SET direccion = direccion_in,

      te_estado_civil = te_estado_civil_in,

      Celular = celular_in,

      email = email_in,

      Fec_Mod = NOW()

  WHERE Dni = Dni_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Profesorist_Update_Select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Profesorist_Update_Select`(IN `Dni_in` CHAR(10) CHARSET utf8)
BEGIN

  SELECT

    direccion,

    te_estado_civil,

    Celular,

    email

  FROM profesorist

  WHERE dni = dni_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Publicacion_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Publicacion_insert`(IN `dni_in` VARCHAR(200) CHARSET utf8, IN `cod_curso_in` BIGINT CHARSET utf8, IN `titulo_in` VARCHAR(100), IN `semana_in` VARCHAR(2), IN `mensaje_in` LONGTEXT, IN `url_youtube_in` VARCHAR(200), IN `url_pdf_in` VARCHAR(200))
BEGIN

  INSERT INTO publicacion (dni, cod_curso, titulo, semana, mensaje, url_youtube, url_pdf, fec_reg)

    VALUES (dni_in, cod_curso_in, titulo_in, semana_in, mensaje_in, url_youtube_in, url_pdf_in, NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `publicacion_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `publicacion_search`(IN `cod_curso_in` BIGINT CHARSET utf8)
BEGIN

  SELECT

    pu.cod_publicacion,

    pu.dni,

    p.Paterno,

    p.Materno,

    p.Nombres,

    c.descripcion,

    pu.titulo,

    pu.semana,

    pu.mensaje,

    pu.fec_reg,

    pu.url_youtube,

    pu.url_pdf

  FROM publicacion pu,

       profesorist p,

       curso c

  WHERE pu.dni = p.dni

  AND c.cod_curso = pu.cod_curso

  AND pu.cod_curso = cod_curso_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `publicacion_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `publicacion_select`()
BEGIN

  SELECT

    pu.cod_publicacion,

    pu.dni,

    p.Paterno,

    p.Materno,

    p.Nombres,

    c.descripcion,

    pu.titulo,

    pu.semana,

    pu.mensaje,

    pu.fec_reg,

    pu.url_youtube,

    pu.url_pdf

  FROM publicacion pu,

       profesorist p,

       curso c

  WHERE pu.dni = p.dni

  AND c.cod_curso = pu.cod_curso

  ORDER BY pu.semana, c.descripcion LIMIT 30;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_alumno_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_alumno_delete`(IN `cod_registro_detalle_in` BIGINT(10) CHARSET utf8)
BEGIN

  -- ELIMINA  NOTAS DEL ALUMNO

  DELETE

    FROM notas

  WHERE cod_registro_detalle = cod_registro_detalle_in;

  -- ELIMINA ASISTENCIA DEL ALUMNO

  DELETE

    FROM asistencia

  WHERE cod_registro_detalle = cod_registro_detalle_in;

  -- ELIMINA AL ALUMNO DEL REGISTRO DETALLE

  DELETE

    FROM registro_detalle

  WHERE cod_registro_detalle = cod_registro_detalle_in;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_detalle_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_detalle_insert`(IN `Cod_registro_in` BIGINT(10) CHARSET utf8, IN `Cod_Persona_in` CHAR(11) CHARSET utf8, IN `Cod_Modulo_in` VARCHAR(1) CHARSET utf8, IN `Cod_Sublinea_in` CHAR(3) CHARSET utf8)
BEGIN

  IF (SELECT

        COUNT(a.cod_persona)

      FROM registro_detalle rd,

           registro r,

           alumno a

      WHERE rd.Cod_Persona = Cod_persona_in

      AND rd.Cod_registro = Cod_registro_in

      AND r.cod_registro = rd.cod_registro

      AND a.cod_persona = rd.cod_persona) = 0 THEN

    INSERT INTO registro_detalle (Cod_registro, Cod_Persona, Cod_Modulo, Cod_Sublinea, Fec_Reg, Fec_Mod)

      VALUES (Cod_registro_in, Cod_Persona_in, Cod_Modulo_in, Cod_Sublinea_in, NOW(), NOW());

    SET @cod_registro_detalle = (SELECT

        cod_registro_detalle

      FROM registro_detalle

      WHERE cod_registro = Cod_registro_in

      AND cod_persona = cod_persona_in

      AND cod_modulo = cod_modulo_in

      AND cod_sublinea = cod_sublinea_in);

    INSERT INTO notas (cod_registro_detalle, fec_reg, fec_mod)

      VALUES (@cod_registro_detalle, NOW(), NOW());



    SET @v1 = (SELECT

        r.fecha_inicio

      FROM registro r

      WHERE r.cod_registro = cod_registro_in);



    WHILE @v1 <= (SELECT

          r.fecha_fin

        FROM registro r

        WHERE r.cod_registro = cod_registro_in) DO

      INSERT INTO asistencia (cod_registro_detalle, fec_reg)

        VALUES (@cod_registro_detalle, @v1);

      SET @v1 = ADDDATE(@v1, INTERVAL 7 DAY);

    END WHILE;



  ELSE

    -- lanzar error

    SIGNAL SQLSTATE '45000'

    SET MESSAGE_TEXT = 'Ya está registrado';

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_entregado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_entregado`(IN `cod_registro_in` BIGINT(20) CHARSET utf8, `cod_profesorist_in` CHAR(10) CHARSET utf8)
BEGIN
if (select entregado from registro where cod_registro=cod_registro_in and cod_profesorist=cod_profesorist_in)='si' then
  UPDATE registro
  SET entregado = 'no'
  WHERE cod_registro = cod_registro_in and cod_profesorist=cod_profesorist_in;
  else
   UPDATE registro
  SET entregado = 'si'
  WHERE cod_registro = cod_registro_in and cod_profesorist=cod_profesorist_in;
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Registro_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registro_insert`(IN `Cod_profesorist_in` CHAR(10) CHARSET utf8, IN `Cod_Marca_in` CHAR(2) CHARSET utf8, IN `Cod_curso_in` CHAR(3) CHARSET utf8, IN `Cod_Horario_in` BIGINT CHARSET utf8, IN `Cod_Frecuencia_in` BIGINT CHARSET utf8, IN `Fecha_inicio_in` DATE, IN `Fecha_fin_in` DATE)
BEGIN

  -- set @Cod_registro=(select max(Cod_registro) from registro)+1;

  INSERT INTO registro (Cod_profesorist, Cod_Marca, Cod_curso, Cod_Horario, Cod_Frecuencia, Fecha_inicio, Fecha_fin)

    VALUES (Cod_profesorist_in, Cod_Marca_in, Cod_curso_in, Cod_Horario_in, Cod_Frecuencia_in, Fecha_inicio_in, Fecha_fin_in);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_profesor_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_profesor_delete`(IN `cod_registro_in` BIGINT(10) CHARSET utf8, IN `dni_in` CHAR(10) CHARSET utf8)
BEGIN

  DELETE

    FROM registro

  WHERE cod_registro = cod_registro_in

    AND cod_profesorist = dni_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_search`(IN `cod_registro_in` BIGINT(10) CHARSET utf8)
BEGIN

  SELECT

    rd.cod_registro_detalle,

    a.Cod_persona,

    a.Paterno,

    a.Materno,

    a.Nombres,

    r.cod_registro,

    s.Descripcion AS Carrera,

    m.Descripcion AS Modulo,

    r.Fecha_inicio,

    r.Fecha_fin,

    rf.Descripcion,

    h.descripcion AS Hora

  FROM alumno a,

       registro r,

       registro_detalle rd,

       modulo m,

       sub_linea s,

       registro_frecuencia rf,

       horario h

  WHERE a.Cod_Persona = rd.Cod_Persona

  AND r.Cod_Registro = rd.Cod_registro

  AND rd.Cod_Modulo = m.Cod_Modulo

  AND s.cod_linea = '001'

  AND s.cod_marca = '01'

  AND r.cod_frecuencia = rf.cod_frecuencia

  AND h.cod_horario = r.cod_horario

  AND s.cod_sublinea = rd.cod_sublinea

  AND r.Cod_Registro = cod_registro_in

  ORDER BY a.Paterno ASC

  ;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Registro_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registro_select`(IN `cod_profesorist_in` CHAR(10)  CHARSET utf8)
BEGIN

  SELECT

    r.Cod_registro,

    m.descripcion,

    rf.descripcion,

    h.Descripcion,

    c.Descripcion,

    r.Fecha_inicio,

    r.Fecha_fin,

    r.entregado

  FROM registro r,

       curso c,

       horario h,

       registro_frecuencia rf,

       marca m

  WHERE c.Cod_curso = r.Cod_curso

  AND h.Cod_horario = r.Cod_horario

  AND r.Cod_frecuencia = rf.Cod_Frecuencia

  AND m.cod_marca = r.Cod_marca

  AND r.cod_profesorist = cod_profesorist_in

  ORDER BY r.Fecha_inicio DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-15  9:38:26
