# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.5-10.1.29-MariaDB)
# Database: hms
# Generation Time: 2018-05-06 13:59:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table doc_qualifi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doc_qualifi`;

CREATE TABLE `doc_qualifi` (
  `doctorId` int(11) NOT NULL,
  `quaId` int(11) NOT NULL,
  `board` varchar(30) NOT NULL,
  `year` date NOT NULL,
  `cgpa` double(4,2) NOT NULL,
  `position` int(11) NOT NULL,
  KEY `doctorId` (`doctorId`),
  KEY `quaId` (`quaId`),
  CONSTRAINT `doc_qualifi_ibfk_1` FOREIGN KEY (`doctorId`) REFERENCES `Doctors` (`doctorId`),
  CONSTRAINT `doc_qualifi_ibfk_2` FOREIGN KEY (`quaId`) REFERENCES `Qualifications` (`quaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `doc_qualifi` WRITE;
/*!40000 ALTER TABLE `doc_qualifi` DISABLE KEYS */;

INSERT INTO `doc_qualifi` (`doctorId`, `quaId`, `board`, `year`, `cgpa`, `position`)
VALUES
	(1,101,'Dhaka','2018-05-08',3.41,1);

/*!40000 ALTER TABLE `doc_qualifi` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Doctors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Doctors`;

CREATE TABLE `Doctors` (
  `doctorId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `middleName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `dateOfAppointment` date NOT NULL,
  PRIMARY KEY (`doctorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Doctors` WRITE;
/*!40000 ALTER TABLE `Doctors` DISABLE KEYS */;

INSERT INTO `Doctors` (`doctorId`, `firstName`, `middleName`, `lastName`, `dateOfBirth`, `dateOfAppointment`)
VALUES
	(1,'a','b','c','2018-05-08','2018-05-07');

/*!40000 ALTER TABLE `Doctors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Medicines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Medicines`;

CREATE TABLE `Medicines` (
  `medicineId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `medicineName` varchar(40) NOT NULL,
  `medicineType` varchar(30) NOT NULL,
  `unitePrice` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `dateOfManu` date NOT NULL,
  `expireDate` date NOT NULL,
  PRIMARY KEY (`medicineId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Medicines` WRITE;
/*!40000 ALTER TABLE `Medicines` DISABLE KEYS */;

INSERT INTO `Medicines` (`medicineId`, `medicineName`, `medicineType`, `unitePrice`, `quantity`, `dateOfManu`, `expireDate`)
VALUES
	(1,'Medicine 1','Type 1',50,100,'2018-05-23','2018-05-01'),
	(2,'Medicine 2','type3',121,543,'2018-05-08','2018-05-15');

/*!40000 ALTER TABLE `Medicines` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Qualifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Qualifications`;

CREATE TABLE `Qualifications` (
  `quaId` int(11) NOT NULL,
  `quaName` varchar(30) NOT NULL,
  PRIMARY KEY (`quaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Qualifications` WRITE;
/*!40000 ALTER TABLE `Qualifications` DISABLE KEYS */;

INSERT INTO `Qualifications` (`quaId`, `quaName`)
VALUES
	(101,'SSC'),
	(102,'HSC'),
	(103,'MBBS');

/*!40000 ALTER TABLE `Qualifications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `user` varchar(20) DEFAULT NULL,
  `pass` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`user`, `pass`)
VALUES
	('suhan','123'),
	('admin','admin'),
	('asd','ad'),
	('adad','adad'),
	('ad','asdad'),
	('ad','asdad'),
	('user1','pas1'),
	('sir','omaa'),
	('reasd','acad'),
	('baba','tchala'),
	('a','a'),
	('add','b'),
	('b','a');

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
