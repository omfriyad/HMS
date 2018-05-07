# Dump of table Addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Addresses`;

CREATE TABLE `Addresses` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(15) DEFAULT NULL,
  `streetName` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `thana` varchar(30) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

LOCK TABLES `Addresses` WRITE;
/*!40000 ALTER TABLE `Addresses` DISABLE KEYS */;

INSERT INTO `Addresses` (`addressId`, `street`, `streetName`, `area`, `thana`, `district`)
VALUES
	(1,'41','HUmming st','khapara','askjdf','kslajf'),
	(2,'43','sdf st','sdf','sdfsdf','fgdhfh'),
	(3,'street','streetName','area','thana','district'),
	(4,NULL,NULL,NULL,NULL,NULL),
	(5,'21','stName','areName','thanaName','distName'),
	(6,'23','23','es','234','wrwr'),
	(7,'23','23','es','234','wrwr'),
	(8,'23','23','es','234','wrwr'),
	(9,'23','23','es','234','wrwr'),
	(10,'23','23','es','234','wrwr'),
	(11,'23','23','es','234','wrwr'),
	(12,'3','adad','adsad','sdfsdf','adad'),
	(13,'23','23','es','234','wrwr');

/*!40000 ALTER TABLE `Addresses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Admitted
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Admitted`;

CREATE TABLE `Admitted` (
  `patientId` int(11) NOT NULL,
  `bedId` int(11) NOT NULL,
  KEY `patientId` (`patientId`),
  KEY `bedId` (`bedId`),
  CONSTRAINT `admitted_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `Patients` (`patientId`),
  CONSTRAINT `admitted_ibfk_2` FOREIGN KEY (`bedId`) REFERENCES `Beds` (`bedId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Beds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Beds`;

CREATE TABLE `Beds` (
  `bedId` int(11) NOT NULL AUTO_INCREMENT,
  `bedType` varchar(30) DEFAULT NULL,
  `bedRent` double NOT NULL,
  `bedStatus` tinyint(1) DEFAULT NULL,
  `wardId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bedId`),
  KEY `wardId` (`wardId`),
  CONSTRAINT `wardId` FOREIGN KEY (`wardId`) REFERENCES `Wards` (`wardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Contacts`;

CREATE TABLE `Contacts` (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `mob1` varchar(30) DEFAULT NULL,
  `mob2` varchar(30) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`contactId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

LOCK TABLES `Contacts` WRITE;
/*!40000 ALTER TABLE `Contacts` DISABLE KEYS */;

INSERT INTO `Contacts` (`contactId`, `mob1`, `mob2`, `email`)
VALUES
	(1,'01918134108',NULL,'xdriyad@gmail.com'),
	(2,'01918134108323',NULL,'baal@saal.xom'),
	(3,'werwr',NULL,'werwer'),
	(4,'werwr',NULL,'werwer'),
	(5,'werwr',NULL,'werwer'),
	(6,'werwr',NULL,'werwer'),
	(7,'werwr',NULL,'werwer'),
	(8,'werwr',NULL,'werwer'),
	(9,'werwr',NULL,'werwer');

/*!40000 ALTER TABLE `Contacts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Doctors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Doctors`;

CREATE TABLE `Doctors` (
  `doctorId` int(11) NOT NULL AUTO_INCREMENT,
  `dateOfAppointment` date NOT NULL,
  `fName` varchar(30) NOT NULL,
  `mName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `contactId` int(11) DEFAULT NULL,
  `presAddress` int(11) NOT NULL,
  `permAddress` int(11) DEFAULT NULL,
  `workingDays` varchar(7) DEFAULT NULL,
  `specilation` varchar(60) DEFAULT NULL,
  `registerId` int(11) DEFAULT NULL,
  `membership` varchar(60) DEFAULT NULL,
  `visitFee` double DEFAULT NULL,
  PRIMARY KEY (`doctorId`),
  KEY `contactId` (`contactId`),
  KEY `presAddress` (`presAddress`),
  KEY `permAddress` (`permAddress`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `Contacts` (`contactId`),
  CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`presAddress`) REFERENCES `Addresses` (`addressId`),
  CONSTRAINT `doctors_ibfk_3` FOREIGN KEY (`permAddress`) REFERENCES `Addresses` (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

LOCK TABLES `Medicines` WRITE;
/*!40000 ALTER TABLE `Medicines` DISABLE KEYS */;

INSERT INTO `Medicines` (`medicineId`, `medicineName`, `medicineType`, `unitePrice`, `quantity`, `dateOfManu`, `expireDate`)
VALUES
	(1,'Medicine 1','Type 1',50,100,'2018-05-23','2018-05-01'),
	(2,'Medicine 2','type3',121,543,'2018-05-08','2018-05-15');

