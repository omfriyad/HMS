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


create table Patients(
	dateOfAdmission Date NOT NULL,
	patientsId INT NOT NULL AUTO_INCREMENT,
	mob1 VARCHAR(30),
	mob2 VARCHAR(30),
	dateOfBirth Date,
	profession VARCHAR(30),
	amountDeposite double,
	wardId INT,

	PRIMARY KEy(patientsId),
	FOREIGN KEY(wardId) REFERENCES
);

create table Wards(

	wardId INT NOT NULL AUTO_INCREMENT,
	warName VARCHAR(30),



);


create table Patients(
	patientId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	dateOfAdmission DATE NOT NULL,
	fName VARCHAR(30) NOT NULL,
	mName VARCHAR(30) NOT NULL,
	lName VARCHAR(30) NOT NULL,
	dateOfBirth DATE NOT NULL,
	contactId  INT,
	presAddress  INT NOT NULL,
	permAddress  INT,
	profession VARCHAR(45),
	amountDeposite double,
	wardId INT NOT NULL,
	depositorName VARCHAR(60),
	depositorsRel VARCHAR(30),


	FOREIGN KEY (presAddress) REFERENCES Addresses(addressId),
	FOREIGN KEY (permAddress) REFERENCES Addresses(addressId),
	FOREIGN KEY (wardId) REFERENCES Wards,


);

Create function insertAndReturnAddreessId(street varchar(30),
										streetName varchar(30),
										area varchar(30),
										thana varchar(30),
										district varchar(30)) returns int
begin
	insert into Addresses values (NULL, street, streetName, area, thana, district);

	return (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);
end




Create procedure insertAndReturnAddreessId(IN street varchar(30),
										IN streetName varchar(30),
										IN area varchar(30),
										IN thana varchar(30),
										IN district varchar(30),
										OUT addressId INT)
	begin
	insert into Addresses values (NULL, street, streetName, area, thana, district);
	SET addressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);
	end


DELIMITER //

create procedure contactIn (IN mob1 Varchar(15),IN email Varchar(30), OUT contactId INT )
begin
 insert into Contacts values (null,mob1,email);
 set contactId = (SELECT contactId FROM Contacts ORDER BY contactId DESC LIMIT 1);
end
//
DELIMITER ;


DELIMITER //

create procedure TesPr (in street Varchar(15), in streetName Varchar(30), in area Varchar(30),in thana Varchar(30),IN district Varchar(30), IN mob1 Varchar(15),IN email Varchar(30) )
begin
	declare addressId INT;
	declare contactId INT;

	call addressIn(street, streetName, area, thana, district, addressId);
	call contactIn(mob1, email, contactId);
	insert into testPros values (contactId, addressId);

end
//
DELIMITER ;





DELIMITER //

create procedure PatientsIn(
    IN patientId INT,
	IN dateOfAdmission date,
  	IN fName Varchar(30),
  	IN mName Varchar(30),
  	IN lName Varchar(30),
  	IN dateOfBirth date,
  	IN mob1 Varchar(15),
  	IN mob2 Varchar(15),
  	IN email VARCHAR(30),
  	IN presSt Varchar(15),
 	IN presStName Varchar(30),
 	IN presArea Varchar(30),
 	IN presThana Varchar(30),
 	IN presDist Varchar(30),
  	IN permSt Varchar(15),
 	IN permStName Varchar(30),
  	IN permArea Varchar(30),
  	IN permThana Varchar(30),
  	IN permDist Varchar(30),
  	IN profession Varchar(30),
  	IN depositedAmount Double,
  	IN depositorName Varchar(30),
  	IN depositorsRel Varchar(30)
)

begin
	declare presAddressId INT;
	declare permAddressId INT;
	declare contactId INT;
	declare wardId INT,
	declare bedId INT,

	INSERT INTO Addresses VALUES (null, presSt, presStName, presArea, presThana, presDist);
	SET presAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Addresses VALUES (null, permSt, permStName, permArea, permThana, permDist);
	SET permAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Contacts Values (mob1, mob2, email);
	SET contactId = (SELECT contactId FROM Contacts ORDER BY contactId DESC LIMIT 1);

    SET bedId = (SELECT bedId FROM Beds ORDER BY bedId LIMIT 1)
    SET wardId = (SELECT wardId FROM Beds WHERE Beds.bedId = bedId)
    INSERT INTO Admitted VALUES(patientId, bedId);

	INSERT INTO Patients VALUES(patientId, dateOfAdmission, fName, mName, lName, dateOfBirth, contactId, presAddressId, permAddressId, profession, amountDeposite,wardId, depositorName, depositorsRel);


end
//
DELIMITER ;




DELIMITER //

create procedure PatientIn(
	IN dateOfAppointment date,
  	IN fName Varchar(30),
  	IN mName Varchar(30),
  	IN lName Varchar(30),
  	IN dateOfBirth date,
  	IN mob1 Varchar(15),
  	IN mob2 Varchar(15),
  	IN email VARCHAR(30),
  	IN presSt Varchar(15),
 	IN presStName Varchar(30),
 	IN presArea Varchar(30),
 	IN presThana Varchar(30),
 	IN presDist Varchar(30),
  	IN permSt Varchar(15),
 	IN permStName Varchar(30),
  	IN permArea Varchar(30),
  	IN permThana Varchar(30),
  	IN permDist Varchar(30),
    IN workingDays Varchar(7),
  	IN specilation Varchar(30),
  	IN registerId int,
  	IN membership Varchar(30),
  	IN visitFee double,
)

