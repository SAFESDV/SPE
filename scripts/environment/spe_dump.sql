-- MySQL dump 10.13  Distrib 5.6.30, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: SPE
-- ------------------------------------------------------
-- Server version	5.6.30-0ubuntu0.15.10.1

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
-- Table structure for table `Acceso_Etapa`
--

DROP TABLE IF EXISTS `Acceso_Etapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acceso_Etapa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(512) DEFAULT NULL,
  `etapa` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acceso_Etapa`
--

LOCK TABLES `Acceso_Etapa` WRITE;
/*!40000 ALTER TABLE `Acceso_Etapa` DISABLE KEYS */;
INSERT INTO `Acceso_Etapa` VALUES (1,'3','3'),(2,'2','2'),(3,'2','4'),(4,'2','3'),(5,'2','1');
/*!40000 ALTER TABLE `Acceso_Etapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accion_Usuario`
--

DROP TABLE IF EXISTS `Accion_Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accion_Usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  `destino` varchar(512) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rol__idx` (`rol`),
  CONSTRAINT `Accion_Usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `Rol` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accion_Usuario`
--

LOCK TABLES `Accion_Usuario` WRITE;
/*!40000 ALTER TABLE `Accion_Usuario` DISABLE KEYS */;
INSERT INTO `Accion_Usuario` VALUES (1,'Acciones','/SPE/acciones_usuario/listar',2),(2,'Mis Pasantias','/SPE/mis_pasantias/listar',1),(3,'Pasantias','/SPE/pasantias/listar',2),(4,'Pasantias','/SPE/pasantias/listar',3);
/*!40000 ALTER TABLE `Accion_Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Actividad`
--

DROP TABLE IF EXISTS `Actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fase` int(11) DEFAULT NULL,
  `descripcion` longtext,
  `semana_inicio` varchar(512) DEFAULT NULL,
  `semana_fin` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fase__idx` (`fase`),
  CONSTRAINT `Actividad_ibfk_1` FOREIGN KEY (`fase`) REFERENCES `Fase` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actividad`
--

LOCK TABLES `Actividad` WRITE;
/*!40000 ALTER TABLE `Actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Area_Laboral`
--

DROP TABLE IF EXISTS `Area_Laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Area_Laboral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Area_Laboral`
--

LOCK TABLES `Area_Laboral` WRITE;
/*!40000 ALTER TABLE `Area_Laboral` DISABLE KEYS */;
INSERT INTO `Area_Laboral` VALUES (1,'Tecnologia','Tecnologia');
/*!40000 ALTER TABLE `Area_Laboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carrera`
--

DROP TABLE IF EXISTS `Carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(512) NOT NULL,
  `nombre` varchar(512) DEFAULT NULL,
  `duracion` varchar(512) NOT NULL,
  `sede` varchar(512) NOT NULL,
  `coordinacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coordinacion__idx` (`coordinacion`),
  CONSTRAINT `Carrera_ibfk_1` FOREIGN KEY (`coordinacion`) REFERENCES `Coordinacion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carrera`
--

LOCK TABLES `Carrera` WRITE;
/*!40000 ALTER TABLE `Carrera` DISABLE KEYS */;
INSERT INTO `Carrera` VALUES (1,'0800','Ingenieria de la Computacion','Larga','Sartenejas',1);
/*!40000 ALTER TABLE `Carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coordinacion`
--

DROP TABLE IF EXISTS `Coordinacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coordinacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  `usbid` varchar(512) DEFAULT NULL,
  `sede` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coordinacion`
--

LOCK TABLES `Coordinacion` WRITE;
/*!40000 ALTER TABLE `Coordinacion` DISABLE KEYS */;
INSERT INTO `Coordinacion` VALUES (1,'Coordinacion de Ciencias de la Computacion','1111','Sartenejas'),(2,'Coordinación de Cooperación Tecnica','123123','Sartenejas');
/*!40000 ALTER TABLE `Coordinacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coordinador`
--

DROP TABLE IF EXISTS `Coordinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coordinador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(512) DEFAULT NULL,
  `carnet` varchar(512) DEFAULT NULL,
  `coordinacion` varchar(512) DEFAULT NULL,
  `correo_Alternativo` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coordinador`
--

LOCK TABLES `Coordinador` WRITE;
/*!40000 ALTER TABLE `Coordinador` DISABLE KEYS */;
INSERT INTO `Coordinador` VALUES (1,'6','10-10330','2','danielarturomt@gmail.com');
/*!40000 ALTER TABLE `Coordinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curriculo`
--

DROP TABLE IF EXISTS `Curriculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Curriculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estudiante` int(11) DEFAULT NULL,
  `electivas` varchar(512) DEFAULT NULL,
  `cursos` varchar(512) DEFAULT NULL,
  `aficiones` varchar(512) DEFAULT NULL,
  `idiomas` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estudiante__idx` (`estudiante`),
  CONSTRAINT `Curriculo_ibfk_1` FOREIGN KEY (`estudiante`) REFERENCES `Estudiante` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curriculo`
--

LOCK TABLES `Curriculo` WRITE;
/*!40000 ALTER TABLE `Curriculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Curriculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dedicacion`
--

DROP TABLE IF EXISTS `Dedicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dedicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dedicacion`
--

LOCK TABLES `Dedicacion` WRITE;
/*!40000 ALTER TABLE `Dedicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dedicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departamento`
--

DROP TABLE IF EXISTS `Departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  `id_division` int(11) NOT NULL,
  `email_dep` varchar(512) DEFAULT NULL,
  `sede` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_division__idx` (`id_division`),
  CONSTRAINT `Departamento_ibfk_1` FOREIGN KEY (`id_division`) REFERENCES `Division` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamento`
--

LOCK TABLES `Departamento` WRITE;
/*!40000 ALTER TABLE `Departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Division`
--

DROP TABLE IF EXISTS `Division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Division`
--

LOCK TABLES `Division` WRITE;
/*!40000 ALTER TABLE `Division` DISABLE KEYS */;
/*!40000 ALTER TABLE `Division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL,
  `area_laboral` int(11) DEFAULT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `direccion_web` varchar(512) DEFAULT NULL,
  `contacto_RRHH` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario__idx` (`usuario`),
  KEY `area_laboral__idx` (`area_laboral`),
  CONSTRAINT `Empresa_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `UsuarioExterno` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Empresa_ibfk_2` FOREIGN KEY (`area_laboral`) REFERENCES `Area_Laboral` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
INSERT INTO `Empresa` VALUES (2,2,1,'asdasd','www.menor.com','daniel@ecorp.com');
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estado`
--

DROP TABLE IF EXISTS `Estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  `Pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Pais__idx` (`Pais`),
  CONSTRAINT `Estado_ibfk_1` FOREIGN KEY (`Pais`) REFERENCES `Pais` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estado`
--

LOCK TABLES `Estado` WRITE;
/*!40000 ALTER TABLE `Estado` DISABLE KEYS */;
INSERT INTO `Estado` VALUES (1,'Aragua',1);
/*!40000 ALTER TABLE `Estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estudiante`
--

DROP TABLE IF EXISTS `Estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL,
  `carnet` varchar(512) DEFAULT NULL,
  `carrera` int(11) DEFAULT NULL,
  `correo_Alternativo` varchar(512) DEFAULT NULL,
  `usuario__tmp` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario__idx` (`usuario`),
  KEY `carrera__idx` (`carrera`),
  CONSTRAINT `Estudiante_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `UsuarioUSB` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Estudiante_ibfk_2` FOREIGN KEY (`carrera`) REFERENCES `Carrera` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estudiante`
--

LOCK TABLES `Estudiante` WRITE;
/*!40000 ALTER TABLE `Estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Etapa`
--

DROP TABLE IF EXISTS `Etapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Etapa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `procedimientos` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Etapa`
--

LOCK TABLES `Etapa` WRITE;
/*!40000 ALTER TABLE `Etapa` DISABLE KEYS */;
INSERT INTO `Etapa` VALUES (1,'Preinscripcion','En las primeras cuatro semanas (semana 1 a semana 4) de cada trimestre académico se llevará a cabo el Proceso de Preinscripción de la Pasantía . Los estudiantes que desean optar a una pasantía deben preinscribirse al trimestre anterior al período de la pasantía a cursar. La preinscripción tendrá carácter obligatorio y el estudiante deberá consignar ante la CCTDS, o ante la CCCE según sea el caso, específicamente al personal de Atención al Estudiante, los siguientes recaudos:','/#'),(2,'Colocacion','Después del proceso de Preinscripción, la sección de Relaciones con la Industria debe iniciar su proceso de búsqueda de pasantías mediante la comunicación con las empresas y la oferta de pasantes para el próximo período.','/#'),(3,'Inscripcion','Durante la semana doce (12) del trimestre anterior a la pasantía y hasta la semana cero (0) del trimestre en el que se cursará la pasantía, se llevará a cabo el Proceso de Inscripción de la misma. Para ello, el estudiante debe descargar de la página web de la CCTDS (www.cctds.dex.usb.ve) los siguientes formularios (de carácter obligatorio)','/#'),(4,'Ejecucion','Por contretar','/#');
/*!40000 ALTER TABLE `Etapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fase`
--

DROP TABLE IF EXISTS `Fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_trabajo` int(11) DEFAULT NULL,
  `titulo` varchar(512) DEFAULT NULL,
  `descripcion` longtext,
  `objetivo_especifico` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_trabajo__idx` (`plan_trabajo`),
  CONSTRAINT `Fase_ibfk_1` FOREIGN KEY (`plan_trabajo`) REFERENCES `Plan_Trabajo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fase`
--

LOCK TABLES `Fase` WRITE;
/*!40000 ALTER TABLE `Fase` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materia`
--

DROP TABLE IF EXISTS `Materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(512) DEFAULT NULL,
  `sede` varchar(512) NOT NULL,
  `tipo` varchar(512) DEFAULT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `duracion` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materia`
--

LOCK TABLES `Materia` WRITE;
/*!40000 ALTER TABLE `Materia` DISABLE KEYS */;
INSERT INTO `Materia` VALUES (1,'EP3420','Sartenejas','Larga','Lograr que el estudiante se integre a las actividades de la empresa o institución y actúe dentro de la misma como un recurso capaz de intervenir en el desarrollo completo de trabajos, tareas o proyectos a nivel profesional, utilizando para ello los conocimientos y la formación de que dispone.','20'),(2,'EP1420','Sartenejas','Corta','En las primeras cuatro semanas (semana 1 a semana 4) de cada trimestre académico se llevará a cabo el Proceso de Preinscripción de la Pasantía . Los estudiantes que desean optar a una pasantía deben preinscribirse al trimestre anterior al período de la pasantía a cursar. La preinscripción tendrá carácter obligatorio y el estudiante deberá consignar ante la CCTDS, o ante la CCCE según sea el caso, específicamente al personal de Atención al Estudiante, los siguientes recaudos:','6');
/*!40000 ALTER TABLE `Materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materia_Periodo`
--

DROP TABLE IF EXISTS `Materia_Periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Materia_Periodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materia` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `materia__idx` (`materia`),
  KEY `periodo__idx` (`periodo`),
  CONSTRAINT `Materia_Periodo_ibfk_1` FOREIGN KEY (`materia`) REFERENCES `Materia` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Materia_Periodo_ibfk_2` FOREIGN KEY (`periodo`) REFERENCES `Periodo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materia_Periodo`
--

LOCK TABLES `Materia_Periodo` WRITE;
/*!40000 ALTER TABLE `Materia_Periodo` DISABLE KEYS */;
INSERT INTO `Materia_Periodo` VALUES (1,1,2),(2,1,3);
/*!40000 ALTER TABLE `Materia_Periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
INSERT INTO `Pais` VALUES (1,'Venezuela');
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pasantia`
--

DROP TABLE IF EXISTS `Pasantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pasantia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(512) DEFAULT NULL,
  `estudiante` int(11) DEFAULT NULL,
  `tutor_academico` int(11) DEFAULT NULL,
  `Tutor_Industrial` int(11) DEFAULT NULL,
  `area_proyecto` varchar(512) DEFAULT NULL,
  `resumen_proyecto` longtext,
  `materia` int(11) DEFAULT NULL,
  `objetivo` varchar(512) DEFAULT NULL,
  `confidencialidad` varchar(512) DEFAULT NULL,
  `status` varchar(512) DEFAULT NULL,
  `etapa` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `fecha_defensa` varchar(512) DEFAULT NULL,
  `fecha_inicio` varchar(512) DEFAULT NULL,
  `fecha_fin` varchar(512) DEFAULT NULL,
  `fecha_tope_jurado` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estudiante__idx` (`estudiante`),
  KEY `tutor_academico__idx` (`tutor_academico`),
  KEY `Tutor_Industrial__idx` (`Tutor_Industrial`),
  KEY `materia__idx` (`materia`),
  KEY `etapa__idx` (`etapa`),
  KEY `periodo__idx` (`periodo`),
  CONSTRAINT `Pasantia_ibfk_1` FOREIGN KEY (`estudiante`) REFERENCES `Estudiante` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Pasantia_ibfk_2` FOREIGN KEY (`tutor_academico`) REFERENCES `Profesor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Pasantia_ibfk_3` FOREIGN KEY (`Tutor_Industrial`) REFERENCES `Tutor_Industrial` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Pasantia_ibfk_4` FOREIGN KEY (`materia`) REFERENCES `Materia` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Pasantia_ibfk_5` FOREIGN KEY (`etapa`) REFERENCES `Etapa` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Pasantia_ibfk_6` FOREIGN KEY (`periodo`) REFERENCES `Periodo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pasantia`
--

LOCK TABLES `Pasantia` WRITE;
/*!40000 ALTER TABLE `Pasantia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pasantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Periodo`
--

DROP TABLE IF EXISTS `Periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Periodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mes_inicio` varchar(512) DEFAULT NULL,
  `mes_final` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Periodo`
--

LOCK TABLES `Periodo` WRITE;
/*!40000 ALTER TABLE `Periodo` DISABLE KEYS */;
INSERT INTO `Periodo` VALUES (2,'Abril','Septiembre'),(3,'Abril','Septiembre'),(4,'Octubre','Enero');
/*!40000 ALTER TABLE `Periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permiso`
--

DROP TABLE IF EXISTS `Permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(512) DEFAULT NULL,
  `pasantia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pasantia__idx` (`pasantia`),
  CONSTRAINT `Permiso_ibfk_1` FOREIGN KEY (`pasantia`) REFERENCES `Pasantia` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permiso`
--

LOCK TABLES `Permiso` WRITE;
/*!40000 ALTER TABLE `Permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plan_Trabajo`
--

DROP TABLE IF EXISTS `Plan_Trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_Trabajo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pasantia` int(11) DEFAULT NULL,
  `objetivo_general` varchar(512) DEFAULT NULL,
  `aprobacion_tutor_academico` int(11) DEFAULT NULL,
  `aprobacion_Tutor_Industrial` int(11) DEFAULT NULL,
  `aprobacion_coordinacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pasantia__idx` (`pasantia`),
  CONSTRAINT `Plan_Trabajo_ibfk_1` FOREIGN KEY (`pasantia`) REFERENCES `Pasantia` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_Trabajo`
--

LOCK TABLES `Plan_Trabajo` WRITE;
/*!40000 ALTER TABLE `Plan_Trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plan_Trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesor`
--

DROP TABLE IF EXISTS `Profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profesor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` int(11) DEFAULT NULL,
  `dedicacion` int(11) DEFAULT NULL,
  `departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria__idx` (`categoria`),
  KEY `dedicacion__idx` (`dedicacion`),
  KEY `departamento__idx` (`departamento`),
  CONSTRAINT `Profesor_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `Categoria` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Profesor_ibfk_2` FOREIGN KEY (`dedicacion`) REFERENCES `Dedicacion` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Profesor_ibfk_3` FOREIGN KEY (`departamento`) REFERENCES `Departamento` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesor`
--

LOCK TABLES `Profesor` WRITE;
/*!40000 ALTER TABLE `Profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Retiro`
--

DROP TABLE IF EXISTS `Retiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Retiro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  `pasantia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pasantia__idx` (`pasantia`),
  CONSTRAINT `Retiro_ibfk_1` FOREIGN KEY (`pasantia`) REFERENCES `Pasantia` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Retiro`
--

LOCK TABLES `Retiro` WRITE;
/*!40000 ALTER TABLE `Retiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Retiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rol`
--

DROP TABLE IF EXISTS `Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rol`
--

LOCK TABLES `Rol` WRITE;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
INSERT INTO `Rol` VALUES (1,'Estudiante'),(2,'Coordinador_CCT'),(3,'Coordinador'),(4,'Invitado');
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tutor_Industrial`
--

DROP TABLE IF EXISTS `Tutor_Industrial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tutor_Industrial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL,
  `apellido` varchar(512) DEFAULT NULL,
  `Empresa` int(11) NOT NULL,
  `profesion` varchar(512) DEFAULT NULL,
  `tipo_documento` varchar(512) DEFAULT NULL,
  `numero_documento` varchar(512) DEFAULT NULL,
  `cargo` varchar(512) DEFAULT NULL,
  `departamento` varchar(512) DEFAULT NULL,
  `universidad` int(11) DEFAULT NULL,
  `comfirmado_Por_Empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario__idx` (`usuario`),
  KEY `Empresa__idx` (`Empresa`),
  KEY `universidad__idx` (`universidad`),
  CONSTRAINT `Tutor_Industrial_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `UsuarioExterno` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Tutor_Industrial_ibfk_2` FOREIGN KEY (`Empresa`) REFERENCES `Empresa` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Tutor_Industrial_ibfk_3` FOREIGN KEY (`universidad`) REFERENCES `Universidad` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tutor_Industrial`
--

LOCK TABLES `Tutor_Industrial` WRITE;
/*!40000 ALTER TABLE `Tutor_Industrial` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tutor_Industrial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Universidad`
--

DROP TABLE IF EXISTS `Universidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Universidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) NOT NULL,
  `id_pais` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pais__idx` (`id_pais`),
  CONSTRAINT `Universidad_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `Pais` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Universidad`
--

LOCK TABLES `Universidad` WRITE;
/*!40000 ALTER TABLE `Universidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Universidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsuarioExterno`
--

DROP TABLE IF EXISTS `UsuarioExterno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsuarioExterno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  `correo` varchar(512) DEFAULT NULL,
  `clave` varchar(512) DEFAULT NULL,
  `pregunta_secreta` longtext,
  `respuesta_secreta` varchar(512) DEFAULT NULL,
  `pais` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `telefono` varchar(512) DEFAULT NULL,
  `direccion` longtext,
  PRIMARY KEY (`id`),
  KEY `pais__idx` (`pais`),
  KEY `estado__idx` (`estado`),
  CONSTRAINT `UsuarioExterno_ibfk_1` FOREIGN KEY (`pais`) REFERENCES `Pais` (`id`) ON DELETE CASCADE,
  CONSTRAINT `UsuarioExterno_ibfk_2` FOREIGN KEY (`estado`) REFERENCES `Estado` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsuarioExterno`
--

LOCK TABLES `UsuarioExterno` WRITE;
/*!40000 ALTER TABLE `UsuarioExterno` DISABLE KEYS */;
INSERT INTO `UsuarioExterno` VALUES (2,'ECorp','ecorp@ecorp.com','Daniel-420','como me llamo?Hay errores en el formulario, por favor comprúebelo. ×\r\n','daniel',1,1,'0414-4742003','cerca');
/*!40000 ALTER TABLE `UsuarioExterno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsuarioRol`
--

DROP TABLE IF EXISTS `UsuarioRol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsuarioRol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario__idx` (`usuario`),
  KEY `rol__idx` (`rol`),
  CONSTRAINT `UsuarioRol_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `UsuarioUSB` (`id`) ON DELETE CASCADE,
  CONSTRAINT `UsuarioRol_ibfk_2` FOREIGN KEY (`rol`) REFERENCES `Rol` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsuarioRol`
--

LOCK TABLES `UsuarioRol` WRITE;
/*!40000 ALTER TABLE `UsuarioRol` DISABLE KEYS */;
/*!40000 ALTER TABLE `UsuarioRol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsuarioUSB`
--

DROP TABLE IF EXISTS `UsuarioUSB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsuarioUSB` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usbid` varchar(512) DEFAULT NULL,
  `nombre` varchar(512) DEFAULT NULL,
  `apellido` varchar(512) DEFAULT NULL,
  `correo` varchar(512) DEFAULT NULL,
  `clave` varchar(512) DEFAULT NULL,
  `tipo_documento` varchar(512) DEFAULT NULL,
  `numero_documento` varchar(512) DEFAULT NULL,
  `telefono` varchar(512) DEFAULT NULL,
  `direcUsuario` longtext,
  `sexo` varchar(512) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rol__idx` (`rol`),
  CONSTRAINT `UsuarioUSB_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `Rol` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsuarioUSB`
--

LOCK TABLES `UsuarioUSB` WRITE;
/*!40000 ALTER TABLE `UsuarioUSB` DISABLE KEYS */;
INSERT INTO `UsuarioUSB` VALUES (6,'10-10330','Andres','Guerrero','danielarturomt@gmail.com','DUYBIMPZEURLPWHNZQMI','CI','23796390','07863250260','Nomada','M',2),(7,'10-10292','Hector Alejandro','Goncalves Pita',NULL,'ISCVJSKUFESHIUYYRCWY','CI','23947885','04128063009','los samanes','M',3),(10,'10-10717','Francisco Javier','Sucre Gonzalez',NULL,'BVIERQAPPDFAPROHMWYV','CI','19564959','04243130932','Caracas','M',1),(19,'10-10195','Alfredo Alejandro','Delgado Lopez',NULL,'EIYMEPEEAQJAMETRQRRF',NULL,NULL,NULL,NULL,NULL,1),(21,'10-10419','Daniel Arturo','Marin Tirado',NULL,'GDGTUNSHZWREEHBVPNZO',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `UsuarioUSB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_cas`
--

DROP TABLE IF EXISTS `auth_cas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_cas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `service` varchar(512) DEFAULT NULL,
  `ticket` varchar(512) DEFAULT NULL,
  `renew` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  CONSTRAINT `auth_cas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_cas`
--

LOCK TABLES `auth_cas` WRITE;
/*!40000 ALTER TABLE `auth_cas` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_cas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_event`
--

DROP TABLE IF EXISTS `auth_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime DEFAULT NULL,
  `client_ip` varchar(512) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `origin` varchar(512) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  CONSTRAINT `auth_event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_event`
--

LOCK TABLES `auth_event` WRITE;
/*!40000 ALTER TABLE `auth_event` DISABLE KEYS */;
INSERT INTO `auth_event` VALUES (2,'2016-05-27 09:30:21','127.0.0.1',NULL,'auth','Group 2 created'),(15,'2016-06-01 15:56:54','127.0.0.1',17,'auth','User 17 Logged-out'),(17,'2016-06-01 16:16:10','127.0.0.1',17,'auth','User 17 Logged-out'),(19,'2016-06-01 18:12:40','127.0.0.1',17,'auth','User 17 Logged-out'),(20,'2016-06-01 18:25:40','127.0.0.1',18,'auth','User 18 Logged-out'),(21,'2016-06-01 18:34:31','127.0.0.1',18,'auth','User 18 Logged-out'),(22,'2016-06-01 18:35:18','127.0.0.1',18,'auth','User 18 Logged-out'),(23,'2016-06-01 18:38:52','127.0.0.1',17,'auth','User 17 Logged-out'),(24,'2016-06-01 19:00:57','127.0.0.1',18,'auth','User 18 Logged-out'),(26,'2016-06-04 15:15:29','127.0.0.1',15,'auth','User 15 Logged-out'),(28,'2016-06-04 17:01:51','127.0.0.1',15,'auth','User 15 Logged-out'),(29,'2016-06-04 17:10:25','127.0.0.1',15,'auth','User 15 Logged-out'),(30,'2016-06-04 17:11:50','127.0.0.1',18,'auth','User 18 Logged-out'),(31,'2016-06-04 17:12:05','127.0.0.1',17,'auth','User 17 Logged-out'),(33,'2016-06-08 19:12:56','127.0.0.1',28,'auth','User 28 Logged-out');
/*!40000 ALTER TABLE `auth_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(512) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'user_12','');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_membership`
--

DROP TABLE IF EXISTS `auth_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  KEY `group_id__idx` (`group_id`),
  CONSTRAINT `auth_membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_membership_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_membership`