/*!40000 ALTER TABLE `Medicines` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Nurses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Nurses`;

CREATE TABLE `Nurses` (
  `nurseId` int(11) NOT NULL AUTO_INCREMENT,
  `dateOfAppointment` date NOT NULL,
  `fName` varchar(30) NOT NULL,
  `mName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `contactId` int(11) NOT NULL,
  `presAddress` int(11) NOT NULL,
  `permAddress` int(11) DEFAULT NULL,
  `dutyShift` varchar(7) NOT NULL,
  `superviserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`nurseId`),
  KEY `contactId` (`contactId`),
  KEY `presAddress` (`presAddress`),
  KEY `permAddress` (`permAddress`),
  CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `Contacts` (`contactId`),
  CONSTRAINT `nurses_ibfk_2` FOREIGN KEY (`presAddress`) REFERENCES `Addresses` (`addressId`),
  CONSTRAINT `nurses_ibfk_3` FOREIGN KEY (`permAddress`) REFERENCES `Addresses` (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Patients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Patients`;

CREATE TABLE `Patients` (
  `patientId` int(11) NOT NULL AUTO_INCREMENT,
  `dateOfAdmission` date NOT NULL,
  `fName` varchar(30) NOT NULL,
  `mName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `contactId` int(11) DEFAULT NULL,
  `presAddress` int(11) NOT NULL,
  `permAddress` int(11) DEFAULT NULL,
  `profession` varchar(45) DEFAULT NULL,
  `amountDeposite` double DEFAULT NULL,
  `wardId` int(11) NOT NULL,
  `depositorName` varchar(60) DEFAULT NULL,
  `depositorsRel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`patientId`),
  KEY `presAddress` (`presAddress`),
  KEY `permAddress` (`permAddress`),
  KEY `wardId` (`wardId`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`presAddress`) REFERENCES `Addresses` (`addressId`),
  CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`permAddress`) REFERENCES `Addresses` (`addressId`),
  CONSTRAINT `patients_ibfk_3` FOREIGN KEY (`wardId`) REFERENCES `Wards` (`wardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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


# Dump of table testPros
# ------------------------------------------------------------

DROP TABLE IF EXISTS `testPros`;

CREATE TABLE `testPros` (
  `testId` int(11) NOT NULL AUTO_INCREMENT,
  `cId` int(11) DEFAULT NULL,
  `aID` int(11) DEFAULT NULL,
  PRIMARY KEY (`testId`),
  KEY `cId` (`cId`),
  KEY `aID` (`aID`),
  CONSTRAINT `testpros_ibfk_1` FOREIGN KEY (`cId`) REFERENCES `Contacts` (`contactId`),
  CONSTRAINT `testpros_ibfk_2` FOREIGN KEY (`aID`) REFERENCES `Addresses` (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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


# Dump of table Wards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Wards`;

CREATE TABLE `Wards` (
  `wardId` int(11) NOT NULL AUTO_INCREMENT,
  `warName` varchar(30) DEFAULT NULL,
  `registerId` int(11) NOT NULL,
  `superviserId` int(11) NOT NULL,
  PRIMARY KEY (`wardId`),
  KEY `registerId` (`registerId`),
  KEY `superviserId` (`superviserId`),
  CONSTRAINT `wards_ibfk_1` FOREIGN KEY (`registerId`) REFERENCES `Doctors` (`doctorId`),
  CONSTRAINT `wards_ibfk_2` FOREIGN KEY (`superviserId`) REFERENCES `Nurses` (`nurseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




--
-- Dumping routines (PROCEDURE) for database 'hms'
--
DELIMITER ;;

# Dump of PROCEDURE addressIn
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `addressIn` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `addressIn`(in street Varchar(15), in streetName Varchar(30), in area Varchar(30),in thana Varchar(30),IN district Varchar(30), OUT addressId INT )
begin
 insert into Addresses values (null,street, streetName, area, thana, district);
 set addressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);
end */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE contactIn
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `contactIn` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `contactIn`(IN mob1 Varchar(15),IN email Varchar(30), OUT contactId INT )
begin
 insert into Contacts values (null,mob1,email);
 set contactId = (SELECT contactId FROM Contacts ORDER BY contactId DESC LIMIT 1);
end */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE pros
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `pros` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `pros`(in a int, in b int, in c int)
begin
set c = a+b;
end */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE prosS
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `prosS` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `prosS`(in a int, in b int, in c int)
begin
set c = a+b;
select c;
end */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE TesPr
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `TesPr` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `TesPr`(in street Varchar(15), in streetName Varchar(30), in area Varchar(30),in thana Varchar(30),IN district Varchar(30), IN mob1 Varchar(15),IN email Varchar(30) )
begin
	declare addressId INT;
	declare contactId INT;
	
	call addressIn(street, streetName, area, thana, district, addressId);
	call contactIn(mob1, email, contactId);
	insert into testPros values (contactId, addressId);
	
end */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE TesProo
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `TesProo` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `TesProo`(in street Varchar(15), in streetName Varchar(30), in area Varchar(30),in thana Varchar(30),IN district Varchar(30), IN mob1 Varchar(15),IN email Varchar(30) )
begin
	declare addressId INT;
	declare contactId INT;
	
	call addressIn(street, streetName, area, thana, district, addressId);
	call contactIn(mob1, email, contactId);
	SELECT addressId, contactId;
	insert into testPros values (contactId, addressId);
	
end */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE testProsIn
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `testProsIn` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `testProsIn`(in street Varchar(15), in streetName Varchar(30), in area Varchar(30),in thana Varchar(30),IN district Varchar(30), IN mob1 Varchar(15),IN email Varchar(30) )
begin
	declare addressId INT;
	declare contactId INT;
	
	call addressIn(street, streetName, area, thana, district, addressId);
	call contactIn(mob1, email, contactId);
	insert into testPros values (contractId, addressId);
	
end */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
