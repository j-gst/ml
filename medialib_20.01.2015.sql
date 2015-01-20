-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
--
-- Host: localhost    Database: medialib
-- ------------------------------------------------------
-- Server version	5.6.11

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'contentmanager'),(2,'standarduser');
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
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,12);
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
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add author',7,'add_author'),(20,'Can change author',7,'change_author'),(21,'Can delete author',7,'delete_author'),(22,'Can add book',8,'add_book'),(23,'Can change book',8,'change_book'),(24,'Can delete book',8,'delete_book'),(25,'Can add book comment',9,'add_bookcomment'),(26,'Can change book comment',9,'change_bookcomment'),(27,'Can delete book comment',9,'delete_bookcomment'),(28,'Can add book rating',10,'add_bookrating'),(29,'Can change book rating',10,'change_bookrating'),(30,'Can delete book rating',10,'delete_bookrating'),(31,'Can add book owning',11,'add_bookowning'),(32,'Can change book owning',11,'change_bookowning'),(33,'Can delete book owning',11,'delete_bookowning'),(34,'Can add category',12,'add_category'),(35,'Can change category',12,'change_category'),(36,'Can delete category',12,'delete_category');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$VPCmwOuglIhZ$0z5er7B19PFqewO8JpyYNNZ2fh6techf8NaGszbZKiw=','2015-01-20 20:29:18',1,'buffy','Beate','','buffy@test.de',1,1,'2015-01-02 16:05:18'),(2,'pbkdf2_sha256$12000$qsoNTYoR4rHq$CyJd4y7JhWgx9ZOyaNjzyu6/RCim4IlRFIj3BUtQMvM=','2015-01-20 20:25:37',0,'gst','','','gst@netuse.de',0,1,'2015-01-04 14:02:41'),(3,'pbkdf2_sha256$12000$WI5kilzxTlka$3IxYz4f3LEpn1aNm6jrnTSYOX98lgqAebPBQxpcLPhw=','2015-01-20 20:22:26',0,'peter','Peter','Lustig','tt@fd.fr',0,1,'2015-01-04 14:05:24'),(4,'pbkdf2_sha256$12000$sUKCzClit7yj$QWIdSfCWW1SUxHE1S82JmIJTNeeVEBFQikTUOUx1FNg=','2015-01-20 20:26:15',0,'hans','Hans','','h@x.de',0,1,'2015-01-11 16:45:31'),(5,'pbkdf2_sha256$12000$JnOOBY7VvOCH$QGVsOoZX0qXaoPZTAfRPoNhvdvLZS9gCO6Ub76XFwrE=','2015-01-20 20:14:37',0,'maxi','Max','Mustermann','max@test.de',0,1,'2015-01-20 20:12:18'),(6,'pbkdf2_sha256$12000$P4va5CAG284Q$gLsOEsV52WVjJzewtTOOf/zQuzQf5E7DQfQOrP6BfeQ=','2015-01-20 20:19:13',0,'peter22','Peter','Kastens','peter@test.de',0,1,'2015-01-20 20:19:02');
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
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(2,3,2);
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
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,1,4);
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-01-02 16:07:35','1','Book object',1,'',8,1),(2,'2015-01-02 16:08:03','3','Author object',2,'Changed firstname and lastname.',7,1),(3,'2015-01-02 16:55:59','2','Andrew S., Tannenbaum',2,'Changed firstname and lastname.',7,1),(4,'2015-01-02 16:56:43','4','Prof. Dr. Heinz Peter, Gumm',1,'',7,1),(5,'2015-01-02 16:57:02','5','Prof. Dr. Manfred, Sommer',1,'',7,1),(6,'2015-01-02 17:02:07','4','Test',1,'',8,1);
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
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'author','portal','author'),(8,'book','portal','book'),(9,'book comment','portal','bookcomment'),(10,'book rating','portal','bookrating'),(11,'book owning','portal','bookowning'),(12,'category','portal','category');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2014-12-27 13:32:21'),(2,'auth','0001_initial','2014-12-27 13:32:39'),(3,'admin','0001_initial','2014-12-27 13:32:44'),(4,'sessions','0001_initial','2014-12-27 13:32:45'),(5,'portal','0001_initial','2014-12-27 14:17:13'),(6,'portal','0002_auto_20150107_1511','2015-01-11 13:21:37'),(7,'portal','0003_book_cover','2015-01-11 13:21:37'),(8,'portal','0004_bookcomment','2015-01-11 13:21:38'),(9,'portal','0005_auto_20150111_1358','2015-01-11 14:33:49'),(10,'portal','0006_bookcomment_commentdate','2015-01-11 14:33:50'),(11,'portal','0007_auto_20150111_1546','2015-01-11 14:46:59'),(12,'portal','0008_auto_20150112_2119','2015-01-16 16:39:24'),(13,'portal','0009_auto_20150112_2208','2015-01-16 16:39:26'),(14,'portal','0010_auto_20150115_2133','2015-01-16 16:39:26'),(15,'portal','0011_auto_20150117_1409','2015-01-17 14:04:53');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('cgk895atj5btu392houan0kwuhppn4m8','ZGU5M2I4MTI5M2M2ZGQyYzk3ZTdlMjdmN2M1MTU1NTYzMmQ0MjE3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3N2NhMTMyMDM0NzViYmNjMWVmNGMyODZkN2I1YTRmNWZiMjVmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-02-03 20:29:18'),('jf3s8izk4v0vp944z8va8e2wdq5k0ewi','ZGU5M2I4MTI5M2M2ZGQyYzk3ZTdlMjdmN2M1MTU1NTYzMmQ0MjE3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3N2NhMTMyMDM0NzViYmNjMWVmNGMyODZkN2I1YTRmNWZiMjVmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-02-01 13:22:09'),('lr80hj0z632y626voub6ok7b083nrctn','ZGU5M2I4MTI5M2M2ZGQyYzk3ZTdlMjdmN2M1MTU1NTYzMmQ0MjE3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3N2NhMTMyMDM0NzViYmNjMWVmNGMyODZkN2I1YTRmNWZiMjVmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-01-18 17:46:51');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_author`
--

