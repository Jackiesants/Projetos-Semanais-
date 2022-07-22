-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: resilia_banco
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `cpf` varchar(14) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `turmas_id` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `turmas_id` (`turmas_id`),
  CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`turmas_id`) REFERENCES `turmas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES ('120.120.120-38','Daniel Pereira','2000-03-02',1),('120.120.120-39','Roger Nunes','2000-04-02',1),('120.120.120-40','Alissa Hugo','2000-05-02',2),('120.120.120-41','Vitor Kley','2000-06-02',2),('120.120.120-42','Amy Winehouse','2000-07-02',2),('120.120.120-43','Lucas Lucco Jovem','2000-08-02',3),('120.120.120-44','Pedro Lotto','2000-09-02',4),('120.120.120-45','Agatha Cristinna','2000-10-02',4);
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` int NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'React II','presencial'),(2,'React I','presencial'),(3,'Javascript I','EAD'),(4,'Javascript II','EAD');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas` (
  `id` int NOT NULL,
  `link_repositorio` varchar(2000) DEFAULT NULL,
  `modulo` int DEFAULT NULL,
  `conceito` varchar(25) DEFAULT NULL,
  `aluno_cpf` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_cpf` (`aluno_cpf`),
  CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`aluno_cpf`) REFERENCES `alunos` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` VALUES (1,'www.repo.com.br',1,'ainda não está pronto','120.120.120-38'),(2,'www.repo1.com.br',2,'ainda não está pronto','120.120.120-38'),(3,'www.repo2.com.br',1,'ainda não está pronto','120.120.120-39'),(4,'www.repo3.com.br',1,'chegando la','120.120.120-40'),(5,'www.repo4.com.br',1,'pronto','120.120.120-41'),(6,'www.repo5.com.br',2,'mais que pronto','120.120.120-41'),(7,'www.repo6.com.br',3,'mais que pronto','120.120.120-41'),(8,'www.repo7.com.br',4,'mais que pronto','120.120.120-42'),(9,'www.repo8.com.br',1,'pronto','120.120.120-43'),(10,'www.repo9.com.br',1,'mais que pronto','120.120.120-44'),(11,'www.repo10.com.br',1,'ainda não está pronto','120.120.120-45');
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmas`
--

DROP TABLE IF EXISTS `turmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turmas` (
  `id` int NOT NULL,
  `numero` int DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cursos_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cursos_id` (`cursos_id`),
  CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmas`
--

LOCK TABLES `turmas` WRITE;
/*!40000 ALTER TABLE `turmas` DISABLE KEYS */;
INSERT INTO `turmas` VALUES (1,1,'sirius',1),(2,2,'eridano',2),(3,3,'fênix',3),(4,4,'andrômeda',4);
/*!40000 ALTER TABLE `turmas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-22 20:30:21
