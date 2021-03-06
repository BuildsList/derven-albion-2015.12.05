CREATE DATABASE  IF NOT EXISTS `feedback` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `feedback`;

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
-- Table structure for table `erro_admin`
--

DROP TABLE IF EXISTS `erro_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erro_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ckey` varchar(32) NOT NULL,
  `rank` varchar(32) NOT NULL DEFAULT 'Administrator',
  `flags` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erro_admin_log`
--

DROP TABLE IF EXISTS `erro_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erro_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `adminckey` varchar(32) NOT NULL,
  `adminip` varchar(18) NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erro_admin_ranks`
--

DROP TABLE IF EXISTS `erro_admin_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erro_admin_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` varchar(40) NOT NULL,
  `flags` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

insert into erro_admin_ranks (rank, flags) values ('Moderator',2);
insert into erro_admin_ranks (rank, flags) values ('Admin Candidate',2);
insert into erro_admin_ranks (rank, flags) values ('Trial Admin',5638);
insert into erro_admin_ranks (rank, flags) values ('Badmin',5727);
insert into erro_admin_ranks (rank, flags) values ('Game Admin',8063);
insert into erro_admin_ranks (rank, flags) values ('Game Master',65535);
insert into erro_admin_ranks (rank, flags) values ('Host',65535);
insert into erro_admin_ranks (rank, flags) values ('Coder',5168);

--
-- Table structure for table `erro_ban`
--

DROP TABLE IF EXISTS `erro_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erro_ban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bantime` datetime NOT NULL,
  `serverip` varchar(32) NOT NULL,
  `bantype` varchar(32) NOT NULL,
  `reason` text NOT NULL,
  `job` varchar(32) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `rounds` int(11) DEFAULT NULL,
  `expiration_time` datetime NOT NULL,
  `ckey` varchar(32) NOT NULL,
  `computerid` varchar(32) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `a_ckey` varchar(32) NOT NULL,
  `a_computerid` varchar(32) NOT NULL,
  `a_ip` varchar(32) NOT NULL,
  `who` text NOT NULL,
  `adminwho` text NOT NULL,
  `edits` text,
  `unbanned` int(2) DEFAULT NULL,
  `unbanned_datetime` datetime DEFAULT NULL,
  `unbanned_ckey` varchar(32) DEFAULT NULL,
  `unbanned_computerid` varchar(32) DEFAULT NULL,
  `unbanned_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erro_feedback`
--

DROP TABLE IF EXISTS `erro_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erro_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `round_id` int(8) NOT NULL,
  `var_name` varchar(32) NOT NULL,
  `var_value` int(16) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erro_library`
--

DROP TABLE IF EXISTS `erro_library`;
CREATE TABLE `erro_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `category` varchar(45) NOT NULL,
  `ckey` varchar(45) DEFAULT 'LEGACY',
  `datetime` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `erro_player`
--

DROP TABLE IF EXISTS `erro_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erro_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ckey` varchar(32) NOT NULL,
  `firstseen` datetime NOT NULL,
  `lastseen` datetime NOT NULL,
  `ip` varchar(18) NOT NULL,
  `computerid` varchar(32) NOT NULL,
  `lastadminrank` varchar(32) NOT NULL DEFAULT 'Player',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`ckey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-24 18:02:35
