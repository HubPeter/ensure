-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rmms
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 省',7,'add_province'),(20,'Can change 省',7,'change_province'),(21,'Can delete 省',7,'delete_province'),(22,'Can add 城市',8,'add_city'),(23,'Can change 城市',8,'change_city'),(24,'Can delete 城市',8,'delete_city'),(25,'Can add 仓库',9,'add_store'),(26,'Can change 仓库',9,'change_store'),(27,'Can delete 仓库',9,'delete_store'),(28,'Can add 灾害类型',10,'add_disasterspecies'),(29,'Can change 灾害类型',10,'change_disasterspecies'),(30,'Can delete 灾害类型',10,'delete_disasterspecies'),(31,'Can add 灾害',11,'add_disaster'),(32,'Can change 灾害',11,'change_disaster'),(33,'Can delete 灾害',11,'delete_disaster'),(34,'Can add 物资一级分类',12,'add_category1'),(35,'Can change 物资一级分类',12,'change_category1'),(36,'Can delete 物资一级分类',12,'delete_category1'),(37,'Can add 物资二级分类',13,'add_category2'),(38,'Can change 物资二级分类',13,'change_category2'),(39,'Can delete 物资二级分类',13,'delete_category2'),(40,'Can add 物资三级分类',14,'add_category3'),(41,'Can change 物资三级分类',14,'change_category3'),(42,'Can delete 物资三级分类',14,'delete_category3'),(43,'Can add 物资需求量公式',15,'add_formula'),(44,'Can change 物资需求量公式',15,'change_formula'),(45,'Can delete 物资需求量公式',15,'delete_formula'),(46,'Can add 运输方式',16,'add_transportway'),(47,'Can change 运输方式',16,'change_transportway'),(48,'Can delete 运输方式',16,'delete_transportway'),(49,'Can add 物资筹措方式',17,'add_sourceway'),(50,'Can change 物资筹措方式',17,'change_sourceway'),(51,'Can delete 物资筹措方式',17,'delete_sourceway'),(52,'Can add 物资',18,'add_material'),(53,'Can change 物资',18,'change_material'),(54,'Can delete 物资',18,'delete_material'),(55,'Can add 物资存储状况',19,'add_materialstore'),(56,'Can change 物资存储状况',19,'change_materialstore'),(57,'Can delete 物资存储状况',19,'delete_materialstore'),(58,'Can add 应急响应阶段',20,'add_rescuestage'),(59,'Can change 应急响应阶段',20,'change_rescuestage'),(60,'Can delete 应急响应阶段',20,'delete_rescuestage');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$zJECGSIiYQjB$C/W/ld7KqfT+I4QegVH88Zpf/8FYV2RNMgp2PuR79Kk=','2014-08-16 08:24:35',1,'admin','','','admin@rmms.com',1,1,'2014-08-09 10:21:08');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-08-09 10:22:36',1,7,'1','云南',1,''),(2,'2014-08-09 10:23:53',1,9,'1','昆明仓库',1,''),(3,'2014-08-09 10:24:17',1,9,'2','大理仓库',1,''),(4,'2014-08-09 10:24:32',1,9,'3','昭通仓库',1,''),(5,'2014-08-09 10:24:52',1,10,'1','地震',1,''),(6,'2014-08-09 10:26:48',1,11,'1','鲁甸地震',1,''),(7,'2014-08-09 11:37:20',1,12,'1','生活保障类',1,''),(8,'2014-08-09 11:37:38',1,13,'1','饮食饮水类',1,''),(9,'2014-08-09 11:37:56',1,14,'1','饮用水',1,''),(10,'2014-08-09 11:38:26',1,15,'1','0.02*灾区总人口',1,''),(11,'2014-08-09 11:38:32',1,15,'2','地区系数*2*灾区总人口*10',1,''),(12,'2014-08-09 11:38:54',1,16,'1','铁路运输',1,''),(13,'2014-08-09 11:40:39',1,16,'2','公路运输',1,''),(14,'2014-08-09 11:43:17',1,18,'1','瓶装水',1,''),(15,'2014-08-09 11:44:09',1,18,'2','牛奶',1,''),(16,'2014-08-09 11:45:21',1,17,'1','政府储备',1,''),(17,'2014-08-09 11:45:31',1,17,'2','企业储备',1,''),(18,'2014-08-09 11:45:50',1,17,'3','社会捐助中心',1,''),(19,'2014-08-16 08:53:04',1,19,'5','瓶装水',1,''),(20,'2014-08-16 09:41:59',1,19,'6','瓶装水',1,''),(21,'2014-08-16 09:42:23',1,19,'7','牛奶',1,''),(22,'2014-08-16 09:42:41',1,19,'8','牛奶',1,''),(23,'2014-08-16 09:43:17',1,19,'9','牛奶',1,''),(24,'2014-08-17 03:18:30',1,20,'1','应急启动阶段',1,''),(25,'2014-08-17 03:19:33',1,20,'2','应急救援阶段',1,''),(26,'2014-08-17 03:19:43',1,20,'3','应急恢复阶段',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'省','rmms','province'),(8,'城市','rmms','city'),(9,'仓库','rmms','store'),(10,'灾害类型','rmms','disasterspecies'),(11,'灾害','rmms','disaster'),(12,'物资一级分类','rmms','category1'),(13,'物资二级分类','rmms','category2'),(14,'物资三级分类','rmms','category3'),(15,'物资需求量公式','rmms','formula'),(16,'运输方式','rmms','transportway'),(17,'物资筹措方式','rmms','sourceway'),(18,'物资','rmms','material'),(19,'物资存储状况','rmms','materialstore'),(20,'应急响应阶段','rmms','rescuestage');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('m16ng9638fc8wippe6i7dm0i7unq9hs5','YzIzNWVmNGMyZDUyMjMxN2QxOWIzMDEzMzJiYmZlNzExYTUwOTZkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-08-23 10:21:38'),('mzppwaea74z2xsszsuvdstggon3sq4l3','YzIzNWVmNGMyZDUyMjMxN2QxOWIzMDEzMzJiYmZlNzExYTUwOTZkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-08-30 08:24:35');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_category1`
--