DROP TABLE IF EXISTS `portal_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_author`
--

LOCK TABLES `portal_author` WRITE;
/*!40000 ALTER TABLE `portal_author` DISABLE KEYS */;
INSERT INTO `portal_author` VALUES (1,'Hans-Peter','Anderson'),(2,'Tannenbaum','Andrew S.'),(3,'Kate','White'),(4,'Gumm','Prof. Dr. Heinz Peter'),(5,'Sommer','Prof. Dr. Manfred'),(6,'Karl','Heinz'),(13,'Hans-Dieter','Neuwingen'),(14,'Karl','Koch');
/*!40000 ALTER TABLE `portal_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_book`
--

DROP TABLE IF EXISTS `portal_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(100) CHARACTER SET utf8 NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` longtext CHARACTER SET utf8 NOT NULL,
  `cover` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_book`
--

LOCK TABLES `portal_book` WRITE;
/*!40000 ALTER TABLE `portal_book` DISABLE KEYS */;
INSERT INTO `portal_book` VALUES (1,'978-3-442-36671-2','Wenn Blicke töten könnten','Gerade nicht so wichtig','cover/default/default.png'),(4,'2323-4433-4455-6789','Die Wüste','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','cover/default/default.png'),(6,'978-3-486-59711-0','Einführung in die Informatik','l','cover/default/default.png'),(7,'44444-2323-1212-1212','Betriebssysteme','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ','cover/default/default.png'),(8,'2323-5678-1298-0000','Aurora','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.','cover/default/default.png'),(9,'1234-1111-2222-3333','Das Märchenbuch','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','cover/default/default.png'),(10,'2323-4444-5555-6666','Experimentalphysik ','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. ','cover/default/default.png'),(12,'1234-1234-1234-FF12','Cobra','11','cover/default/default.png'),(13,'1234-5678-2222-12G2','Der Herr der Ringe Band 1','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','cover/default/default.png');
/*!40000 ALTER TABLE `portal_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_book_authors`
--

DROP TABLE IF EXISTS `portal_book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_book_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_id` (`book_id`,`author_id`),
  KEY `portal_book_authors_0a4572cc` (`book_id`),
  KEY `portal_book_authors_4f331e2f` (`author_id`),
  CONSTRAINT `portal_book_authors_author_id_6584cb1_fk_portal_author_id` FOREIGN KEY (`author_id`) REFERENCES `portal_author` (`id`),
  CONSTRAINT `portal_book_authors_book_id_55269d2b_fk_portal_book_id` FOREIGN KEY (`book_id`) REFERENCES `portal_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_book_authors`
--

LOCK TABLES `portal_book_authors` WRITE;
/*!40000 ALTER TABLE `portal_book_authors` DISABLE KEYS */;
INSERT INTO `portal_book_authors` VALUES (38,1,1),(41,4,4),(42,4,5),(13,6,4),(14,6,5),(37,7,2),(43,8,3),(40,9,1),(39,10,5),(34,12,3),(35,13,1);
/*!40000 ALTER TABLE `portal_book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_book_categories`
--

DROP TABLE IF EXISTS `portal_book_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_book_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_id` (`book_id`,`category_id`),
  KEY `portal_book_categories_0a4572cc` (`book_id`),
  KEY `portal_book_categories_b583a629` (`category_id`),
  CONSTRAINT `portal_book_categorie_category_id_2ec00195_fk_portal_category_id` FOREIGN KEY (`category_id`) REFERENCES `portal_category` (`id`),
  CONSTRAINT `portal_book_categories_book_id_147a0ff2_fk_portal_book_id` FOREIGN KEY (`book_id`) REFERENCES `portal_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_book_categories`
--

LOCK TABLES `portal_book_categories` WRITE;
/*!40000 ALTER TABLE `portal_book_categories` DISABLE KEYS */;
INSERT INTO `portal_book_categories` VALUES (8,1,39),(11,4,41),(7,7,41),(13,8,1),(12,8,40),(10,9,40),(9,10,41),(3,12,1),(4,12,39),(5,13,40);
/*!40000 ALTER TABLE `portal_book_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_bookcomment`
--

DROP TABLE IF EXISTS `portal_bookcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_bookcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `commentdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_bookcomment_book_id_66be15a2_fk_portal_book_id` (`book_id`),
  KEY `portal_bookcomment_user_id_104900ec_fk_auth_user_id` (`user_id`),
  CONSTRAINT `portal_bookcomment_book_id_66be15a2_fk_portal_book_id` FOREIGN KEY (`book_id`) REFERENCES `portal_book` (`id`),
  CONSTRAINT `portal_bookcomment_user_id_104900ec_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_bookcomment`
--

LOCK TABLES `portal_bookcomment` WRITE;
/*!40000 ALTER TABLE `portal_bookcomment` DISABLE KEYS */;
INSERT INTO `portal_bookcomment` VALUES (3,'test',6,1,'2015-01-11 14:33:39'),(4,'test2',6,1,'2015-01-11 14:33:39'),(5,'test3',6,1,'2015-01-11 14:33:39'),(6,'test3',6,1,'2015-01-11 14:33:39'),(7,'fgdfgdfg',6,1,'2015-01-11 14:33:39'),(8,'gg',6,1,'2015-01-11 14:33:39'),(9,'neu',6,1,'2015-01-11 14:33:39'),(10,'zeit',6,2,'2015-01-11 14:34:52'),(11,'kommentar mal etwas länger und auch mit Ulauten kommentar mal etwas länger und auch mit Ulauten\r\nkommentar mal etwas länger und auch mit Ulauten\r\nkommentar mal etwas länger und auch mit Ulauten kommentar mal etwas länger und auch mit Ulauten\r\nkommentar mal etwas länger und auch mit Ulauten\r\nkommentar mal etwas länger und auch mit Ulauten kommentar mal etwas länger und auch mit Ulauten\r\nkommentar mal etwas länger und auch mit Ulauten',6,4,'2015-01-11 16:48:23'),(12,'test ',6,4,'2015-01-11 16:50:00'),(13,'jjj',10,1,'2015-01-17 11:29:51'),(14,'On Linux systems, a Python installation will typically be included as part of the distribution. Installing into this Python installation requires root access to the system, and may interfere with the operation of the system package manager and other components of the system if a component is unexpectedly upgraded using pip.\r\n\r\nOn such systems, it is often better to use a virtual environment or a per-user installation when installing packages with pip.',8,5,'2015-01-20 20:13:30'),(15,'Python has typically relied heavily on source based distribution, with end users being expected to compile extension modules from source as part of the installation process.',8,5,'2015-01-20 20:13:41'),(16,'Python has typically relied heavily on source based distribution, with end users being expected to compile extension modules from source as part of the installation process.',7,5,'2015-01-20 20:13:50'),(17,'Python has typically relied heavily on source based distribution, with end users being expected to compile extension modules from source as part of the installation process.',9,5,'2015-01-20 20:13:57'),(18,'Python has typically relied heavily on source based distribution, with end users being expected to compile extension modules from source as part of the installation process.',12,5,'2015-01-20 20:14:01'),(19,'Python has typically relied heavily on source based distribution, with end users being expected to compile extension modules from source as part of the installation process.',6,5,'2015-01-20 20:14:11'),(20,'Python is an easy to learn, powerful programming language. It has efficient high-level data structures and a simple but effective approach to object-oriented programming. Python’s elegant syntax and dynamic typing, together with its interpreted nature, make it an ideal language for scripting and rapid application development in many areas on most platforms.\r\n',1,6,'2015-01-20 20:22:00'),(21,'Python is an easy to learn, powerful programming language. ',13,3,'2015-01-20 20:23:42'),(22,'Python is an easy to learn, powerful programming language. ',7,3,'2015-01-20 20:23:47'),(23,'Python is an easy to learn, powerful programming language. ',8,3,'2015-01-20 20:23:52'),(24,'Python is an easy to learn, powerful programming language. ',6,3,'2015-01-20 20:23:58');
/*!40000 ALTER TABLE `portal_bookcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_bookowning`
--

DROP TABLE IF EXISTS `portal_bookowning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_bookowning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `own` varchar(15) DEFAULT NULL,
  `read` varchar(15) DEFAULT NULL,
  `owningdate` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_bookowning_user_id_46978911_uniq` (`user_id`,`book_id`),
  KEY `portal_bookowning_0a4572cc` (`book_id`),
  KEY `portal_bookowning_e8701ad4` (`user_id`),
  CONSTRAINT `portal_bookowning_book_id_64d4f7ca_fk_portal_book_id` FOREIGN KEY (`book_id`) REFERENCES `portal_book` (`id`),
  CONSTRAINT `portal_bookowning_user_id_6f322380_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_bookowning`
--

LOCK TABLES `portal_bookowning` WRITE;
/*!40000 ALTER TABLE `portal_bookowning` DISABLE KEYS */;
INSERT INTO `portal_bookowning` VALUES (1,'Ja','Ja','2015-01-16 16:40:18',6,1),(2,'Nein','Ja','2015-01-17 11:18:10',10,1),(4,'Ja','Nein','2015-01-17 19:23:23',1,1),(5,'Nein','Ja','2015-01-17 19:23:31',4,1),(6,'Nein','Nein','2015-01-17 20:31:40',9,1),(7,'Ja','Ja','2015-01-20 20:14:47',8,5),(8,'Ja','Nein','2015-01-20 20:14:58',9,5),(9,'Nein','Ja','2015-01-20 20:15:07',13,5),(10,'Ja','Ja','2015-01-20 20:15:18',6,5),(11,'Nein','Ja','2015-01-20 20:19:27',8,6),(12,'Ja','Ja','2015-01-20 20:19:39',12,6),(13,'Ja','Ja','2015-01-20 20:19:50',1,6),(14,'Ja','Ja','2015-01-20 20:20:01',6,6),(15,'Ja','Ja','2015-01-20 20:23:29',7,3);
/*!40000 ALTER TABLE `portal_bookowning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_bookrating`
--

DROP TABLE IF EXISTS `portal_bookrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_bookrating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `ratingdate` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_bookrating_user_id_5caab854_uniq` (`user_id`,`book_id`),
  KEY `portal_bookrating_0a4572cc` (`book_id`),
  KEY `portal_bookrating_e8701ad4` (`user_id`),
  CONSTRAINT `portal_bookrating_book_id_32f0144d_fk_portal_book_id` FOREIGN KEY (`book_id`) REFERENCES `portal_book` (`id`),
  CONSTRAINT `portal_bookrating_user_id_353c84fd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_bookrating`
--

LOCK TABLES `portal_bookrating` WRITE;
/*!40000 ALTER TABLE `portal_bookrating` DISABLE KEYS */;
INSERT INTO `portal_bookrating` VALUES (1,3,'2015-01-11 15:34:23',6,2),(8,5,'2015-01-11 16:24:12',6,1),(9,3,'2015-01-11 16:25:41',6,3),(13,3,'2015-01-11 16:46:47',6,4),(14,2,'2015-01-17 11:18:07',10,1),(15,2,'2015-01-17 11:55:47',7,1),(16,4,'2015-01-17 13:06:50',12,1),(17,3,'2015-01-17 21:13:46',4,1),(18,1,'2015-01-20 20:14:48',8,5),(19,5,'2015-01-20 20:15:10',13,5),(20,4,'2015-01-20 20:15:21',6,5),(21,2,'2015-01-20 20:19:25',8,6),(22,4,'2015-01-20 20:19:36',12,6),(23,2,'2015-01-20 20:19:47',1,6),(24,3,'2015-01-20 20:20:03',6,6),(25,4,'2015-01-20 20:23:38',13,3);
/*!40000 ALTER TABLE `portal_bookrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_category`
--

DROP TABLE IF EXISTS `portal_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_category`
--

LOCK TABLES `portal_category` WRITE;
/*!40000 ALTER TABLE `portal_category` DISABLE KEYS */;
INSERT INTO `portal_category` VALUES (1,'Roman'),(39,'Krimi'),(40,'Fantasy'),(41,'Sachbuch'),(42,'Kinderbuch');
/*!40000 ALTER TABLE `portal_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauth_msg`
--

DROP TABLE IF EXISTS `userauth_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userauth_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(40) NOT NULL,
  `text` longtext NOT NULL,
  `msgdate` datetime NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userauth_msg_6b4f059f` (`from_user_id`),
  KEY `userauth_msg_63add04c` (`to_user_id`),
  CONSTRAINT `userauth_msg_to_user_id_2bf28fc1_fk_auth_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `userauth_msg_from_user_id_6f2e5b5c_fk_auth_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauth_msg`
--

LOCK TABLES `userauth_msg` WRITE;
/*!40000 ALTER TABLE `userauth_msg` DISABLE KEYS */;
INSERT INTO `userauth_msg` VALUES (1,'Hallo buffy','Eine erste Nachricht','2015-01-20 18:38:23',2,1),(4,'Nachricht mit viel Text','Welcome! Are you completely new to programming? If not then we presume you will be looking for information about why and how to get started with Python. Fortunately an experienced programmer in any programming language (whatever it may be) can pick up Python very quickly. It\'s also easy for beginners to use and learn, so jump in!','2015-01-20 18:39:34',2,1),(5,'Hallo gst','Eine Nachricht','2015-01-20 18:40:08',1,2),(6,'Testnachricht 2','Welcome! Are you completely new to programming? If not then we presume you will be looking for information about why and how to get started with Python. Fortunately an experienced programmer in any programming language (whatever it may be) can pick up Python very quickly. It\'s also easy for beginners to use and learn, so jump in!Welcome! Are you completely new to programming? If not then we presume you will be looking for information about why and how to get started with Python. Fortunately an experienced programmer in any programming language (whatever it may be) can pick up Python very quickly. It\'s also easy for beginners to use and learn, so jump in!','2015-01-20 18:40:26',1,2),(7,'Eine neue Nachricht','Installing Python is generally easy, and nowadays many Linux and UNIX distributions include a recent Python. Even some Windows computers (notably those from HP) now come with Python already installed. If you do need to install Python and aren\'t confident about the task you can find a few notes on the BeginnersGuide/Download wiki page, but installation is unremarkable on most platforms.','2015-01-20 20:09:24',1,2),(8,'Looking for Something Specific?','If you want to know whether a particular application, or a library with particular functionality, is available in Python there are a number of possible sources of information. The Python web site provides a Python Package Index (also known as the Cheese Shop, a reference to the Monty Python script of that name). There is also a search page for a number of sources of Python-related information. Failing that, just Google for a phrase including the word \'\'python\'\' and you may well get the result you need. If all else fails, ask on the python newsgroup and there\'s a good chance someone will put you on the right track.','2015-01-20 20:09:53',1,2),(9,'Looking to Help?','If you want to help to develop Python, take a look at the developer area for further information. Please note that you don\'t have to be an expert programmer to help. The documentation is just as important as the compiler, and still needs plenty of work!','2015-01-20 20:10:35',2,1),(10,'Key terms','\r\n    pip is the preferred installer program. Starting with Python 3.4, it is included by default with the Python binary installers.\r\n    a virtual environment is a semi-isolated Python environment that allows packages to be installed for use by a particular application, rather than being installed system wide\r\n    pyvenv is the standard tool for creating virtual environments, and has been part of Python since Python 3.3. Starting with Python 3.4, it defaults to installing pip into all created virtual environments\r\n    virtualenv is a third party alternative (and predecessor) to pyvenv. It allows virtual environments to be used on versions of Python prior to 3.4, which either don’t provide pyvenv at all, or aren’t able to automatically install pip into created environments.\r\n    the Python Packaging Index is a public repository of open source licensed packages made available for use by other Python users\r\n    the Python Packaging Authority are the group of developers and documentation authors responsible for the maintenance and evolution of the standard packaging tools and the associated metadata and file format standards. They maintain a variety of tools, documentation and issue trackers on both GitHub and BitBucket.\r\n    distutils is the original build and distribution system first added to the Python standard library in 1998. While direct use of distutils is being phased out, it still laid the foundation for the current packaging and distribution infrastructure, and it not only remains part of the standard library, but its name lives on in other ways (such as the name of the mailing list used to coordinate Python packaging standards development).\r\n','2015-01-20 20:11:06',2,1),(11,'Basic usage','The standard packaging tools are all designed to be used from the command line.','2015-01-20 20:13:04',5,1),(12,'Common installation issues','On Linux systems, a Python installation will typically be included as part of the distribution. Installing into this Python installation requires root access to the system, and may interfere with the operation of the system package manager and other components of the system if a component is unexpectedly upgraded using pip.\r\n\r\nOn such systems, it is often better to use a virtual environment or a per-user installation when installing packages with pip.','2015-01-20 20:13:22',5,2),(13,'hallo','Python has typically relied heavily on source based distribution, with end users being expected to compile extension modules from source as part of the installation process.','2015-01-20 20:16:04',1,5),(14,'Testbetreff','With the introduction of support for the binary wheel format, and the ability to publish wheels for at least Windows and Mac OS X through the Python Packaging Index, this problem is expected to diminish over time, as users are more regularly able to install pre-built extensions rather than needing to build them themselves.','2015-01-20 20:20:32',6,1),(15,'Ganz viel Text','Python is an easy to learn, powerful programming language. It has efficient high-level data structures and a simple but effective approach to object-oriented programming. Python’s elegant syntax and dynamic typing, together with its interpreted nature, make it an ideal language for scripting and rapid application development in many areas on most platforms.\r\n\r\nThe Python interpreter and the extensive standard library are freely available in source or binary form for all major platforms from the Python Web site, https://www.python.org/, and may be freely distributed. The same site also contains distributions of and pointers to many free third party Python modules, programs and tools, and additional documentation.\r\n\r\nThe Python interpreter is easily extended with new functions and data types implemented in C or C++ (or other languages callable from C). Python is also suitable as an extension language for customizable applications.\r\n\r\nThis tutorial introduces the reader informally to the basic concepts and features of the Python language and system. It helps to have a Python interpreter handy for hands-on experience, but all examples are self-contained, so the tutorial can be read off-line as well.\r\nPython is an easy to learn, powerful programming language. It has efficient high-level data structures and a simple but effective approach to object-oriented programming. Python’s elegant syntax and dynamic typing, together with its interpreted nature, make it an ideal language for scripting and rapid application development in many areas on most platforms.\r\n\r\nThe Python interpreter and the extensive standard library are freely available in source or binary form for all major platforms from the Python Web site, https://www.python.org/, and may be freely distributed. The same site also contains distributions of and pointers to many free third party Python modules, programs and tools, and additional documentation.\r\n\r\nThe Python interpreter is easily extended with new functions and data types implemented in C or C++ (or other languages callable from C). Python is also suitable as an extension language for customizable applications.','2015-01-20 20:21:30',6,1),(16,'Python ','Python is an easy to learn, powerful programming language. ','2015-01-20 20:23:07',3,2),(17,'Python','Python is an easy to learn, powerful programming language. ','2015-01-20 20:23:17',3,1),(18,'Hallo gst','Python is an easy to learn, powerful programming language. ','2015-01-20 20:26:44',4,2);
/*!40000 ALTER TABLE `userauth_msg` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-20 21:30:01