begin
	declare presAddressId INT;
	declare permAddressId INT;
	declare contactId INT;
    declare doctorId INT;


    SET patientId = (SELECT doctorId FROM doctors ORDER BY doctorId DESC LIMIT 1) +1;

	INSERT INTO Addresses VALUES (null, presSt, presStName, presArea, presThana, presDist);
	SET presAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Addresses VALUES (null, permSt, permStName, permArea, permThana, permDist);
	SET permAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Contacts Values (mob1, mob2, email);
	SET contactId = (SELECT contactId FROM Contacts ORDER BY contactId DESC LIMIT 1);

	INSERT INTO doctors VALUES(doctorId,	dateOfAppointment,	fName,	mName,	lName,	dateOfBirth,	contactId,	presAddressId, permAddressId,	workingDays,	specilation,	registerId,	membership,	visitFee);


end
//
DELIMITER ;

DELIMITER //
create procedure doctorIn(
	IN dateOfAppointment date,
  	IN fName Varchar(30),
  	IN mName Varchar(30),
  	IN lName Varchar(30),
  	IN dateOfBirth date,
  	IN mob1 Varchar(15),
  	IN mob2 Varchar(15),
  	IN email VARCHAR(30),
  	IN presSt Varchar(15),
 	IN presStName Varchar(30),
 	IN presArea Varchar(30),
 	IN presThana Varchar(30),
 	IN presDist Varchar(30),
  	IN permSt Varchar(15),
 	IN permStName Varchar(30),
  	IN permArea Varchar(30),
  	IN permThana Varchar(30),
  	IN permDist Varchar(30),
    IN workingDays Varchar(7),
  	IN specilation Varchar(30),
  	IN registerId int,
  	IN membership Varchar(30),
  	IN visitFee double
)

begin
	declare presAddressId INT;
	declare permAddressId INT;
	declare contactId INT;
    declare doctorId INT;


    SET doctorId = ((SELECT doctorId FROM doctors ORDER BY doctorId DESC LIMIT 1) + 1);

	INSERT INTO Addresses VALUES (null, presSt, presStName, presArea, presThana, presDist);
	SET presAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Addresses VALUES (null, permSt, permStName, permArea, permThana, permDist);
	SET permAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Contacts Values (null, mob1, mob2, email);
	SET contactId = (SELECT contactId FROM Contacts ORDER BY contactId DESC LIMIT 1);

	INSERT INTO doctors VALUES(doctorId, dateOfAppointment,	fName,	mName,	lName,	dateOfBirth,	contactId,	presAddressId, permAddressId,	workingDays,	specilation,	registerId,	membership,	visitFee);


end

//
DELIMITER ;




patient that has not done investigations

select patientId, dateOfAdmission , CONCAT(fName, " ",mName," ", lName) as Name, dateOfBirth
from  patients
where
patientId not in (select patientId from investigations);





@doctorBill = SELECT sum(visitFee) FROM Doctors,Advices
Where Advices.patientId = patientId and Advices.doctorId = Doctors.doctorId;
@medicineBill = SELECT 	SUM(medicineAdviced.quantity*Medicines.unitePrice)
	FROM Advices, medicineAdviced, Medicines
    WHERE Advices.AdviceId = medicineAdviced.adviceId AND
    Advices.patientId = patientId AND 			 medicineAdviced.medicineId=Medicines.medicineId;

@bedBill = SELECT bedRent FROM Beds
		WHERE bedId = (SELECT bedId FROM Admitted WHERE Admitted.patientId =patientId );
@totalBill = @doctorBill +@medicineBill+@bedBill;

INSERT INTO Bills(patientId,@totalBill) VALUES(patientId,t@otalBill)ON DUPLICATE KEY UPDATE totalBill = @totalBill;



DELIMITER //

create procedure PatientsIn(
    IN patientId INT
)

begin

@doctorBill = SELECT sum(visitFee) FROM Doctors,Advices
Where Advices.patientId = patientId and Advices.doctorId = Doctors.doctorId;
@medicineBill = SELECT 	SUM(medicineAdviced.quantity*Medicines.unitePrice)
	FROM Advices, medicineAdviced, Medicines
    WHERE Advices.AdviceId = medicineAdviced.adviceId AND
    Advices.patientId = patientId AND 			 medicineAdviced.medicineId=Medicines.medicineId;

@bedBill = SELECT bedRent FROM Beds
		WHERE bedId = (SELECT bedId FROM Admitted WHERE Admitted.patientId =patientId );
@totalBill = @doctorBill +@medicineBill+@bedBill;

INSERT INTO Bills(patientId,@totalBill) VALUES(patientId,t@otalBill)ON DUPLICATE KEY UPDATE totalBill = @totalBill;

end
//
DELIMITER ;