--

LOCK TABLES `auth_membership` WRITE;
/*!40000 ALTER TABLE `auth_membership` DISABLE KEYS */;
INSERT INTO `auth_membership` VALUES (2,12,2);
/*!40000 ALTER TABLE `auth_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `table_name` varchar(512) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id__idx` (`group_id`),
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `registration_key` varchar(512) DEFAULT NULL,
  `reset_password_key` varchar(512) DEFAULT NULL,
  `registration_id` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (12,'ECorp','','ecorp@ecorp.com',NULL,'pbkdf2(1000,20,sha512)$97174ea4eb4f8afe$e9fbc0bd7b1a360595eab3cca5def45710623fdb','','','ecorp@ecorp.com'),(15,'Francisco Javier','Sucre Gonzalez','','10-10717','pbkdf2(1000,20,sha512)$82b24e12016a9e42$c1fe2000ebbc88c0965311af207f5bb14e5ce11c','','',''),(17,'Andres Miguel','Guerrero Silva','','10-10330','pbkdf2(1000,20,sha512)$b2d42a756d15d96f$7a40d5b9a7ead64884570197bf397292ad4f4f89','','',''),(18,'Hector Alejandro','Goncalves Pita','','10-10292','pbkdf2(1000,20,sha512)$adbc2d95101fca17$c50bec3cdbc55a139eab2705780dff2a6f34de24','','',''),(21,'Francisco Javier','Sucre Gonzalez','','10-10717','pbkdf2(1000,20,sha512)$bebf41709373c74a$93f106ce8f0d000b5e9430e530ea8e02122a9075','','',''),(28,'Alfredo Alejandro','Delgado Lopez','','10-10195','pbkdf2(1000,20,sha512)$90ba03c768af63bd$da9c56b930f8c376e7411b77ac7fbbce99ff5c27','','',''),(30,'Daniel Arturo','Marin Tirado','','10-10419','pbkdf2(1000,20,sha512)$a9a74b56d80bcd69$d98d4fe45c9b2968a1d15de4d082eb556cc26df4','','','');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correo_por_verificar`
--

DROP TABLE IF EXISTS `correo_por_verificar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correo_por_verificar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(512) NOT NULL,
  `codigo` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correo_por_verificar`
--

LOCK TABLES `correo_por_verificar` WRITE;
/*!40000 ALTER TABLE `correo_por_verificar` DISABLE KEYS */;
INSERT INTO `correo_por_verificar` VALUES (1,'frank91frank@gmail.com','9oVZEJ0'),(2,'frank91frank@gmail.com','r6cMm7nscAa'),(3,'frank91frank@gmail.com','TNXPO');
/*!40000 ALTER TABLE `correo_por_verificar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-08 19:50:21
