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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add author',7,'add_author'),(20,'Can change author',7,'change_author'),(21,'Can delete author',7,'delete_author'),(22,'Can add book',8,'add_book'),(23,'Can change book',8,'change_book'),(24,'Can delete book',8,'delete_book'),(25,'Can add book comment',9,'add_bookcomment'),(26,'Can change book comment',9,'change_bookcomment'),(27,'Can delete book comment',9,'delete_bookcomment'),(28,'Can add book rating',10,'add_bookrating'),(29,'Can change book rating',10,'change_bookrating'),(30,'Can delete book rating',10,'delete_bookrating'),(31,'Can add book owning',11,'add_bookowning'),(32,'Can change book owning',11,'change_bookowning'),(33,'Can delete book owning',11,'delete_bookowning'),(34,'Can add category',12,'add_category'),(35,'Can change category',12,'change_category'),(36,'Can delete category',12,'delete_category'),(37,'Can add msg',13,'add_msg'),(38,'Can change msg',13,'change_msg'),(39,'Can delete msg',13,'delete_msg'),(40,'Can add category',14,'add_category'),(41,'Can change category',14,'change_category'),(42,'Can delete category',14,'delete_category'),(43,'Can add film comment',15,'add_filmcomment'),(44,'Can change film comment',15,'change_filmcomment'),(45,'Can delete film comment',15,'delete_filmcomment'),(46,'Can add film owning',16,'add_filmowning'),(47,'Can change film owning',16,'change_filmowning'),(48,'Can delete film owning',16,'delete_filmowning'),(49,'Can add participant',17,'add_participant'),(50,'Can change participant',17,'change_participant'),(51,'Can delete participant',17,'delete_participant'),(52,'Can add film rating',18,'add_filmrating'),(53,'Can change film rating',18,'change_filmrating'),(54,'Can delete film rating',18,'delete_filmrating'),(55,'Can add film',19,'add_film'),(56,'Can change film',19,'change_film'),(57,'Can delete film',19,'delete_film'),(58,'Can add book owning',20,'add_bookowning'),(59,'Can change book owning',20,'change_bookowning'),(60,'Can delete book owning',20,'delete_bookowning'),(61,'Can add book rating',21,'add_bookrating'),(62,'Can change book rating',21,'change_bookrating'),(63,'Can delete book rating',21,'delete_bookrating'),(64,'Can add book comment',22,'add_bookcomment'),(65,'Can change book comment',22,'change_bookcomment'),(66,'Can delete book comment',22,'delete_bookcomment'),(67,'Can add author',23,'add_author'),(68,'Can change author',23,'change_author'),(69,'Can delete author',23,'delete_author'),(70,'Can add category',24,'add_category'),(71,'Can change category',24,'change_category'),(72,'Can delete category',24,'delete_category'),(73,'Can add book',25,'add_book'),(74,'Can change book',25,'change_book'),(75,'Can delete book',25,'delete_book');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$svftXEbrsULV$QXVoJno1Y5hORZhK3O/QEY//JILawyjpl6EnP4E2sho=','2015-01-24 11:52:07',1,'buffy','Beate','','buffy@test.de',1,1,'2015-01-02 16:05:18'),(2,'pbkdf2_sha256$12000$qsoNTYoR4rHq$CyJd4y7JhWgx9ZOyaNjzyu6/RCim4IlRFIj3BUtQMvM=','2015-01-20 13:32:06',0,'gst','','','gst@netuse.de',0,1,'2015-01-04 14:02:41'),(3,'pbkdf2_sha256$12000$WI5kilzxTlka$3IxYz4f3LEpn1aNm6jrnTSYOX98lgqAebPBQxpcLPhw=','2015-01-11 16:25:29',0,'tt','Peter','Lustig','tt@fd.fr',0,1,'2015-01-04 14:05:24'),(4,'pbkdf2_sha256$12000$sUKCzClit7yj$QWIdSfCWW1SUxHE1S82JmIJTNeeVEBFQikTUOUx1FNg=','2015-01-11 16:45:57',0,'hans','','','h@x.de',0,0,'2015-01-11 16:45:31'),(5,'pbkdf2_sha256$12000$Ksys5bZtD8oE$6Zk4NWM9ESpzEcXFasB63GnM9sM32VZy6AF79CqXq+Q=','2015-01-20 13:52:16',0,'dragos','Dirk','Mustermann','d@xxx.de',0,1,'2015-01-20 13:52:16'),(6,'pbkdf2_sha256$12000$IFO3jH6DidAm$FooP5T2J9TZ0Dgbz1ear9GPXdRZQ/48Ja4TUKQHVTew=','2015-01-20 13:59:56',0,'rrr','Ralf','Ramse','r@e.de',0,1,'2015-01-20 13:59:56'),(7,'pbkdf2_sha256$12000$drRChVEK09LG$j9erb81djYhwujRzowuuk1oGGbfoTS5TIMQznIg0DPc=','2015-01-20 14:01:21',0,'rrr2','Ralf','Ramse','r@e.de',0,0,'2015-01-20 14:01:13'),(8,'pbkdf2_sha256$12000$pCJZtZtvloZP$cUvqGPZ/v4dtHYKDgVeeuxmDerHqN9NxqIgV7L/6g2I=','2015-01-22 17:52:12',0,'ralf','Ralf','Richter','dd@xy.de',0,1,'2015-01-22 17:52:12'),(9,'pbkdf2_sha256$12000$HMSd0ykLuTbL$WJ6NzpiURNuMeNBl89/YFjMtS/aX8DtRM+gpyQYpzj0=','2015-01-24 11:51:27',0,'maria','Maria','K.','maria@test.com',0,1,'2015-01-24 11:51:21');
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
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (1,'Hans-Peter','Anderson'),(2,'Tannenbaum','Andrew S.'),(3,'Kate','White'),(4,'Gumm','Prof. Dr. Heinz Peter'),(5,'Sommer','Prof. Dr. Manfred'),(6,'Karl','Heinz'),(13,'Hans-Dieter','Neuwingen'),(14,'Karl','Koch'),(15,'Ralf','Zimmermann'),(16,'Arthur ','Schmidt'),(17,'Dirie','Waris'),(18,'Tolkin','J.R.R.');
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_book`
--

DROP TABLE IF EXISTS `book_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `cover` varchar(100) NOT NULL,
  `booktimestamp` datetime NOT NULL,
  `pages` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_book`
--

LOCK TABLES `book_book` WRITE;
/*!40000 ALTER TABLE `book_book` DISABLE KEYS */;
INSERT INTO `book_book` VALUES (1,'Wenn Blicke töten könnten','9786-3666-4426-3667','Gerade nicht so wichtig','cover/book/20150124/e1d9e0365d2.gif','2015-01-24 13:31:23','444'),(4,'Wüstenblume ','2323-4433-4455-6789','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','cover/book/20150124/wustex.jpg','2015-01-24 13:03:00','344'),(6,'Einführung in die Informatik','978-3-486-59711-0','lWhether you\'re new to programming or an experienced developer, it\'s easy to learn and use Python.','cover/book/20150124/infoarge.jpg','2015-01-24 13:05:46','788'),(7,'Betriebssysteme','44444-2323-1212-1212','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ','cover/book/20150124/index.jpg','2015-01-24 12:59:01','0'),(8,'Die korrupte Republik','2323-5678-1298-0000','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.','cover/book/20150124/buchcover-tillack.jpg','2015-01-24 13:04:27','355'),(9,'Das Märchenbuch','1234-1111-2222-3333','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','cover/default/default.png','2015-01-22 20:01:20','0'),(10,'Experimentalphysik ','2323-4444-5555-6666','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. ','cover/book/20150124/41uQJDCibhL._SL500_AA300_.jpg','2015-01-24 12:59:52','1233'),(12,'Cobra','1234-1234-1234-FF12','Ein Thriller','cover/book/20150124/forsyth-cobracover.jpg','2015-01-24 13:08:48','348'),(13,'Der Herr der Ringe','1234-5678-2222-12G2','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','cover/book/20150124/384px-Der_Herr_der_Ringe_2_Cover_ISBN_978-3-608-93982-8.png','2015-01-24 13:09:09','655');
/*!40000 ALTER TABLE `book_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_book_authors`
--

DROP TABLE IF EXISTS `book_book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_book_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_id` (`book_id`,`author_id`),
  KEY `book_book_authors_0a4572cc` (`book_id`),
  KEY `book_book_authors_4f331e2f` (`author_id`),
  CONSTRAINT `book_book_authors_author_id_1fe658e4_fk_book_author_id` FOREIGN KEY (`author_id`) REFERENCES `book_author` (`id`),
  CONSTRAINT `book_book_authors_book_id_7b19abf0_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_book_authors`
--

LOCK TABLES `book_book_authors` WRITE;
/*!40000 ALTER TABLE `book_book_authors` DISABLE KEYS */;
INSERT INTO `book_book_authors` VALUES (68,1,3),(60,4,17),(63,6,5),(57,7,2),(62,8,6),(43,9,6),(58,10,4),(59,10,5),(66,12,13),(67,13,18);
/*!40000 ALTER TABLE `book_book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_book_categories`
--

DROP TABLE IF EXISTS `book_book_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_book_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_id` (`book_id`,`category_id`),
  KEY `book_book_categories_0a4572cc` (`book_id`),
  KEY `book_book_categories_b583a629` (`category_id`),
  CONSTRAINT `book_book_categories_book_id_109934e3_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  CONSTRAINT `book_book_categories_category_id_ab9533a_fk_book_category_id` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_book_categories`
--

LOCK TABLES `book_book_categories` WRITE;
/*!40000 ALTER TABLE `book_book_categories` DISABLE KEYS */;
INSERT INTO `book_book_categories` VALUES (44,1,39),(35,4,41),(38,6,41),(33,7,41),(37,8,41),(19,9,40),(34,10,41),(41,12,1),(42,12,39),(43,13,40);
/*!40000 ALTER TABLE `book_book_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_bookcomment`
--

DROP TABLE IF EXISTS `book_bookcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_bookcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `commentdate` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_bookcomment_0a4572cc` (`book_id`),
  KEY `book_bookcomment_e8701ad4` (`user_id`),
  CONSTRAINT `book_bookcomment_book_id_54573fcd_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  CONSTRAINT `book_bookcomment_user_id_541f5e83_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_bookcomment`
