-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Jan 2015 um 21:51
-- Server Version: 5.6.16
-- PHP-Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `medialib`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'contentmanager'),
(2, 'standarduser');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 12);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Daten für Tabelle `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add author', 7, 'add_author'),
(20, 'Can change author', 7, 'change_author'),
(21, 'Can delete author', 7, 'delete_author'),
(22, 'Can add book', 8, 'add_book'),
(23, 'Can change book', 8, 'change_book'),
(24, 'Can delete book', 8, 'delete_book'),
(25, 'Can add book comment', 9, 'add_bookcomment'),
(26, 'Can change book comment', 9, 'change_bookcomment'),
(27, 'Can delete book comment', 9, 'delete_bookcomment'),
(28, 'Can add book rating', 10, 'add_bookrating'),
(29, 'Can change book rating', 10, 'change_bookrating'),
(30, 'Can delete book rating', 10, 'delete_bookrating'),
(31, 'Can add book owning', 11, 'add_bookowning'),
(32, 'Can change book owning', 11, 'change_bookowning'),
(33, 'Can delete book owning', 11, 'delete_bookowning'),
(34, 'Can add category', 12, 'add_category'),
(35, 'Can change category', 12, 'change_category'),
(36, 'Can delete category', 12, 'delete_category'),
(37, 'Can add msg', 13, 'add_msg'),
(38, 'Can change msg', 13, 'change_msg'),
(39, 'Can delete msg', 13, 'delete_msg'),
(40, 'Can add category', 14, 'add_category'),
(41, 'Can change category', 14, 'change_category'),
(42, 'Can delete category', 14, 'delete_category'),
(43, 'Can add film comment', 15, 'add_filmcomment'),
(44, 'Can change film comment', 15, 'change_filmcomment'),
(45, 'Can delete film comment', 15, 'delete_filmcomment'),
(46, 'Can add film owning', 16, 'add_filmowning'),
(47, 'Can change film owning', 16, 'change_filmowning'),
(48, 'Can delete film owning', 16, 'delete_filmowning'),
(49, 'Can add participant', 17, 'add_participant'),
(50, 'Can change participant', 17, 'change_participant'),
(51, 'Can delete participant', 17, 'delete_participant'),
(52, 'Can add film rating', 18, 'add_filmrating'),
(53, 'Can change film rating', 18, 'change_filmrating'),
(54, 'Can delete film rating', 18, 'delete_filmrating'),
(55, 'Can add film', 19, 'add_film'),
(56, 'Can change film', 19, 'change_film'),
(57, 'Can delete film', 19, 'delete_film'),
(58, 'Can add book owning', 20, 'add_bookowning'),
(59, 'Can change book owning', 20, 'change_bookowning'),
(60, 'Can delete book owning', 20, 'delete_bookowning'),
(61, 'Can add book rating', 21, 'add_bookrating'),
(62, 'Can change book rating', 21, 'change_bookrating'),
(63, 'Can delete book rating', 21, 'delete_bookrating'),
(64, 'Can add book comment', 22, 'add_bookcomment'),
(65, 'Can change book comment', 22, 'change_bookcomment'),
(66, 'Can delete book comment', 22, 'delete_bookcomment'),
(67, 'Can add author', 23, 'add_author'),
(68, 'Can change author', 23, 'change_author'),
(69, 'Can delete author', 23, 'delete_author'),
(70, 'Can add category', 24, 'add_category'),
(71, 'Can change category', 24, 'change_category'),
(72, 'Can delete category', 24, 'delete_category'),
(73, 'Can add book', 25, 'add_book'),
(74, 'Can change book', 25, 'change_book'),
(75, 'Can delete book', 25, 'delete_book');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Daten für Tabelle `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$VPCmwOuglIhZ$0z5er7B19PFqewO8JpyYNNZ2fh6techf8NaGszbZKiw=', '2015-01-22 20:49:12', 1, 'buffy', 'Beate', '', 'buffy@test.de', 1, 1, '2015-01-02 16:05:18'),
(2, 'pbkdf2_sha256$12000$qsoNTYoR4rHq$CyJd4y7JhWgx9ZOyaNjzyu6/RCim4IlRFIj3BUtQMvM=', '2015-01-20 13:32:06', 0, 'gst', '', '', 'gst@netuse.de', 0, 1, '2015-01-04 14:02:41'),
(3, 'pbkdf2_sha256$12000$WI5kilzxTlka$3IxYz4f3LEpn1aNm6jrnTSYOX98lgqAebPBQxpcLPhw=', '2015-01-11 16:25:29', 0, 'tt', 'Peter', 'Lustig', 'tt@fd.fr', 0, 1, '2015-01-04 14:05:24'),
(4, 'pbkdf2_sha256$12000$sUKCzClit7yj$QWIdSfCWW1SUxHE1S82JmIJTNeeVEBFQikTUOUx1FNg=', '2015-01-11 16:45:57', 0, 'hans', '', '', 'h@x.de', 0, 0, '2015-01-11 16:45:31'),
(5, 'pbkdf2_sha256$12000$Ksys5bZtD8oE$6Zk4NWM9ESpzEcXFasB63GnM9sM32VZy6AF79CqXq+Q=', '2015-01-20 13:52:16', 0, 'dragos', 'Dirk', 'Mustermann', 'd@xxx.de', 0, 1, '2015-01-20 13:52:16'),
(6, 'pbkdf2_sha256$12000$IFO3jH6DidAm$FooP5T2J9TZ0Dgbz1ear9GPXdRZQ/48Ja4TUKQHVTew=', '2015-01-20 13:59:56', 0, 'rrr', 'Ralf', 'Ramse', 'r@e.de', 0, 1, '2015-01-20 13:59:56'),
(7, 'pbkdf2_sha256$12000$drRChVEK09LG$j9erb81djYhwujRzowuuk1oGGbfoTS5TIMQznIg0DPc=', '2015-01-20 14:01:21', 0, 'rrr2', 'Ralf', 'Ramse', 'r@e.de', 0, 0, '2015-01-20 14:01:13');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 1, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_author`
--

CREATE TABLE IF NOT EXISTS `book_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Daten für Tabelle `book_author`
--

