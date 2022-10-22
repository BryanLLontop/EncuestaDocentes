CREATE DATABASE  IF NOT EXISTS `desempeño_docentes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `desempeño_docentes`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: desempeño_docentes
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int NOT NULL,
  `nombre_curso` varchar(30) NOT NULL,
  `ciclo` varchar(3) NOT NULL,
  `docente_codigo_docente` varchar(7) NOT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `curso_docente_fk` (`docente_codigo_docente`),
  CONSTRAINT `curso_docente_fk` FOREIGN KEY (`docente_codigo_docente`) REFERENCES `docente` (`codigo_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'ALGEBRA LINEAL ','I','120165K'),(2,'INTRODUCCION A LA IS ','I','102568A'),(3,'TALLER DE COMPUTACION','II','120641H'),(4,'ALGORITMOS','III','102568A'),(5,'DIBUJO DE INGENIERIA','III','105064F'),(6,'ECUACIONES DIFERENCIALES','III','120165K'),(7,'BASE DE DATOS','IV','195613B'),(8,'LENGUAJE DE PROGRAMACION','IV','150620H'),(9,'INVESTIGACION DE OPERACIONES I','IV','152031F'),(10,'INGENIERIA DE SOFTWARE','V','141862J'),(11,'TALLER DE PROGRAMACION','V','162041D'),(12,'INGENIERIA DE LA INFORMACION','VI','152321H'),(13,'CALCULO DIFERENCIAL ','I','163201A'),(14,'MATEMATICA DISCRETA','I','195613B'),(15,'TECNICAS DE COMUNICACION','I','201563G'),(16,'CONTABILIDAD GERENCIAL','III','100130L'),(17,'FISICA I','III','122300I'),(18,'ADMINISTRACION','IV','114105J'),(19,'MATEMATICA APLICADA','IV','116002G'),(20,'CALCULO INTEGRAL ','II','120165K'),(21,'ECONOMIA','II','114105J'),(22,'GEOMETRIA ANALITICA','II','195613B'),(23,'TECNICAS DEL TRABAJO','II','111021Y'),(24,'COSTOS Y PRESUPUESTOS','V','114105J'),(25,'INVESTIGACION DE OPERACION II','V','152031F'),(26,'ORGANIZACION Y METODOS ','V','201563G'),(27,'FUNDAMENTOS DE REDES','VI','100233G'),(28,'SISTEMAS CONTABLES','VI','125463L'),(29,'SISTEMAS PRODUCTIVOS','VI','122031Q'),(30,'SISTEMICA','VI','131120E');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_estudiante`
--

DROP TABLE IF EXISTS `curso_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_estudiante` (
  `id_cursoestudiante` int NOT NULL,
  `estudiante_codigo_estudiante` varchar(7) NOT NULL,
  `curso_id_curso` int NOT NULL,
  PRIMARY KEY (`id_cursoestudiante`),
  KEY `curso_estudiante_curso_fk` (`curso_id_curso`),
  KEY `curso_estudiante_estudiante_fk` (`estudiante_codigo_estudiante`),
  CONSTRAINT `curso_estudiante_curso_fk` FOREIGN KEY (`curso_id_curso`) REFERENCES `curso` (`id_curso`),
  CONSTRAINT `curso_estudiante_estudiante_fk` FOREIGN KEY (`estudiante_codigo_estudiante`) REFERENCES `estudiante` (`codigo_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_estudiante`
--

LOCK TABLES `curso_estudiante` WRITE;
/*!40000 ALTER TABLE `curso_estudiante` DISABLE KEYS */;
INSERT INTO `curso_estudiante` VALUES (1,'103261P',1),(2,'103261P',2),(3,'103261P',13),(4,'103261P',14),(5,'103261P',15),(6,'103691T',3),(7,'103691T',20),(8,'103691T',21),(9,'103691T',22),(10,'103691T',23),(11,'165204R',4),(12,'165204R',5),(13,'165204R',6),(14,'165204R',16),(15,'165204R',17),(16,'104234A',7),(17,'104234A',8),(18,'104234A',9),(19,'104234A',18),(20,'104234A',19),(21,'165230G',10),(22,'165230G',11),(23,'165230G',24),(24,'165230G',25),(25,'165230G',26),(26,'185575F',12),(27,'185575F',27),(28,'185575F',28),(29,'185575F',29),(30,'185575F',30),(31,'185100H',12),(32,'185100H',27),(33,'185100H',28),(34,'185100H',29),(35,'185100H',30);
/*!40000 ALTER TABLE `curso_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `codigo_docente` varchar(7) NOT NULL,
  `nombre_docente` varchar(30) NOT NULL,
  `apellido_docente` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES ('100130L','RAFAEL','CHAFLOQUE GASTULO '),('100233G','JUAN ELIAS ','VILLEGAS CUBAS'),('102568A','ERNESTO KARLO','CELI AREVALO'),('105064F','ROBERTO CARLOS ','ARTEAGA LORA'),('111021Y','JOSE LUIS','RODAS CABANILLAS'),('114105J','GUADALUPE ROCIO','COLTER APAZA'),('116002G','WILLIAM WILMER','CORONADO JUAREZ'),('120165K','NANCY','NIÑO MONTERO'),('120641H','JESUS BERNARDO','OLAVARRIA PAZ'),('122031Q','SHEYLA VANNINA','PEREZ RIOJAS'),('122300I','JESUS LUZGARDO','LOZANO ALVARADO'),('125463L','LUIS ALBERTO','OTAKE OYAMA'),('131120E','ROBERTO CARLOS','ARTEAGA LORA'),('141862J','LUIS ALBERTO','DAVILA HURTADO'),('150620H','OMAR WILTON','SAAVEDRA SALAZAR'),('152031F','GAVINO MARCELO','LOYAGA ORBEGOSO'),('152321H','CESAR AUGUSTO','GUZMAN VALLE'),('162041D','GILBERTO MARTIN','AMPUERO PASCO'),('163201A','AMADO','MALCA VILLALOBOS'),('195613B','LUIS ALBERTO','LLONTOP CUMPA'),('201563G','REGIS JORGE',' DIAZ PLAZA');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escuela`
--

DROP TABLE IF EXISTS `escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escuela` (
  `id_escuela` int NOT NULL,
  `nombre_escuela` varchar(30) NOT NULL,
  `facultad_id_facultad` int NOT NULL,
  PRIMARY KEY (`id_escuela`),
  KEY `escuela_facultad_fk` (`facultad_id_facultad`),
  CONSTRAINT `escuela_facultad_fk` FOREIGN KEY (`facultad_id_facultad`) REFERENCES `facultad` (`id_facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuela`
--

LOCK TABLES `escuela` WRITE;
/*!40000 ALTER TABLE `escuela` DISABLE KEYS */;
INSERT INTO `escuela` VALUES (1,'INGENIERÍA DE SISTEMAS',1),(2,'INGENIERÍA CIVIL',1),(3,'ARQUITECTURA',1),(4,'INGENIERÍA MECANICA',4),(5,'ADMINISTRACIÓN',3),(6,'CONTABILIDAD',3),(7,'ECONOMÍA',3);
/*!40000 ALTER TABLE `escuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `codigo_estudiante` varchar(7) NOT NULL,
  `nombres_estudiante` varchar(30) NOT NULL,
  `apellidos_estudiante` varchar(30) NOT NULL,
  `escuela_id_escuela` int NOT NULL,
  `usuario_id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`codigo_estudiante`),
  KEY `estudiante_escuela_fk` (`escuela_id_escuela`),
  KEY `usuario_id_usuario_fk_idx` (`usuario_id_usuario`),
  CONSTRAINT `estudiante_escuela_fk` FOREIGN KEY (`escuela_id_escuela`) REFERENCES `escuela` (`id_escuela`),
  CONSTRAINT `usuario_id_usuario1_fk` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES ('100320W','NANCY MIRELLA','CAJUSOL ALVARADO',6,1),('102512H','JEFERSON FABIAN','YLMA CAJUSOL',4,2),('103120J','JESUS PIERO','CHAPOÑAN ZEÑA',2,3),('103261P','JHAN MICHAEL','GARCIA CAMPOVERDE',1,4),('103691T','LUIS ENRIQUE','AREVALO PINTADO',1,5),('104234A','XIOMARA ALEXAIDA','PAREDES RUFASTO',1,6),('105620Q','DONIDIO ALEXANDER','CHAPOÑAN SARMIENTO',4,7),('120346R','ARIAM ALBERTO','CASTRO URBINA',7,8),('124361G','DEISSY MARIBEL','CHAVESTA UYPAN',5,9),('125320R','RONALD JOSE','SANDOVAL DAMIAN',3,10),('126410L','PEDRO LUIS','BANCES MONTALVAN',2,11),('152012A','CRISTHIAN FRANK','FARROÑAN FERROÑAN',5,12),('165204R','ALDO ALEXANDER','TORRES CUMPA',1,13),('165230G','JUAN JOSE','ANTON SILVA',1,14),('185100H','BRYAN JOSE','LLONTOP CHAPOÑAN',1,15),('185575F','ZAIRA NICOLE','BANCES CARRASCO',1,16);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultad` (
  `id_facultad` int NOT NULL,
  `nombre_facultad` varchar(20) NOT NULL,
  PRIMARY KEY (`id_facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'FICSA'),(2,'FIQUIA'),(3,'FACEAC'),(4,'FIME');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultados_desempeño_docente`
--

DROP TABLE IF EXISTS `resultados_desempeño_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultados_desempeño_docente` (
  `id_resultados` int NOT NULL AUTO_INCREMENT,
  `puntaje` double NOT NULL,
  `curso_id_curso` int NOT NULL,
  `estudiante_codigo_estudiante` varchar(7) NOT NULL,
  PRIMARY KEY (`id_resultados`),
  KEY `resultados_desempeño_docente_curso_fk` (`curso_id_curso`),
  KEY `estudiante_codigo_estudiante_fk_idx` (`estudiante_codigo_estudiante`),
  CONSTRAINT `estudiante_codigo_estudiante_fk` FOREIGN KEY (`estudiante_codigo_estudiante`) REFERENCES `estudiante` (`codigo_estudiante`),
  CONSTRAINT `resultados_desempeño_docente_curso_fk` FOREIGN KEY (`curso_id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados_desempeño_docente`
--

LOCK TABLES `resultados_desempeño_docente` WRITE;
/*!40000 ALTER TABLE `resultados_desempeño_docente` DISABLE KEYS */;
INSERT INTO `resultados_desempeño_docente` VALUES (1,16,20,'103691T'),(2,20,21,'103691T'),(3,18,30,'185100H'),(4,12,30,'185575F');
/*!40000 ALTER TABLE `resultados_desempeño_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'100320W','@100320W','estudiante'),(2,'102512H','@102512H','estudiante'),(3,'103120J','@103120J','estudiante'),(4,'103261P','@103261P','estudiante'),(5,'103691T','@103691T','estudiante'),(6,'104234A','@104234A','estudiante'),(7,'105620Q','@105620Q','estudiante'),(8,'120346R','@120346R','estudiante'),(9,'124361G','@124361G','estudiante'),(10,'125320R','@125320R','estudiante'),(11,'126410L','@126410L','estudiante'),(12,'152012A','@152012A','estudiante'),(13,'165204R','@165204R','estudiante'),(14,'165230G','@165230G','estudiante'),(15,'185100H','@185100H','estudiante'),(16,'185575F','@185575F','estudiante'),(17,'100100A','@100100A','director');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'desempeño_docentes'
--
/*!50003 DROP PROCEDURE IF EXISTS `BUSCAR_ESTUDIANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_ESTUDIANTE`(idusuario1 int)
BEGIN
SELECT E.codigo_estudiante, E.nombres_estudiante, E.apellidos_estudiante, E.escuela_id_escuela, S.nombre_escuela,
E.usuario_id_usuario  FROM estudiante E inner join escuela S on
S.id_escuela = E.escuela_id_escuela
WHERE E.usuario_id_usuario=idusuario1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BUSCAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_USUARIO`(usuario1 varchar(20), password1 varchar(20))
BEGIN
SELECT * FROM usuario WHERE usuario=usuario1 and password=password1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONSULT_CURSO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CONSULT_CURSO`(idcurso int)
BEGIN
SELECT C.id_curso, C.nombre_curso, C.ciclo, C.docente_codigo_docente, 
D.nombre_docente, D.apellido_docente FROM curso C inner join docente D on
D.codigo_docente=C.docente_codigo_docente
WHERE C.id_curso=idcurso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONSULT_DOCENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CONSULT_DOCENTE`(codigo varchar(7))
BEGIN
SELECT*FROM docente where codigo_docente=codigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONSULT_ESTUDIANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CONSULT_ESTUDIANTE`(codigo varchar(7))
BEGIN
SELECT E.codigo_estudiante, E.nombres_estudiante, E.apellidos_estudiante, E.escuela_id_escuela, S.nombre_escuela,
E.usuario_id_usuario  FROM estudiante E inner join escuela S on
S.id_escuela = E.escuela_id_escuela
WHERE E.codigo_estudiante=codigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONSULT_RESULTADOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CONSULT_RESULTADOS`(codigoe varchar(7),curso int)
BEGIN
SELECT * FROM resultados_desempeño_docente WHERE estudiante_codigo_estudiante=codigoe and curso_id_curso=curso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CURSOS_DOCENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CURSOS_DOCENTE`(codigo_docente varchar(7))
BEGIN
SELECT C.id_curso, C.nombre_curso, C.ciclo, C.docente_codigo_docente, 
D.nombre_docente, D.apellido_docente FROM curso C inner join docente D on
D.codigo_docente=C.docente_codigo_docente
WHERE C.docente_codigo_docente=codigo_docente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CURSOS_ESTUDIANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CURSOS_ESTUDIANTE`(codigo_estudiante varchar(7))
BEGIN
SELECT A.id_cursoestudiante, A.estudiante_codigo_estudiante, A.curso_id_curso, 
C.nombre_curso, C.ciclo, C.docente_codigo_docente, D.nombre_docente, D.apellido_docente 
FROM curso_estudiante A inner join curso C on 
C.id_curso=A.curso_id_curso inner join docente D on C.docente_codigo_docente=D.codigo_docente
WHERE A.estudiante_codigo_estudiante = codigo_estudiante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `READ_CURSO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `READ_CURSO`()
BEGIN
SELECT C.id_curso, C.nombre_curso, C.ciclo, C.docente_codigo_docente, 
D.nombre_docente, D.apellido_docente FROM curso C inner join docente D on
D.codigo_docente=C.docente_codigo_docente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `READ_Docente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `READ_Docente`()
BEGIN
SELECT * FROM docente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `READ_Estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `READ_Estudiante`()
BEGIN
SELECT E.codigo_estudiante, E.nombres_estudiante, E.apellidos_estudiante, E.escuela_id_escuela, S.nombre_escuela,
E.usuario_id_usuario  FROM estudiante E inner join escuela S on
S.id_escuela = E.escuela_id_escuela;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RESULTADOS_CURSO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RESULTADOS_CURSO`(curso int)
BEGIN
SELECT * FROM resultados_desempeño_docente WHERE curso_id_curso=curso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SAVE_RESULT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SAVE_RESULT`(puntaje1 double, curso int, codigo_e varchar(7))
BEGIN
INSERT INTO resultados_desempeño_docente(puntaje, curso_id_curso, estudiante_codigo_estudiante) 
VALUES(puntaje1, curso, codigo_e);
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

-- Dump completed on 2022-10-22 13:54:33