--

LOCK TABLES `book_bookcomment` WRITE;
/*!40000 ALTER TABLE `book_bookcomment` DISABLE KEYS */;
INSERT INTO `book_bookcomment` VALUES (1,'Ein gutes Buch','2015-01-24 13:04:44',8,1),(2,'Super Buch','2015-01-24 13:06:47',13,1),(3,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','2015-01-24 13:21:30',9,1),(4,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','2015-01-24 13:21:39',4,1),(5,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','2015-01-24 13:21:45',6,1),(6,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren.','2015-01-24 13:21:55',12,1),(7,'The 2015 Sundance Film Festival has started, and we\'re in Park City with coverage of the screenings, the street scene, and parties. Visit our Sundance section, brought to you by IMDb & Amazon Instant Video, to see the films we\'re excited about, plus browse our mini-guide, trailers, photos, and more!','2015-01-24 13:32:57',1,1);
/*!40000 ALTER TABLE `book_bookcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_bookowning`
--

DROP TABLE IF EXISTS `book_bookowning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_bookowning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `own` varchar(15) NOT NULL,
  `read` varchar(15) NOT NULL,
  `owningdate` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_bookowning_user_id_1cdbd16e_uniq` (`user_id`,`book_id`),
  KEY `book_bookowning_0a4572cc` (`book_id`),
  KEY `book_bookowning_e8701ad4` (`user_id`),
  CONSTRAINT `book_bookowning_book_id_48500627_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  CONSTRAINT `book_bookowning_user_id_11948a2f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_bookowning`
--

LOCK TABLES `book_bookowning` WRITE;
/*!40000 ALTER TABLE `book_bookowning` DISABLE KEYS */;
INSERT INTO `book_bookowning` VALUES (1,'Ja','Ja','2015-01-22 18:13:05',8,1),(2,'Ja','Ja','2015-01-24 13:06:52',13,1),(3,'Nein','Ja','2015-01-24 13:21:13',4,1),(4,'Ja','Ja','2015-01-24 13:31:14',1,1);
/*!40000 ALTER TABLE `book_bookowning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_bookrating`
--

DROP TABLE IF EXISTS `book_bookrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_bookrating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `ratingdate` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_bookrating_user_id_71bc14eb_uniq` (`user_id`,`book_id`),
  KEY `book_bookrating_0a4572cc` (`book_id`),
  KEY `book_bookrating_e8701ad4` (`user_id`),
  CONSTRAINT `book_bookrating_book_id_4b6510e4_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  CONSTRAINT `book_bookrating_user_id_50432772_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_bookrating`
--

LOCK TABLES `book_bookrating` WRITE;
/*!40000 ALTER TABLE `book_bookrating` DISABLE KEYS */;
INSERT INTO `book_bookrating` VALUES (1,1,'2015-01-22 18:13:01',8,1),(2,1,'2015-01-24 10:31:54',10,1),(3,5,'2015-01-24 13:06:55',13,1),(4,5,'2015-01-24 13:21:09',4,1),(5,3,'2015-01-24 13:31:11',1,1);
/*!40000 ALTER TABLE `book_bookrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (1,'Roman'),(39,'Krimi'),(40,'Fantasy'),(41,'Sachbuch'),(42,'Kinderbuch'),(43,'test');
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'author','portal','author'),(8,'book','portal','book'),(9,'book comment','portal','bookcomment'),(10,'book rating','portal','bookrating'),(11,'book owning','portal','bookowning'),(12,'category','portal','category'),(13,'msg','userauth','msg'),(14,'category','film','category'),(15,'film comment','film','filmcomment'),(16,'film owning','film','filmowning'),(17,'participant','film','participant'),(18,'film rating','film','filmrating'),(19,'film','film','film'),(20,'book owning','book','bookowning'),(21,'book rating','book','bookrating'),(22,'book comment','book','bookcomment'),(23,'author','book','author'),(24,'category','book','category'),(25,'book','book','book');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2014-12-27 13:32:21'),(2,'auth','0001_initial','2014-12-27 13:32:39'),(3,'admin','0001_initial','2014-12-27 13:32:44'),(4,'sessions','0001_initial','2014-12-27 13:32:45'),(5,'portal','0001_initial','2014-12-27 14:17:13'),(6,'portal','0002_auto_20150107_1511','2015-01-11 13:21:37'),(7,'portal','0003_book_cover','2015-01-11 13:21:37'),(8,'portal','0004_bookcomment','2015-01-11 13:21:38'),(9,'portal','0005_auto_20150111_1358','2015-01-11 14:33:49'),(10,'portal','0006_bookcomment_commentdate','2015-01-11 14:33:50'),(11,'portal','0007_auto_20150111_1546','2015-01-11 14:46:59'),(12,'portal','0008_auto_20150112_2119','2015-01-16 16:39:24'),(13,'portal','0009_auto_20150112_2208','2015-01-16 16:39:26'),(14,'portal','0010_auto_20150115_2133','2015-01-16 16:39:26'),(15,'portal','0011_auto_20150117_1409','2015-01-17 14:04:53'),(16,'userauth','0001_initial','2015-01-19 14:24:56'),(17,'userauth','0002_auto_20150120_1112','2015-01-20 10:12:38'),(18,'film','0001_initial','2015-01-22 11:24:54'),(19,'film','0002_auto_20150122_1646','2015-01-22 15:46:26'),(20,'book','0001_initial','2015-01-22 15:53:19'),(21,'book','0002_book_booktimestamp','2015-01-23 20:03:18'),(22,'book','0003_book_paegs','2015-01-23 20:03:18'),(23,'book','0004_auto_20150122_2127','2015-01-23 20:03:18'),(24,'film','0003_film_filmtimestamp','2015-01-23 20:03:18'),(25,'film','0004_film_length','2015-01-23 20:03:18');
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
INSERT INTO `django_session` VALUES ('brgeu7z3uit5yhs15yiottxn9gkrzbr6','Y2Q1YjkzZWJjZjJlMzAxYWFiZjcxMGY1OTQ0OGNlYWE1ZWNkOGMxNzp7InNlYXJjaCI6IiIsInJldmVyc2UiOmZhbHNlLCJfYXV0aF91c2VyX2lkIjoxLCJvcmRlckZpbG1zQnkiOiJ5ZWFyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJmaWx0ZXIiOiIiLCJfYXV0aF91c2VyX2hhc2giOiJkNzdjYTEzMjAzNDc1YmJjYzFlZjRjMjg2ZDdiNWE0ZjVmYjI1ZmIxIn0=','2015-02-06 20:07:18'),('jf3s8izk4v0vp944z8va8e2wdq5k0ewi','ZGU5M2I4MTI5M2M2ZGQyYzk3ZTdlMjdmN2M1MTU1NTYzMmQ0MjE3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3N2NhMTMyMDM0NzViYmNjMWVmNGMyODZkN2I1YTRmNWZiMjVmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-02-01 13:22:09'),('lr80hj0z632y626voub6ok7b083nrctn','ZGU5M2I4MTI5M2M2ZGQyYzk3ZTdlMjdmN2M1MTU1NTYzMmQ0MjE3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3N2NhMTMyMDM0NzViYmNjMWVmNGMyODZkN2I1YTRmNWZiMjVmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-01-18 17:46:51'),('us0780omsdnbkxabjqc8h0xqh2jwp0cg','Y2JiZDg1ZjgzYzZlMjZmNTliMTI0NTE2NTc5MzFiYTBiY2EwMTM2Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDc3Y2ExMzIwMzQ3NWJiY2MxZWY0YzI4NmQ3YjVhNGY1ZmIyNWZiMSIsInJldmVyc2UiOmZhbHNlLCJfYXV0aF91c2VyX2lkIjoxLCJvcmRlckJvb2tzQnkiOiJyYXRpbmcifQ==','2015-02-05 18:13:23'),('y4vwcipng7udy9fujl7gv02ve2v7z68s','ZDU2YWQ1NzU4MDkyMTgzYWZmNDU2ZmM5MDdkMWM0M2VlZWJlYTQ1ZTp7InNlYXJjaCI6IiIsInJldmVyc2UiOmZhbHNlLCJfYXV0aF91c2VyX2lkIjoxLCJvcmRlckJvb2tzQnkiOiJ0aXRsZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiZmlsdGVyIjoiIiwib3JkZXJGaWxtc0J5IjoibGVuZ3RoIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzA1Mzg5MDgwNmFlN2UwYTVjY2NlNzE5MWVjNzc5NjhiNTNkOWY3MSJ9','2015-02-07 13:07:46'),('ykncqa9ahxc0xq5tig4ybwxahmqhx2me','ZGZhMzRmMDFkZjY2YjQ2Yzk1N2E0NzMzMzgxMDY1M2NjYzBlZDgzMjp7InNlYXJjaCI6IiIsInJldmVyc2UiOnRydWUsIl9hdXRoX3VzZXJfaWQiOjEsIm9yZGVyQm9va3NCeSI6InRpdGxlIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJmaWx0ZXIiOiIiLCJvcmRlckZpbG1zQnkiOiJyYXRpbmciLCJfYXV0aF91c2VyX2hhc2giOiJkNzdjYTEzMjAzNDc1YmJjYzFlZjRjMjg2ZDdiNWE0ZjVmYjI1ZmIxIn0=','2015-02-05 16:07:22');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_category`
--

DROP TABLE IF EXISTS `film_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_category`
--

LOCK TABLES `film_category` WRITE;
/*!40000 ALTER TABLE `film_category` DISABLE KEYS */;
INSERT INTO `film_category` VALUES (1,'Krimi'),(2,'Mystery'),(3,'Action'),(4,'Drama'),(5,'Romance');
/*!40000 ALTER TABLE `film_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_film`
--

DROP TABLE IF EXISTS `film_film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `year` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `cover` varchar(100) NOT NULL,
  `filmtimestamp` datetime NOT NULL,
  `length` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_film`
--

LOCK TABLES `film_film` WRITE;
/*!40000 ALTER TABLE `film_film` DISABLE KEYS */;
INSERT INTO `film_film` VALUES (1,'Empire','2003','Check out our exclusive video series with the future Academy Museum of Motion Pictures in Los Angeles, featuring stories on IMDb founder Col Needham, creating the costumes of Dallas Buyers Club, casting Elliott in E.T. the Extra-Terrestrial, and more. Learn how you can become a Founding Supporter of the world\'s leading movie museum.Empire','cover/film/20150124/emp_.jpg','2015-01-24 13:12:14','80'),(2,'Das Schweigen der Lämmer ','1991','Check out our exclusive video series with the future Academy Museum of Motion Pictures in Los Angeles, featuring stories on IMDb founder Col Needham, creating the costumes of Dallas Buyers Club, casting Elliott in E.T. the Extra-Terrestrial, and more. Learn how you can become a Founding Supporter of the world\'s leading movie museum.','cover/film/20150124/lamm0_.jpg','2015-01-24 13:17:05','88'),(3,'Minority Report','2012','To find a murder mystery, you should not always go to TV series. Which of these murder mystery films is the best of all time? From David Fincher\'s Seven to the 1931 film, M.','cover/film/20150124/minrep0_.jpg','2015-01-24 13:18:24','94'),(4,'Hateful Eight','2015',' Quentin Tarantino has begun shooting his Western “The Hateful Eight” in Telluride, Colo., for The Weinstein Co., which is planning a release this year.\r\n\r\nJames Parks, Dana Gourrier, Zoe Bell, Gene Jones, Keith Jefferson, Lee Horsley, Craig Stark and Belinda Owino have joined the cast. ','cover/film/20150124/MV5BM_.jpg','2015-01-24 13:10:58','95'),(5,'Verblendung ','2008','\r\nQuentin Tarantino Starts Shooting ‘Hateful Eight’\r\n19 hours ago | Variety - Film News\r\n\r\nQuentin Tarantino has begun shooting his Western “The Hateful Eight” in Telluride, Colo., for The Weinstein Co., which is planning a release this year. James Parks, Dana Gourrier, Zoe Bell, Gene Jones, Keith Jefferson, Lee Horsley, Craig Stark and Belinda Owino have joined the cast. The official ... See more »\r\n','cover/film/20150124/ver.jpg','2015-01-24 13:19:44','116');
/*!40000 ALTER TABLE `film_film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_film_categories`
--

DROP TABLE IF EXISTS `film_film_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_film_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `film_id` (`film_id`,`category_id`),
  KEY `film_film_categories_cd2a3d01` (`film_id`),
  KEY `film_film_categories_b583a629` (`category_id`),
  CONSTRAINT `film_film_categories_category_id_377898f0_fk_film_category_id` FOREIGN KEY (`category_id`) REFERENCES `film_category` (`id`),
  CONSTRAINT `film_film_categories_film_id_25a4a1ae_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_film_categories`
--

LOCK TABLES `film_film_categories` WRITE;
/*!40000 ALTER TABLE `film_film_categories` DISABLE KEYS */;
INSERT INTO `film_film_categories` VALUES (12,1,2),(13,1,3),(14,1,4),(15,2,2),(16,3,2),(11,4,2),(17,5,1);
/*!40000 ALTER TABLE `film_film_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_film_participants`
--

DROP TABLE IF EXISTS `film_film_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_film_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `film_id` (`film_id`,`participant_id`),
  KEY `film_film_participants_cd2a3d01` (`film_id`),
  KEY `film_film_participants_4a3c2f9c` (`participant_id`),
  CONSTRAINT `film_film_participants_film_id_49c14cfa_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`),
  CONSTRAINT `film_film_partici_participant_id_79d27784_fk_film_participant_id` FOREIGN KEY (`participant_id`) REFERENCES `film_participant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_film_participants`
--

LOCK TABLES `film_film_participants` WRITE;
/*!40000 ALTER TABLE `film_film_participants` DISABLE KEYS */;
INSERT INTO `film_film_participants` VALUES (15,1,2),(16,1,3),(17,2,1),(18,2,3),(19,3,1),(20,3,5),(21,3,6),(14,4,2),(22,5,2),(23,5,3),(24,5,4);
/*!40000 ALTER TABLE `film_film_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_filmcomment`
--

DROP TABLE IF EXISTS `film_filmcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_filmcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `commentdate` datetime NOT NULL,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `film_filmcomment_cd2a3d01` (`film_id`),
  KEY `film_filmcomment_e8701ad4` (`user_id`),
  CONSTRAINT `film_filmcomment_film_id_67fabdaa_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`),
  CONSTRAINT `film_filmcomment_user_id_773a9da5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_filmcomment`
--

LOCK TABLES `film_filmcomment` WRITE;
/*!40000 ALTER TABLE `film_filmcomment` DISABLE KEYS */;
INSERT INTO `film_filmcomment` VALUES (1,'fff','2015-01-22 14:52:49',3,1),(2,'ääää','2015-01-22 14:52:53',3,1),(3,'uoup','2015-01-22 14:52:57',3,1),(4,'k','2015-01-22 14:57:52',1,1),(5,'lklj','2015-01-22 15:01:10',1,1),(6,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','2015-01-24 13:22:01',4,1),(7,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.','2015-01-24 13:22:08',1,1),(8,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren.','2015-01-24 13:22:16',5,1);
/*!40000 ALTER TABLE `film_filmcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_filmowning`
--

DROP TABLE IF EXISTS `film_filmowning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_filmowning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `own` varchar(15) NOT NULL,
  `seen` varchar(15) NOT NULL,
  `owningdate` datetime NOT NULL,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `film_filmowning_user_id_f96a8e9_uniq` (`user_id`,`film_id`),
  KEY `film_filmowning_cd2a3d01` (`film_id`),
  KEY `film_filmowning_e8701ad4` (`user_id`),
  CONSTRAINT `film_filmowning_film_id_6e9f80f8_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`),
  CONSTRAINT `film_filmowning_user_id_5fde553d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_filmowning`
--

LOCK TABLES `film_filmowning` WRITE;
/*!40000 ALTER TABLE `film_filmowning` DISABLE KEYS */;
INSERT INTO `film_filmowning` VALUES (1,'Ja','Ja','2015-01-22 14:51:48',3,1),(2,'Ja','Ja','2015-01-22 15:01:06',1,1),(3,'Ja','Ja','2015-01-24 13:18:31',2,1);
/*!40000 ALTER TABLE `film_filmowning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_filmrating`
--

DROP TABLE IF EXISTS `film_filmrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_filmrating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `ratingdate` datetime NOT NULL,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `film_filmrating_user_id_4743547e_uniq` (`user_id`,`film_id`),
  KEY `film_filmrating_cd2a3d01` (`film_id`),
  KEY `film_filmrating_e8701ad4` (`user_id`),
  CONSTRAINT `film_filmrating_film_id_720b6c53_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`),
  CONSTRAINT `film_filmrating_user_id_7dc34288_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_filmrating`
--

LOCK TABLES `film_filmrating` WRITE;
/*!40000 ALTER TABLE `film_filmrating` DISABLE KEYS */;
INSERT INTO `film_filmrating` VALUES (1,3,'2015-01-22 14:51:42',3,1),(2,3,'2015-01-22 15:01:01',1,1),(3,4,'2015-01-24 13:18:34',2,1);
/*!40000 ALTER TABLE `film_filmrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_participant`
--

DROP TABLE IF EXISTS `film_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `role` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_participant`
--

LOCK TABLES `film_participant` WRITE;
/*!40000 ALTER TABLE `film_participant` DISABLE KEYS */;
INSERT INTO `film_participant` VALUES (1,'Dieter','Mueller','director'),(2,'Dieter','Mueller','director'),(3,'Hans','Hermann','star'),(4,'Lars','Richter','star'),(5,'Tom','Hanks','star'),(6,'Cruse','Tom','star');
/*!40000 ALTER TABLE `film_participant` ENABLE KEYS */;
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
  `msgdate` datetime DEFAULT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userauth_msg_6b4f059f` (`from_user_id`),
  KEY `userauth_msg_63add04c` (`to_user_id`),
  CONSTRAINT `userauth_msg_from_user_id_6f2e5b5c_fk_auth_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `userauth_msg_to_user_id_2bf28fc1_fk_auth_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauth_msg`
--

LOCK TABLES `userauth_msg` WRITE;
/*!40000 ALTER TABLE `userauth_msg` DISABLE KEYS */;
INSERT INTO `userauth_msg` VALUES (1,'test','123','2015-01-20 09:10:26',2,1),(5,'Hallo','Nur ein kleiner TestNur ein kleiner Test Nur ein kleiner Test\r\nNur ein kleiner Test\r\nNur ein kleiner TestNur ein kleiner TestNur ein kleiner TestNur ein kleiner Test','2015-01-20 09:44:30',1,2),(6,'Hallo nochmal','wieder ein Test','2015-01-20 09:44:52',1,2),(7,'Noch mal test','Hallo gst','2015-01-20 10:11:12',1,2),(8,'Hallo buffy','Nochmal ein etwas längerer Text Nochmal ein etwas längerer Text Nochmal ein etwas längerer Text\r\nNochmal ein etwas längerer Text Nochmal ein etwas längerer Text\r\nNochmal ein etwas längerer TextNochmal ein etwas längerer Text Nochmal ein etwas längerer Text\r\nNochmal ein etwas längerer Text\r\n','2015-01-20 10:14:36',2,1),(9,'Viel Text','The 2015 Sundance Film Festival has started, and we\'re in Park City with coverage of the screenings, the street scene, and parties. Visit our Sundance section, brought to you by IMDb & Amazon Instant Video, to see the films we\'re excited about, plus browse our mini-guide, trailers, photos, and more!\r\nThe 2015 Sundance Film Festival has started, and we\'re in Park City with coverage of the screenings, the street scene, and parties. Visit our Sundance section, brought to you by IMDb & Amazon Instant Video, to see the films we\'re excited about, plus browse our mini-guide, trailers, photos, and more!\r\nThe 2015 Sundance Film Festival has started, and we\'re in Park City with coverage of the screenings, the street scene, and parties. Visit our Sundance section, brought to you by IMDb & Amazon Instant Video, to see the films we\'re excited about, plus browse our mini-guide, trailers, photos, and more!','2015-01-24 13:32:19',1,2);
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

-- Dump completed on 2015-01-24 14:34:44