INSERT INTO `book_author` (`id`, `firstname`, `lastname`) VALUES
(1, 'Hans-Peter', 'Anderson'),
(2, 'Tannenbaum', 'Andrew S.'),
(3, 'Kate', 'White'),
(4, 'Gumm', 'Prof. Dr. Heinz Peter'),
(5, 'Sommer', 'Prof. Dr. Manfred'),
(6, 'Karl', 'Heinz'),
(13, 'Hans-Dieter', 'Neuwingen'),
(14, 'Karl', 'Koch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_book`
--

CREATE TABLE IF NOT EXISTS `book_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `cover` varchar(100) NOT NULL,
  `booktimestamp` datetime NOT NULL,
  `pages` varchar(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Daten für Tabelle `book_book`
--

INSERT INTO `book_book` (`id`, `title`, `isbn`, `description`, `cover`, `booktimestamp`, `pages`) VALUES
(1, 'Wenn Blicke töten könnten', '9786-3666-4426-3667', 'Gerade nicht so wichtig', 'cover/default/default.png', '2015-01-08 20:01:20', '0'),
(4, 'Die Wüste', '2323-4433-4455-6789', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', 'cover/default/default.png', '2015-01-20 20:01:20', '0'),
(6, 'Einführung in die Informatik', '978-3-486-59711-0', 'lWhether you''re new to programming or an experienced developer, it''s easy to learn and use Python.', 'cover/default/default.png', '2015-01-22 20:01:20', '0'),
(7, 'Betriebssysteme', '44444-2323-1212-1212', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ', 'cover/20150120/error2.jpg', '2015-01-22 12:01:20', '0'),
(8, 'Aurora', '2323-5678-1298-0000', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.', 'cover/default/default.png', '2015-01-22 20:01:20', '0'),
(9, 'Das Märchenbuch', '1234-1111-2222-3333', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', 'cover/default/default.png', '2015-01-19 03:19:20', '0'),
(10, 'Experimentalphysik ', '2323-4444-5555-6666', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. ', 'cover/default/default.png', '2015-01-22 13:21:20', '0'),
(12, 'Cobra', '1234-1234-1234-FF12', '11', 'cover/default/default.png', '2015-01-06 20:01:20', '0'),
(13, 'Der Herr der Ringe Band 1', '1234-5678-2222-12G2', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', 'cover/default/default.png', '2015-01-22 20:01:20', '0');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_bookcomment`
--

CREATE TABLE IF NOT EXISTS `book_bookcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `commentdate` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_bookcomment_0a4572cc` (`book_id`),
  KEY `book_bookcomment_e8701ad4` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_bookowning`
--

CREATE TABLE IF NOT EXISTS `book_bookowning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `own` varchar(15) NOT NULL,
  `read` varchar(15) NOT NULL,
  `owningdate` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_bookowning_user_id_1cdbd16e_uniq` (`user_id`,`book_id`),
  KEY `book_bookowning_0a4572cc` (`book_id`),
  KEY `book_bookowning_e8701ad4` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_bookrating`
--

CREATE TABLE IF NOT EXISTS `book_bookrating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `ratingdate` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_bookrating_user_id_71bc14eb_uniq` (`user_id`,`book_id`),
  KEY `book_bookrating_0a4572cc` (`book_id`),
  KEY `book_bookrating_e8701ad4` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_book_authors`
--

CREATE TABLE IF NOT EXISTS `book_book_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_id` (`book_id`,`author_id`),
  KEY `book_book_authors_0a4572cc` (`book_id`),
  KEY `book_book_authors_4f331e2f` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Daten für Tabelle `book_book_authors`
--

INSERT INTO `book_book_authors` (`id`, `book_id`, `author_id`) VALUES
(51, 1, 3),
(46, 4, 3),
(1, 6, 5),
(50, 7, 2),
(49, 8, 6),
(43, 9, 6),
(47, 10, 4),
(48, 10, 5),
(44, 12, 13),
(45, 13, 14);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_book_categories`
--

CREATE TABLE IF NOT EXISTS `book_book_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_id` (`book_id`,`category_id`),
  KEY `book_book_categories_0a4572cc` (`book_id`),
  KEY `book_book_categories_b583a629` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Daten für Tabelle `book_book_categories`
--

INSERT INTO `book_book_categories` (`id`, `book_id`, `category_id`) VALUES
(28, 1, 39),
(23, 4, 41),
(18, 6, 41),
(27, 7, 41),
(26, 8, 1),
(25, 8, 40),
(19, 9, 40),
(24, 10, 41),
(20, 12, 1),
(21, 12, 39),
(22, 13, 40);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_category`
--

CREATE TABLE IF NOT EXISTS `book_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Daten für Tabelle `book_category`
--

INSERT INTO `book_category` (`id`, `categoryname`) VALUES
(1, 'Roman'),
(39, 'Krimi'),
(40, 'Fantasy'),
(41, 'Sachbuch'),
(42, 'Kinderbuch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
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
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2015-01-02 16:07:35', '1', 'Book object', 1, '', 8, 1),
(2, '2015-01-02 16:08:03', '3', 'Author object', 2, 'Changed firstname and lastname.', 7, 1),
(3, '2015-01-02 16:55:59', '2', 'Andrew S., Tannenbaum', 2, 'Changed firstname and lastname.', 7, 1),
(4, '2015-01-02 16:56:43', '4', 'Prof. Dr. Heinz Peter, Gumm', 1, '', 7, 1),
(5, '2015-01-02 16:57:02', '5', 'Prof. Dr. Manfred, Sommer', 1, '', 7, 1),
(6, '2015-01-02 17:02:07', '4', 'Test', 1, '', 8, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Daten für Tabelle `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'author', 'portal', 'author'),
(8, 'book', 'portal', 'book'),
(9, 'book comment', 'portal', 'bookcomment'),
(10, 'book rating', 'portal', 'bookrating'),
(11, 'book owning', 'portal', 'bookowning'),
(12, 'category', 'portal', 'category'),
(13, 'msg', 'userauth', 'msg'),
(14, 'category', 'film', 'category'),
(15, 'film comment', 'film', 'filmcomment'),
(16, 'film owning', 'film', 'filmowning'),
(17, 'participant', 'film', 'participant'),
(18, 'film rating', 'film', 'filmrating'),
(19, 'film', 'film', 'film'),
(20, 'book owning', 'book', 'bookowning'),
(21, 'book rating', 'book', 'bookrating'),
(22, 'book comment', 'book', 'bookcomment'),
(23, 'author', 'book', 'author'),
(24, 'category', 'book', 'category'),
(25, 'book', 'book', 'book');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Daten für Tabelle `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2014-12-27 13:32:21'),
(2, 'auth', '0001_initial', '2014-12-27 13:32:39'),
(3, 'admin', '0001_initial', '2014-12-27 13:32:44'),
(4, 'sessions', '0001_initial', '2014-12-27 13:32:45'),
(5, 'portal', '0001_initial', '2014-12-27 14:17:13'),
(6, 'portal', '0002_auto_20150107_1511', '2015-01-11 13:21:37'),
(7, 'portal', '0003_book_cover', '2015-01-11 13:21:37'),
(8, 'portal', '0004_bookcomment', '2015-01-11 13:21:38'),
(9, 'portal', '0005_auto_20150111_1358', '2015-01-11 14:33:49'),
(10, 'portal', '0006_bookcomment_commentdate', '2015-01-11 14:33:50'),
(11, 'portal', '0007_auto_20150111_1546', '2015-01-11 14:46:59'),
(12, 'portal', '0008_auto_20150112_2119', '2015-01-16 16:39:24'),
(13, 'portal', '0009_auto_20150112_2208', '2015-01-16 16:39:26'),
(14, 'portal', '0010_auto_20150115_2133', '2015-01-16 16:39:26'),
(15, 'portal', '0011_auto_20150117_1409', '2015-01-17 14:04:53'),
(16, 'userauth', '0001_initial', '2015-01-19 14:24:56'),
(17, 'userauth', '0002_auto_20150120_1112', '2015-01-20 10:12:38'),
(18, 'film', '0001_initial', '2015-01-22 11:24:54'),
(19, 'film', '0002_auto_20150122_1646', '2015-01-22 15:46:26'),
(20, 'book', '0001_initial', '2015-01-22 15:53:19'),
(21, 'book', '0002_book_booktimestamp', '2015-01-22 20:01:26'),
(22, 'film', '0003_film_filmtimestamp', '2015-01-22 20:24:47'),
(23, 'book', '0003_book_paegs', '2015-01-22 20:26:55'),
(24, 'film', '0004_film_length', '2015-01-22 20:26:57'),
(25, 'book', '0004_auto_20150122_2127', '2015-01-22 20:27:19');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ij64ewk42g7otjf77iaqf1bkmuthroki', 'ZGU5M2I4MTI5M2M2ZGQyYzk3ZTdlMjdmN2M1MTU1NTYzMmQ0MjE3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3N2NhMTMyMDM0NzViYmNjMWVmNGMyODZkN2I1YTRmNWZiMjVmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-02-05 20:49:13'),
('jf3s8izk4v0vp944z8va8e2wdq5k0ewi', 'ZGU5M2I4MTI5M2M2ZGQyYzk3ZTdlMjdmN2M1MTU1NTYzMmQ0MjE3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3N2NhMTMyMDM0NzViYmNjMWVmNGMyODZkN2I1YTRmNWZiMjVmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-02-01 13:22:09'),
('lr80hj0z632y626voub6ok7b083nrctn', 'ZGU5M2I4MTI5M2M2ZGQyYzk3ZTdlMjdmN2M1MTU1NTYzMmQ0MjE3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3N2NhMTMyMDM0NzViYmNjMWVmNGMyODZkN2I1YTRmNWZiMjVmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-01-18 17:46:51'),
('ykncqa9ahxc0xq5tig4ybwxahmqhx2me', 'ZGZhMzRmMDFkZjY2YjQ2Yzk1N2E0NzMzMzgxMDY1M2NjYzBlZDgzMjp7InNlYXJjaCI6IiIsInJldmVyc2UiOnRydWUsIl9hdXRoX3VzZXJfaWQiOjEsIm9yZGVyQm9va3NCeSI6InRpdGxlIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJmaWx0ZXIiOiIiLCJvcmRlckZpbG1zQnkiOiJyYXRpbmciLCJfYXV0aF91c2VyX2hhc2giOiJkNzdjYTEzMjAzNDc1YmJjYzFlZjRjMjg2ZDdiNWE0ZjVmYjI1ZmIxIn0=', '2015-02-05 16:07:22');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film_category`
--

CREATE TABLE IF NOT EXISTS `film_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `film_category`
--

INSERT INTO `film_category` (`id`, `categoryname`) VALUES
(1, 'Krimi'),
(2, 'Mystery');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film_film`
--

CREATE TABLE IF NOT EXISTS `film_film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `year` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `cover` varchar(100) NOT NULL,
  `filmtimestamp` datetime NOT NULL,
  `length` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `film_film`
--

INSERT INTO `film_film` (`id`, `title`, `year`, `description`, `cover`, `filmtimestamp`, `length`) VALUES
(1, 'eeeee', '1999', 'xxx', 'cover/default/default.png', '2015-01-22 20:24:42', '0'),
(2, 'rrr', '1987', 'c', 'cover/default/default.png', '2015-01-22 20:24:42', '0'),
(3, 'ZZZ', '2012', 'yyyy', 'cover/default/default.png', '2015-01-22 20:24:42', '0');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film_filmcomment`
--

CREATE TABLE IF NOT EXISTS `film_filmcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `commentdate` datetime NOT NULL,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `film_filmcomment_cd2a3d01` (`film_id`),
  KEY `film_filmcomment_e8701ad4` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `film_filmcomment`
--

INSERT INTO `film_filmcomment` (`id`, `text`, `commentdate`, `film_id`, `user_id`) VALUES
(1, 'fff', '2015-01-22 14:52:49', 3, 1),
(2, 'ääää', '2015-01-22 14:52:53', 3, 1),
(3, 'uoup', '2015-01-22 14:52:57', 3, 1),
(4, 'k', '2015-01-22 14:57:52', 1, 1),
(5, 'lklj', '2015-01-22 15:01:10', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film_filmowning`
--

CREATE TABLE IF NOT EXISTS `film_filmowning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `own` varchar(15) NOT NULL,
  `seen` varchar(15) NOT NULL,
  `owningdate` datetime NOT NULL,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `film_filmowning_user_id_f96a8e9_uniq` (`user_id`,`film_id`),
  KEY `film_filmowning_cd2a3d01` (`film_id`),
  KEY `film_filmowning_e8701ad4` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `film_filmowning`
--

INSERT INTO `film_filmowning` (`id`, `own`, `seen`, `owningdate`, `film_id`, `user_id`) VALUES
(1, 'Ja', 'Ja', '2015-01-22 14:51:48', 3, 1),
(2, 'Ja', 'Ja', '2015-01-22 15:01:06', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film_filmrating`
--

CREATE TABLE IF NOT EXISTS `film_filmrating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `ratingdate` datetime NOT NULL,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `film_filmrating_user_id_4743547e_uniq` (`user_id`,`film_id`),
  KEY `film_filmrating_cd2a3d01` (`film_id`),
  KEY `film_filmrating_e8701ad4` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `film_filmrating`
--

INSERT INTO `film_filmrating` (`id`, `rating`, `ratingdate`, `film_id`, `user_id`) VALUES
(1, 3, '2015-01-22 14:51:42', 3, 1),
(2, 3, '2015-01-22 15:01:01', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film_film_categories`
--

CREATE TABLE IF NOT EXISTS `film_film_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `film_id` (`film_id`,`category_id`),
  KEY `film_film_categories_cd2a3d01` (`film_id`),
  KEY `film_film_categories_b583a629` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `film_film_categories`
--

INSERT INTO `film_film_categories` (`id`, `film_id`, `category_id`) VALUES
(1, 1, 1),
(5, 2, 2),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film_film_participants`
--

CREATE TABLE IF NOT EXISTS `film_film_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `film_id` (`film_id`,`participant_id`),
  KEY `film_film_participants_cd2a3d01` (`film_id`),
  KEY `film_film_participants_4a3c2f9c` (`participant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `film_film_participants`
--

INSERT INTO `film_film_participants` (`id`, `film_id`, `participant_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(7, 2, 1),
(8, 2, 3),
(5, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film_participant`
--

CREATE TABLE IF NOT EXISTS `film_participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `role` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `film_participant`
--

INSERT INTO `film_participant` (`id`, `firstname`, `lastname`, `role`) VALUES
(1, 'Dieter', 'Mueller', 'director'),
(2, 'Dieter', 'Mueller', 'director'),
(3, 'Hans', 'Hermann', 'star');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userauth_msg`
--

CREATE TABLE IF NOT EXISTS `userauth_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(40) NOT NULL,
  `text` longtext NOT NULL,
  `msgdate` datetime DEFAULT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userauth_msg_6b4f059f` (`from_user_id`),
  KEY `userauth_msg_63add04c` (`to_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `userauth_msg`
--

INSERT INTO `userauth_msg` (`id`, `subject`, `text`, `msgdate`, `from_user_id`, `to_user_id`) VALUES
(1, 'test', '123', '2015-01-20 09:10:26', 2, 1),
(4, 'test2', '123', '2015-01-20 09:13:33', 2, 1),
(5, 'Hallo', 'Nur ein kleiner TestNur ein kleiner Test Nur ein kleiner Test\r\nNur ein kleiner Test\r\nNur ein kleiner TestNur ein kleiner TestNur ein kleiner TestNur ein kleiner Test', '2015-01-20 09:44:30', 1, 2),
(6, 'Hallo nochmal', 'wieder ein Test', '2015-01-20 09:44:52', 1, 2),
(7, 'Noch mal test', 'Hallo gst', '2015-01-20 10:11:12', 1, 2),
(8, 'Hallo buffy', 'Nochmal ein etwas längerer Text Nochmal ein etwas längerer Text Nochmal ein etwas längerer Text\r\nNochmal ein etwas längerer Text Nochmal ein etwas längerer Text\r\nNochmal ein etwas längerer TextNochmal ein etwas längerer Text Nochmal ein etwas längerer Text\r\nNochmal ein etwas längerer Text\r\n', '2015-01-20 10:14:36', 2, 1);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints der Tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints der Tabelle `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints der Tabelle `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints der Tabelle `book_bookcomment`
--
ALTER TABLE `book_bookcomment`
  ADD CONSTRAINT `book_bookcomment_book_id_54573fcd_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `book_bookcomment_user_id_541f5e83_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints der Tabelle `book_bookowning`
--
ALTER TABLE `book_bookowning`
  ADD CONSTRAINT `book_bookowning_book_id_48500627_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `book_bookowning_user_id_11948a2f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints der Tabelle `book_bookrating`
--
ALTER TABLE `book_bookrating`
  ADD CONSTRAINT `book_bookrating_book_id_4b6510e4_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `book_bookrating_user_id_50432772_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints der Tabelle `book_book_authors`
--
ALTER TABLE `book_book_authors`
  ADD CONSTRAINT `book_book_authors_author_id_1fe658e4_fk_book_author_id` FOREIGN KEY (`author_id`) REFERENCES `book_author` (`id`),
  ADD CONSTRAINT `book_book_authors_book_id_7b19abf0_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`);

--
-- Constraints der Tabelle `book_book_categories`
--
ALTER TABLE `book_book_categories`
  ADD CONSTRAINT `book_book_categories_book_id_109934e3_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `book_book_categories_category_id_ab9533a_fk_book_category_id` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`id`);

--
-- Constraints der Tabelle `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints der Tabelle `film_filmcomment`
--
ALTER TABLE `film_filmcomment`
  ADD CONSTRAINT `film_filmcomment_film_id_67fabdaa_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`),
  ADD CONSTRAINT `film_filmcomment_user_id_773a9da5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints der Tabelle `film_filmowning`
--
ALTER TABLE `film_filmowning`
  ADD CONSTRAINT `film_filmowning_film_id_6e9f80f8_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`),
  ADD CONSTRAINT `film_filmowning_user_id_5fde553d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints der Tabelle `film_filmrating`
--
ALTER TABLE `film_filmrating`
  ADD CONSTRAINT `film_filmrating_film_id_720b6c53_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`),
  ADD CONSTRAINT `film_filmrating_user_id_7dc34288_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints der Tabelle `film_film_categories`
--
ALTER TABLE `film_film_categories`
  ADD CONSTRAINT `film_film_categories_category_id_377898f0_fk_film_category_id` FOREIGN KEY (`category_id`) REFERENCES `film_category` (`id`),
  ADD CONSTRAINT `film_film_categories_film_id_25a4a1ae_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`);

--
-- Constraints der Tabelle `film_film_participants`
--
ALTER TABLE `film_film_participants`
  ADD CONSTRAINT `film_film_partici_participant_id_79d27784_fk_film_participant_id` FOREIGN KEY (`participant_id`) REFERENCES `film_participant` (`id`),
  ADD CONSTRAINT `film_film_participants_film_id_49c14cfa_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`);

--
-- Constraints der Tabelle `userauth_msg`
--
ALTER TABLE `userauth_msg`
  ADD CONSTRAINT `userauth_msg_from_user_id_6f2e5b5c_fk_auth_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `userauth_msg_to_user_id_2bf28fc1_fk_auth_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