DROP TABLE IF EXISTS `rmms_category1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_category1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_category1`
--

LOCK TABLES `rmms_category1` WRITE;
/*!40000 ALTER TABLE `rmms_category1` DISABLE KEYS */;
INSERT INTO `rmms_category1` VALUES (1,'生活保障类');
/*!40000 ALTER TABLE `rmms_category1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_category2`
--

DROP TABLE IF EXISTS `rmms_category2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_category2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `super_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `rmms_category2_b1f8be54` (`super_category_id`),
  CONSTRAINT `super_category_id_refs_id_26b283c5` FOREIGN KEY (`super_category_id`) REFERENCES `rmms_category1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_category2`
--

LOCK TABLES `rmms_category2` WRITE;
/*!40000 ALTER TABLE `rmms_category2` DISABLE KEYS */;
INSERT INTO `rmms_category2` VALUES (1,'饮食饮水类',1);
/*!40000 ALTER TABLE `rmms_category2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_category3`
--

DROP TABLE IF EXISTS `rmms_category3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_category3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `super_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `rmms_category3_b1f8be54` (`super_category_id`),
  CONSTRAINT `super_category_id_refs_id_bf9d5a47` FOREIGN KEY (`super_category_id`) REFERENCES `rmms_category2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_category3`
--

LOCK TABLES `rmms_category3` WRITE;
/*!40000 ALTER TABLE `rmms_category3` DISABLE KEYS */;
INSERT INTO `rmms_category3` VALUES (1,'饮用水',1);
/*!40000 ALTER TABLE `rmms_category3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_city`
--

DROP TABLE IF EXISTS `rmms_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `province_id` int(11) NOT NULL,
  `population` int(11) NOT NULL,
  `timezone` int(11) NOT NULL,
  `area_factor` int(11) NOT NULL,
  `density_level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`province_id`),
  KEY `rmms_city_35b8c010` (`province_id`),
  CONSTRAINT `province_id_refs_id_6cc22c95` FOREIGN KEY (`province_id`) REFERENCES `rmms_province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_city`
--

LOCK TABLES `rmms_city` WRITE;
/*!40000 ALTER TABLE `rmms_city` DISABLE KEYS */;
INSERT INTO `rmms_city` VALUES (1,'昆明',1,5140000,8,4,4),(2,'大理',1,3000000,8,5,3),(3,'昭通',1,7897903,8,5,5);
/*!40000 ALTER TABLE `rmms_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_disaster`
--

DROP TABLE IF EXISTS `rmms_disaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_disaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  `species_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `epicentre` varchar(100) NOT NULL,
  `epicentre_depth` int(11) NOT NULL,
  `occur_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rmms_disaster_b376980e` (`city_id`),
  KEY `rmms_disaster_e1800d51` (`species_id`),
  CONSTRAINT `city_id_refs_id_20f86a83` FOREIGN KEY (`city_id`) REFERENCES `rmms_city` (`id`),
  CONSTRAINT `species_id_refs_id_9b9049ba` FOREIGN KEY (`species_id`) REFERENCES `rmms_disasterspecies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_disaster`
--

LOCK TABLES `rmms_disaster` WRITE;
/*!40000 ALTER TABLE `rmms_disaster` DISABLE KEYS */;
INSERT INTO `rmms_disaster` VALUES (1,'鲁甸地震',3,1,5,'云南省昭通市鲁甸',1242,'2014-07-30');
/*!40000 ALTER TABLE `rmms_disaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_disasterspecies`
--

DROP TABLE IF EXISTS `rmms_disasterspecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_disasterspecies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_disasterspecies`
--

LOCK TABLES `rmms_disasterspecies` WRITE;
/*!40000 ALTER TABLE `rmms_disasterspecies` DISABLE KEYS */;
INSERT INTO `rmms_disasterspecies` VALUES (1,'地震');
/*!40000 ALTER TABLE `rmms_disasterspecies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_formula`
--

DROP TABLE IF EXISTS `rmms_formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_formula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formula` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `formula` (`formula`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_formula`
--

LOCK TABLES `rmms_formula` WRITE;
/*!40000 ALTER TABLE `rmms_formula` DISABLE KEYS */;
INSERT INTO `rmms_formula` VALUES (1,'0.02*灾区总人口'),(2,'地区系数*2*灾区总人口*10');
/*!40000 ALTER TABLE `rmms_formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_material`
--

DROP TABLE IF EXISTS `rmms_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `amountunit` varchar(10) NOT NULL,
  `shelf_life` int(11) NOT NULL,
  `formula_id` int(11) NOT NULL,
  `transport_way_id` int(11) NOT NULL,
  `require_amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `rmms_material_6f33f001` (`category_id`),
  KEY `rmms_material_a8c33650` (`formula_id`),
  KEY `rmms_material_c7468d2d` (`transport_way_id`),
  CONSTRAINT `category_id_refs_id_8f1552be` FOREIGN KEY (`category_id`) REFERENCES `rmms_category3` (`id`),
  CONSTRAINT `formula_id_refs_id_65d124a8` FOREIGN KEY (`formula_id`) REFERENCES `rmms_formula` (`id`),
  CONSTRAINT `transport_way_id_refs_id_615d3408` FOREIGN KEY (`transport_way_id`) REFERENCES `rmms_transportway` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_material`
--

LOCK TABLES `rmms_material` WRITE;
/*!40000 ALTER TABLE `rmms_material` DISABLE KEYS */;
INSERT INTO `rmms_material` VALUES (1,'瓶装水',1,'升',12,2,2,3427),(2,'牛奶',1,'升',2,1,1,0);
/*!40000 ALTER TABLE `rmms_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_materialstore`
--

DROP TABLE IF EXISTS `rmms_materialstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_materialstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `production_date` date NOT NULL,
  `source_way_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_id` (`name_id`,`store_id`),
  KEY `rmms_materialstore_4da47e07` (`name_id`),
  KEY `rmms_materialstore_c25aaacd` (`store_id`),
  KEY `rmms_materialstore_c865a813` (`source_way_id`),
  CONSTRAINT `name_id_refs_id_f0eab9e6` FOREIGN KEY (`name_id`) REFERENCES `rmms_material` (`id`),
  CONSTRAINT `source_way_id_refs_id_1e1659f7` FOREIGN KEY (`source_way_id`) REFERENCES `rmms_sourceway` (`id`),
  CONSTRAINT `store_id_refs_id_0999e4e0` FOREIGN KEY (`store_id`) REFERENCES `rmms_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_materialstore`
--

LOCK TABLES `rmms_materialstore` WRITE;
/*!40000 ALTER TABLE `rmms_materialstore` DISABLE KEYS */;
INSERT INTO `rmms_materialstore` VALUES (5,1,1,6575,'2014-07-01',2),(6,1,2,8000,'2014-07-01',2),(7,2,3,565,'2014-08-16',2),(8,2,2,123,'2014-07-01',2),(9,2,1,21,'2014-06-01',2);
/*!40000 ALTER TABLE `rmms_materialstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_province`
--

DROP TABLE IF EXISTS `rmms_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_province`
--

LOCK TABLES `rmms_province` WRITE;
/*!40000 ALTER TABLE `rmms_province` DISABLE KEYS */;
INSERT INTO `rmms_province` VALUES (1,'云南');
/*!40000 ALTER TABLE `rmms_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_rescuestage`
--

DROP TABLE IF EXISTS `rmms_rescuestage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_rescuestage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_rescuestage`
--

LOCK TABLES `rmms_rescuestage` WRITE;
/*!40000 ALTER TABLE `rmms_rescuestage` DISABLE KEYS */;
INSERT INTO `rmms_rescuestage` VALUES (1,'应急启动阶段'),(3,'应急恢复阶段'),(2,'应急救援阶段');
/*!40000 ALTER TABLE `rmms_rescuestage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_rescuestage_materials`
--

DROP TABLE IF EXISTS `rmms_rescuestage_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_rescuestage_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rescuestage_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rescuestage_id` (`rescuestage_id`,`material_id`),
  KEY `rmms_rescuestage_materials_bd93e901` (`rescuestage_id`),
  KEY `rmms_rescuestage_materials_f6ab4be3` (`material_id`),
  CONSTRAINT `material_id_refs_id_796c38c4` FOREIGN KEY (`material_id`) REFERENCES `rmms_material` (`id`),
  CONSTRAINT `rescuestage_id_refs_id_762160e3` FOREIGN KEY (`rescuestage_id`) REFERENCES `rmms_rescuestage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_rescuestage_materials`
--

LOCK TABLES `rmms_rescuestage_materials` WRITE;
/*!40000 ALTER TABLE `rmms_rescuestage_materials` DISABLE KEYS */;
INSERT INTO `rmms_rescuestage_materials` VALUES (1,1,1),(2,2,1),(3,2,2),(4,3,1),(5,3,2);
/*!40000 ALTER TABLE `rmms_rescuestage_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_sourceway`
--

DROP TABLE IF EXISTS `rmms_sourceway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_sourceway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_sourceway`
--

LOCK TABLES `rmms_sourceway` WRITE;
/*!40000 ALTER TABLE `rmms_sourceway` DISABLE KEYS */;
INSERT INTO `rmms_sourceway` VALUES (2,'企业储备'),(1,'政府储备'),(3,'社会捐助中心');
/*!40000 ALTER TABLE `rmms_sourceway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_store`
--

DROP TABLE IF EXISTS `rmms_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `coordinate` varchar(50) NOT NULL,
  `comment` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coordinate` (`coordinate`),
  KEY `rmms_store_b376980e` (`city_id`),
  CONSTRAINT `city_id_refs_id_9fa82a91` FOREIGN KEY (`city_id`) REFERENCES `rmms_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_store`
--

LOCK TABLES `rmms_store` WRITE;
/*!40000 ALTER TABLE `rmms_store` DISABLE KEYS */;
INSERT INTO `rmms_store` VALUES (1,'昆明仓库',1,'云南省昆明市某某街道','123,31',''),(2,'大理仓库',2,'云南省大理市某某街道','130,30',''),(3,'昭通仓库',3,'云南省昭通市某某街道','34,33','');
/*!40000 ALTER TABLE `rmms_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmms_transportway`
--

DROP TABLE IF EXISTS `rmms_transportway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmms_transportway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmms_transportway`
--

LOCK TABLES `rmms_transportway` WRITE;
/*!40000 ALTER TABLE `rmms_transportway` DISABLE KEYS */;
INSERT INTO `rmms_transportway` VALUES (2,'公路运输'),(1,'铁路运输');
/*!40000 ALTER TABLE `rmms_transportway` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-22 22:07:50
