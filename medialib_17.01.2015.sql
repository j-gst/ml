-- MySQL dump 10.13  Distrib 5.5.24, for Win32 (x86)
--
-- Host: localhost    Database: medialib
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add author',7,'add_author'),(20,'Can change author',7,'change_author'),(21,'Can delete author',7,'delete_author'),(22,'Can add book',8,'add_book'),(23,'Can change book',8,'change_book'),(24,'Can delete book',8,'delete_book'),(25,'Can add book comment',9,'add_bookcomment'),(26,'Can change book comment',9,'change_bookcomment'),(27,'Can delete book comment',9,'delete_bookcomment'),(28,'Can add book rating',10,'add_bookrating'),(29,'Can change book rating',10,'change_bookrating'),(30,'Can delete book rating',10,'delete_bookrating'),(31,'Can add book owning',11,'add_bookowning'),(32,'Can change book owning',11,'change_bookowning'),(33,'Can delete book owning',11,'delete_bookowning');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$VPCmwOuglIhZ$0z5er7B19PFqewO8JpyYNNZ2fh6techf8NaGszbZKiw=','2015-01-11 17:06:50',1,'buffy','Beate','','buffy@test.de',1,1,'2015-01-02 16:05:18'),(2,'pbkdf2_sha256$12000$qsoNTYoR4rHq$CyJd4y7JhWgx9ZOyaNjzyu6/RCim4IlRFIj3BUtQMvM=','2015-01-11 16:42:59',0,'gst','','','gst@netuse.de',0,1,'2015-01-04 14:02:41'),(3,'pbkdf2_sha256$12000$WI5kilzxTlka$3IxYz4f3LEpn1aNm6jrnTSYOX98lgqAebPBQxpcLPhw=','2015-01-11 16:25:29',0,'tt','Peter','Lustig','tt@fd.fr',0,1,'2015-01-04 14:05:24'),(4,'pbkdf2_sha256$12000$sUKCzClit7yj$QWIdSfCWW1SUxHE1S82JmIJTNeeVEBFQikTUOUx1FNg=','2015-01-11 16:45:57',0,'hans','','','h@x.de',0,1,'2015-01-11 16:45:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'author','portal','author'),(8,'book','portal','book'),(9,'book comment','portal','bookcomment'),(10,'book rating','portal','bookrating'),(11,'book owning','portal','bookowning');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2014-12-27 13:32:21'),(2,'auth','0001_initial','2014-12-27 13:32:39'),(3,'admin','0001_initial','2014-12-27 13:32:44'),(4,'sessions','0001_initial','2014-12-27 13:32:45'),(5,'portal','0001_initial','2014-12-27 14:17:13'),(6,'portal','0002_auto_20150107_1511','2015-01-11 13:21:37'),(7,'portal','0003_book_cover','2015-01-11 13:21:37'),(8,'portal','0004_bookcomment','2015-01-11 13:21:38'),(9,'portal','0005_auto_20150111_1358','2015-01-11 14:33:49'),(10,'portal','0006_bookcomment_commentdate','2015-01-11 14:33:50'),(11,'portal','0007_auto_20150111_1546','2015-01-11 14:46:59'),(12,'portal','0008_auto_20150112_2119','2015-01-16 16:39:24'),(13,'portal','0009_auto_20150112_2208','2015-01-16 16:39:26'),(14,'portal','0010_auto_20150115_2133','2015-01-16 16:39:26');
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
INSERT INTO `django_session` VALUES ('lr80hj0z632y626voub6ok7b083nrctn','ZGU5M2I4MTI5M2M2ZGQyYzk3ZTdlMjdmN2M1MTU1NTYzMmQ0MjE3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3N2NhMTMyMDM0NzViYmNjMWVmNGMyODZkN2I1YTRmNWZiMjVmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-01-18 17:46:51'),('nh6yi42zq67midv5uyy1qj13dqi222e5','ZGU5M2I4MTI5M2M2ZGQyYzk3ZTdlMjdmN2M1MTU1NTYzMmQ0MjE3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3N2NhMTMyMDM0NzViYmNjMWVmNGMyODZkN2I1YTRmNWZiMjVmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-01-25 17:06:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_author`
--

LOCK TABLES `portal_author` WRITE;
/*!40000 ALTER TABLE `portal_author` DISABLE KEYS */;
INSERT INTO `portal_author` VALUES (1,'Hans','Anderson'),(2,'Tannenbaum','Andrew S.'),(3,'Kate','White'),(4,'Gumm','Prof. Dr. Heinz Peter'),(5,'Sommer','Prof. Dr. Manfred'),(6,'karl','heinz'),(7,'t','u'),(8,'n','m');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_book`
--

LOCK TABLES `portal_book` WRITE;
/*!40000 ALTER TABLE `portal_book` DISABLE KEYS */;
INSERT INTO `portal_book` VALUES (1,'978-3-442-36671-2','Wenn Blicke töten könnten','Gerade nicht so wichtig','cover/default/default.png'),(4,'mitjwletpw','Test cc','ggghhh','cover/default/default.png'),(6,'978-3-486-59711-0','Einführung in die Informatik','l','cover/default/default.png'),(7,'44444','neues bbuch','mm','cover/default/default.png'),(8,'4','Test cccc','g','cover/default/default.png'),(9,'1234','TestBuch1','test','cover/default/default.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_book_authors`
--

LOCK TABLES `portal_book_authors` WRITE;
/*!40000 ALTER TABLE `portal_book_authors` DISABLE KEYS */;
INSERT INTO `portal_book_authors` VALUES (1,1,2),(23,4,1),(13,6,4),(14,6,5),(25,7,2),(26,8,3);
/*!40000 ALTER TABLE `portal_book_authors` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_bookcomment`
--

LOCK TABLES `portal_bookcomment` WRITE;
/*!40000 ALTER TABLE `portal_bookcomment` DISABLE KEYS */;
INSERT INTO `portal_bookcomment` VALUES (3,'test',6,1,'2015-01-11 14:33:39'),(4,'test2',6,1,'2015-01-11 14:33:39'),(5,'test3',6,1,'2015-01-11 14:33:39'),(6,'test3',6,1,'2015-01-11 14:33:39'),(7,'fgdfgdfg',6,1,'2015-01-11 14:33:39'),(8,'gg',6,1,'2015-01-11 14:33:39'),(9,'neu',6,1,'2015-01-11 14:33:39'),(10,'zeit',6,2,'2015-01-11 14:34:52'),(11,'kommentar mal etwas länger und auch mit Ulauten kommentar mal etwas länger und auch mit Ulauten\r\nkommentar mal etwas länger und auch mit Ulauten\r\nkommentar mal etwas länger und auch mit Ulauten kommentar mal etwas länger und auch mit Ulauten\r\nkommentar mal etwas länger und auch mit Ulauten\r\nkommentar mal etwas länger und auch mit Ulauten kommentar mal etwas länger und auch mit Ulauten\r\nkommentar mal etwas länger und auch mit Ulauten',6,4,'2015-01-11 16:48:23'),(12,'test ',6,4,'2015-01-11 16:50:00');
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
  `own` varchar(15),
  `read` varchar(15),
  `owningdate` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_bookowning_user_id_46978911_uniq` (`user_id`,`book_id`),
  KEY `portal_bookowning_0a4572cc` (`book_id`),
  KEY `portal_bookowning_e8701ad4` (`user_id`),
  CONSTRAINT `portal_bookowning_book_id_64d4f7ca_fk_portal_book_id` FOREIGN KEY (`book_id`) REFERENCES `portal_book` (`id`),
  CONSTRAINT `portal_bookowning_user_id_6f322380_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_bookowning`
--

LOCK TABLES `portal_bookowning` WRITE;
/*!40000 ALTER TABLE `portal_bookowning` DISABLE KEYS */;
INSERT INTO `portal_bookowning` VALUES (1,'Ja','Ja','2015-01-16 16:40:18',6,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_bookrating`
--

LOCK TABLES `portal_bookrating` WRITE;
/*!40000 ALTER TABLE `portal_bookrating` DISABLE KEYS */;
INSERT INTO `portal_bookrating` VALUES (1,3,'2015-01-11 15:34:23',6,2),(8,5,'2015-01-11 16:24:12',6,1),(9,3,'2015-01-11 16:25:41',6,3),(13,3,'2015-01-11 16:46:47',6,4);
/*!40000 ALTER TABLE `portal_bookrating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-17 11:47:50
