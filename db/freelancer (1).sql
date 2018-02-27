-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 27, 2018 at 01:29 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freelancer`
--

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `symbol` varchar(40) NOT NULL,
  `datemodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exchangerates`
--

DROP TABLE IF EXISTS `exchangerates`;
CREATE TABLE IF NOT EXISTS `exchangerates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency1_id` int(11) NOT NULL,
  `currency2_id` int(11) NOT NULL,
  `DateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `joblogs`
--

DROP TABLE IF EXISTS `joblogs`;
CREATE TABLE IF NOT EXISTS `joblogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` int(11) NOT NULL,
  `description` text NOT NULL,
  `userid` varchar(49) NOT NULL,
  `dateposted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobpayments`
--

DROP TABLE IF EXISTS `jobpayments`;
CREATE TABLE IF NOT EXISTS `jobpayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` int(11) NOT NULL,
  `paymentmodeid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 is sent ,2 is received , 3 is complete',
  `dateregistered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobplatform`
--

DROP TABLE IF EXISTS `jobplatform`;
CREATE TABLE IF NOT EXISTS `jobplatform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` int(11) NOT NULL,
  `platformid` int(11) NOT NULL,
  `assignstatus` int(11) NOT NULL DEFAULT '0' COMMENT '0 not assigned ,1 assigned',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobplatform`
--

INSERT INTO `jobplatform` (`id`, `jobid`, `platformid`, `assignstatus`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(3, 1, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobproposal`
--

DROP TABLE IF EXISTS `jobproposal`;
CREATE TABLE IF NOT EXISTS `jobproposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` int(11) NOT NULL,
  `freelacer_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `budget` double NOT NULL,
  `platformid` int(11) NOT NULL,
  `datemodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `budget` double NOT NULL,
  `requester_id` int(11) NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `dateposted` date NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 open ,2 in progress ,3 closed ',
  `datemodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `description`, `budget`, `requester_id`, `assignee_id`, `dateposted`, `status`, `datemodified`, `title`) VALUES
(1, 'test data', 2562, 2, NULL, '2018-02-27', 0, '2018-02-27 13:28:08', 'Advertising Campaign');

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

DROP TABLE IF EXISTS `months`;
CREATE TABLE IF NOT EXISTS `months` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(30) NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethods`
--

DROP TABLE IF EXISTS `paymentmethods`;
CREATE TABLE IF NOT EXISTS `paymentmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `tel` varchar(70) DEFAULT NULL COMMENT 'phone number',
  `dateregistered` date NOT NULL,
  `datemodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `name`, `email`, `tel`, `dateregistered`, `datemodified`) VALUES
(1, 'Freelance User', 'freelancer@techcube.co.ke', '0728944815', '2018-02-20', '2018-02-20 13:48:27'),
(2, 'Client User', 'client@techcube.co.ke', '0728944815', '2018-02-27', '2018-02-27 05:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `personjobs`
--

DROP TABLE IF EXISTS `personjobs`;
CREATE TABLE IF NOT EXISTS `personjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) NOT NULL,
  `jobs` int(11) NOT NULL,
  `monthid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personplatforms`
--

DROP TABLE IF EXISTS `personplatforms`;
CREATE TABLE IF NOT EXISTS `personplatforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) NOT NULL,
  `platformid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url_link` varchar(100) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 active , 2 inactive ',
  `dateadded` date NOT NULL,
  `datemodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personproposal`
--

DROP TABLE IF EXISTS `personproposal`;
CREATE TABLE IF NOT EXISTS `personproposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) NOT NULL,
  `proposals` int(11) NOT NULL,
  `monthid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personroles`
--

DROP TABLE IF EXISTS `personroles`;
CREATE TABLE IF NOT EXISTS `personroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `DateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personroles`
--

INSERT INTO `personroles` (`id`, `personid`, `roleid`, `DateModified`) VALUES
(1, 1, 2, '2018-02-20 13:48:27'),
(2, 2, 1, '2018-02-27 05:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `personsubscription`
--

DROP TABLE IF EXISTS `personsubscription`;
CREATE TABLE IF NOT EXISTS `personsubscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) NOT NULL,
  `subscriptionid` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT 'active , inactive, suspended',
  `DateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personid` (`personid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
CREATE TABLE IF NOT EXISTS `platforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `platforms`
--

INSERT INTO `platforms` (`id`, `name`) VALUES
(1, 'Facebook'),
(2, 'Twitter'),
(3, 'Instagram'),
(4, 'WhatsApp');

-- --------------------------------------------------------

--
-- Table structure for table `roletypes`
--

DROP TABLE IF EXISTS `roletypes`;
CREATE TABLE IF NOT EXISTS `roletypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roletypes`
--

INSERT INTO `roletypes` (`id`, `role`, `dateadded`) VALUES
(1, 'Client', '2018-02-05 16:51:08'),
(2, 'Freelancer', '2018-02-05 16:51:08'),
(3, 'Admin', '2018-02-05 16:51:15');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL,
  `main_name` varchar(200) NOT NULL,
  `main_location` varchar(200) NOT NULL,
  `main_tel` varchar(200) NOT NULL,
  `main_address` varchar(200) DEFAULT NULL,
  `dateadded` date NOT NULL,
  `datemodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `main_name`, `main_location`, `main_tel`, `main_address`, `dateadded`, `datemodified`) VALUES
(1, 'Freelance Plus', 'Nairobi Kenya', '0928944815', 'Westlands Kenya', '2016-09-05', '2018-02-05 18:00:58');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE IF NOT EXISTS `subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `jobslimit` int(11) NOT NULL,
  `proposalslimit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) NOT NULL,
  `hashpassword` varchar(300) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 for active, 2 for inactive, 3 for suspended',
  `datemodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personid` (`personid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `personid`, `hashpassword`, `username`, `email`, `status`, `datemodified`) VALUES
(1, 1, '63a9f0ea7bb98050796b649e85481845', 'freelancer', 'freelancer@techcube.co.ke', 1, '2018-02-20 13:48:27'),
(2, 2, '63a9f0ea7bb98050796b649e85481845', 'client', 'client@techcube.co.ke', 1, '2018-02-27 05:57:46');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
