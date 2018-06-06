-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 09, 2018 at 05:31 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hmss`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addressIn` (IN `street` VARCHAR(15), IN `streetName` VARCHAR(30), IN `area` VARCHAR(30), IN `thana` VARCHAR(30), IN `district` VARCHAR(30), OUT `addressId` INT)  begin
 insert into Addresses values (null,street, streetName, area, thana, district);
 set addressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `contactIn` (IN `mob1` VARCHAR(15), IN `email` VARCHAR(30), OUT `contactId` INT)  begin
 insert into Contacts values (null,mob1,email);
 set contactId = (SELECT contactId FROM Contacts ORDER BY contactId DESC LIMIT 1);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `doctorIn` (IN `dateOfAppointment` DATE, IN `fName` VARCHAR(30), IN `mName` VARCHAR(30), IN `lName` VARCHAR(30), IN `dateOfBirth` DATE, IN `mob1` INT(15), IN `mob2` INT(15), IN `email` VARCHAR(30), IN `presSt` VARCHAR(15), IN `presStName` VARCHAR(30), IN `presArea` VARCHAR(30), IN `presThana` VARCHAR(30), IN `presDist` VARCHAR(30), IN `permSt` VARCHAR(15), IN `permStName` VARCHAR(30), IN `permArea` VARCHAR(30), IN `permThana` VARCHAR(30), IN `permDist` VARCHAR(30), IN `workingDays` VARCHAR(7), IN `specilation` VARCHAR(30), IN `registerId` INT, IN `membership` VARCHAR(30), IN `visitFee` DOUBLE)  begin
	declare presAddressId INT;
	declare permAddressId INT;
    
    
  
    INSERT INTO Contacts Values (null, mob1, mob2, email);
	SET @contactId = (SELECT contactId FROM contacts ORDER by contactId DESC LIMIT 1);
    

	INSERT INTO Addresses VALUES (null, presSt, presStName, presArea, presThana, presDist);
	SET presAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Addresses VALUES (null, permSt, permStName, permArea, permThana, permDist);
	SET permAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO doctors VALUES(null, dateOfAppointment,	fName,	mName,	lName,	dateOfBirth,@contactId,	presAddressId, permAddressId,	workingDays,	specilation,	registerId,	membership,	visitFee);
    


end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nurseIn` (IN `dateOfAppointment` DATE, IN `fName` VARCHAR(30), IN `mName` VARCHAR(30), IN `lName` VARCHAR(30), IN `dateOfBirth` DATE, IN `mob1` INT(15), IN `mob2` INT(15), IN `email` VARCHAR(30), IN `presSt` VARCHAR(15), IN `presStName` VARCHAR(30), IN `presArea` VARCHAR(30), IN `presThana` VARCHAR(30), IN `presDist` VARCHAR(30), IN `permSt` VARCHAR(15), IN `permStName` VARCHAR(30), IN `permArea` VARCHAR(30), IN `permThana` VARCHAR(30), IN `permDist` VARCHAR(30), IN `dutyShift` VARCHAR(7), IN `superviserId` INT)  begin
	declare presAddressId INT;
	declare permAddressId INT;
    
    
  
    INSERT INTO Contacts Values (null, mob1, mob2, email);
	SET @contactId = (SELECT contactId FROM contacts ORDER by contactId DESC LIMIT 1);
    

	INSERT INTO Addresses VALUES (null, presSt, presStName, presArea, presThana, presDist);
	SET presAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Addresses VALUES (null, permSt, permStName, permArea, permThana, permDist);
	SET permAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Nurses VALUES(null, dateOfAppointment,	fName,	mName,	lName,	dateOfBirth,@contactId,	presAddressId, permAddressId,	dutyShift,	superviserId);
    


end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PatientIn` (IN `dateOfAdmission` DATE, IN `fName` VARCHAR(30), IN `mName` VARCHAR(30), IN `lName` VARCHAR(30), IN `dateOfBirth` DATE, IN `mob1` INT(15), IN `mob2` INT(15), IN `email` VARCHAR(30), IN `presSt` VARCHAR(15), IN `presStName` VARCHAR(30), IN `presArea` VARCHAR(30), IN `presThana` VARCHAR(30), IN `presDist` VARCHAR(30), IN `permSt` VARCHAR(15), IN `permStName` VARCHAR(30), IN `permArea` VARCHAR(30), IN `permThana` VARCHAR(30), IN `permDist` VARCHAR(30), IN `profession` VARCHAR(30), IN `depositedAmount` DOUBLE, IN `depositorName` VARCHAR(30), IN `depositorsRel` VARCHAR(30))  begin
	DECLARE presAddressId INT;
    DECLARE permAddressId INT;
	INSERT INTO Addresses VALUES (null, presSt, presStName, presArea, presThana, presDist);
	SET presAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Addresses VALUES (null, permSt, permStName, permArea, permThana, permDist);
	SET permAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Contacts Values (null, mob1, mob2, email);
	SET @contactId = (SELECT contactId FROM Contacts ORDER BY contactId DESC LIMIT 1);

    SET @bedId = (SELECT bedId FROM Beds WHERE Beds.bedStatus = 0 ORDER BY bedId LIMIT 1);
    SET @wardId = (SELECT wardId FROM Beds WHERE Beds.bedId = @bedId);
    
INSERT INTO Patients VALUES(null, dateOfAdmission, fName, mName, lName, dateOfBirth, @contactId, presAddressId, permAddressId, profession, depositedAmount, @wardId, depositorName, depositorsRel);
    
SET @patientId =(SELECT patientId FROM Patients  ORDER BY patientId DESC LIMIT 1);

INSERT INTO Admitted VALUES(@patientId, @bedId);


end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PatientsIn` (IN `patientId` INT, IN `dateOfAdmission` DATE, IN `fName` VARCHAR(30), IN `mName` VARCHAR(30), IN `lName` VARCHAR(30), IN `dateOfBirth` DATE, IN `mob1` VARCHAR(15), IN `mob2` VARCHAR(15), IN `email` VARCHAR(30), IN `presSt` VARCHAR(15), IN `presStName` VARCHAR(30), IN `presArea` VARCHAR(30), IN `presThana` VARCHAR(30), IN `presDist` VARCHAR(30), IN `permSt` VARCHAR(15), IN `permStName` VARCHAR(30), IN `permArea` VARCHAR(30), IN `permThana` VARCHAR(30), IN `permDist` VARCHAR(30), IN `profession` VARCHAR(30), IN `depositedAmount` DOUBLE, IN `depositorName` VARCHAR(30), IN `depositorsRel` VARCHAR(30))  begin
	declare presAddressId INT;
	declare permAddressId INT;
	declare contactId INT;
	declare wardId INT;
	declare bedId INT;

	INSERT INTO Addresses VALUES (null, presSt, presStName, presArea, presThana, presDist);
	SET presAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Addresses VALUES (null, permSt, permStName, permArea, permThana, permDist);
	SET permAddressId = (SELECT addressId FROM Addresses ORDER BY addressId DESC LIMIT 1);

	INSERT INTO Contacts Values (mob1, mob2, email);
	SET contactId = (SELECT contactId FROM Contacts ORDER BY contactId DESC LIMIT 1);

    SET bedId = (SELECT bedId FROM Beds ORDER BY bedId LIMIT 1);
    SET wardId = (SELECT wardId FROM Beds WHERE Beds.bedId = bedId);
    INSERT INTO Admitted VALUES(patientId, bedId);

	INSERT INTO Patients VALUES(patientId, dateOfAdmission, fName, mName, lName, dateOfBirth, contactId, presAddressId, permAddressId, profession, amountDeposite,wardId, depositorName, depositorsRel);


end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pros` (IN `a` INT, IN `b` INT, IN `c` INT)  begin
set c = a+b;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prosS` (IN `a` INT, IN `b` INT, IN `c` INT)  begin
set c = a+b;
select c;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TesPr` (IN `street` VARCHAR(15), IN `streetName` VARCHAR(30), IN `area` VARCHAR(30), IN `thana` VARCHAR(30), IN `district` VARCHAR(30), IN `mob1` VARCHAR(15), IN `email` VARCHAR(30))  begin
	declare addressId INT;
	declare contactId INT;

	call addressIn(street, streetName, area, thana, district, addressId);
	call contactIn(mob1, email, contactId);
	insert into testPros values (contactId, addressId);

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TesProo` (IN `street` VARCHAR(15), IN `streetName` VARCHAR(30), IN `area` VARCHAR(30), IN `thana` VARCHAR(30), IN `district` VARCHAR(30), IN `mob1` VARCHAR(15), IN `email` VARCHAR(30))  begin
	declare addressId INT;
	declare contactId INT;

	call addressIn(street, streetName, area, thana, district, addressId);
	call contactIn(mob1, email, contactId);
	SELECT addressId, contactId;
	insert into testPros values (contactId, addressId);

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `testProsIn` (IN `street` VARCHAR(15), IN `streetName` VARCHAR(30), IN `area` VARCHAR(30), IN `thana` VARCHAR(30), IN `district` VARCHAR(30), IN `mob1` VARCHAR(15), IN `email` VARCHAR(30))  begin
	declare addressId INT;
	declare contactId INT;

	call addressIn(street, streetName, area, thana, district, addressId);
	call contactIn(mob1, email, contactId);
	insert into testPros values (contractId, addressId);

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTotalBill` (IN `patientId` INT)  begin
declare doctorBill double;
declare medicineBill double;
declare bedBill double;
declare totalBill double;

set doctorBill = (SELECT sum(visitFee) FROM Doctors, Advices Where Advices.patientId = patientId and Advices.doctorId = Doctors.doctorId);
			
set medicineBill =( SELECT 	SUM(medicineAdviced.quantity*Medicines.unitePrice)
				FROM Advices, medicineAdviced, Medicines
   				WHERE Advices.AdviceId = medicineAdviced.adviceId AND
    			Advices.patientId = patientId AND medicineAdviced.medicineId=Medicines.medicineId);
  
set bedBill= (SELECT bedRent FROM Beds
		WHERE bedId = (SELECT bedId FROM Admitted WHERE Admitted.patientId =patientId ));
		
set totalBill = doctorBill + medicineBill + bedBill;

INSERT INTO Bills(patientId,totalBill) VALUES(patientId,totalBill)ON DUPLICATE KEY UPDATE totalBill = totalBill;
    
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Addresses`
--

CREATE TABLE `Addresses` (
  `addressId` int(11) NOT NULL,
  `street` varchar(15) DEFAULT NULL,
  `streetName` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `thana` varchar(30) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Addresses`
--

INSERT INTO `Addresses` (`addressId`, `street`, `streetName`, `area`, `thana`, `district`) VALUES
(1, 'archar', 'archar', 'archar', 'archar', 'archar'),
(2, 'archar', 'archar', 'archar', 'archar', 'archar'),
(3, 'archar', 'archar', 'archar', 'archar', 'archar'),
(4, 'archar', 'archar', 'archar', 'archar', 'archar'),
(5, 'archar', 'archar', 'archar', 'archar', 'archar'),
(6, 'archar', 'archar', 'archar', 'archar', 'archar'),
(7, 'archar', 'archar', 'archar', 'archar', 'archar'),
(8, 'archar', 'archar', 'archar', 'archar', 'archar'),
(9, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, NULL, NULL, NULL),
(15, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, NULL, NULL, NULL),
(17, NULL, NULL, NULL, NULL, NULL),
(18, NULL, NULL, NULL, NULL, NULL),
(19, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, NULL, NULL, NULL),
(23, NULL, NULL, NULL, NULL, NULL),
(24, NULL, NULL, NULL, NULL, NULL),
(25, NULL, NULL, NULL, NULL, NULL),
(26, NULL, NULL, NULL, NULL, NULL),
(27, NULL, NULL, NULL, NULL, NULL),
(28, NULL, NULL, NULL, NULL, NULL),
(29, 'sdf', 'dadfa', 'df', 'adf', 'adfqe'),
(30, 'qwerq', 'piouhjlk', 'hlkbj', 'lkjwr', 'eqrgr'),
(31, 'sdf', 'dadfa', 'df', 'adf', 'adfqe'),
(32, 'qwerq', 'piouhjlk', 'hlkbj', 'lkjw', 'eqrgr'),
(33, 'sdf', 'dadfa', 'df', 'adf', 'adfqe'),
(34, 'qwerq', 'piouhjlk', 'hlkbj', 'lkjw', 'eqrgr'),
(35, 'sdf', 'dadfa', 'df', 'adf', 'adfqe'),
(36, 'qwerq', 'piouhjlk', 'hlkbj', 'lkjw', 'eqrgr'),
(37, 'sdf', 'dadfa', 'df', 'adf', 'adfqe'),
(38, 'qwerq', 'piouhjlk', 'hlkbj', 'lkjw', 'eqrgr'),
(39, '61/4 north', 'kha-para', 'khilkhet', 'khilkhet', 'dhaka'),
(40, 'b-7', 'loxmibordi', 'gopaldi', 'araihazar', 'narayangonj'),
(41, '61/4 north', 'kha-para', 'khilkhet', 'khilkhet', 'dhaka'),
(42, 'b-7', 'loxmibordi', 'gopaldi', 'araihazar', 'narayangonj'),
(43, '61/4 north', 'kha-para', 'khilkhet', 'khilkhet', 'dhaka'),
(44, 'b-7', 'loxmibordi', 'gopaldi', 'araihazar', 'narayangonj'),
(45, '123/34C', 'umok', 'tumok', 'shumok', 'jhumok'),
(46, 'kimon', 'kanok', 'blano', 'khanok', 'danok'),
(47, 'ASDJ', 'ASDF', 'ADF', 'FADF', 'FAFDF'),
(48, 'FADF', 'ADF', 'ADFAFD', 'DFAF', 'GDFAF'),
(49, 'ASDJ', 'ASDF', 'ADF', 'FADF', 'FAFDF'),
(50, 'FADF', 'ADF', 'ADFAFD', 'DFAF', 'GDFAF'),
(51, 'ASDJ', 'ASDF', 'ADF', 'FADF', 'FAFDF'),
(52, 'FADF', 'ADF', 'ADFAFD', 'DFAF', 'GDFAF'),
(53, '23/4f', 'sljndf', 'akjdfn', 'dsjfn', 'iuhqu'),
(54, '12cc', 'euorhqfv', 'ajkbf', 'pewhn', 'avlknqo'),
(55, '', '', '', '', ''),
(56, '', '', '', '', ''),
(57, '', '', '', '', ''),
(58, '', '', '', '', ''),
(59, '', '', '', '', ''),
(60, '', '', '', '', ''),
(61, '', '', '', '', ''),
(62, '', '', '', '', ''),
(63, '', '', '', '', ''),
(64, '', '', '', '', ''),
(65, '', '', '', '', ''),
(66, '', '', '', '', ''),
(67, '', '', '', '', ''),
(68, '', '', '', '', ''),
(69, '', '', '', '', ''),
(70, '', '', '', '', ''),
(71, '', '', '', '', ''),
(72, '', '', '', '', ''),
(73, '', '', '', '', ''),
(74, '', '', '', '', ''),
(75, 'ladasdf', 'kjhv', 'hkjvkh', 'khjvk', 'vk'),
(76, 'hv', 'kv', 'khvkgvkgv', 'kjvk', 'vkv'),
(77, '', '', '', '', ''),
(78, '', '', '', '', ''),
(79, 'afad', 'afda', 'adf', 'adf', 'gsd'),
(80, 'gfd', 'sdfg', 'dsf', 'sdfg', 'sfg'),
(81, 'adfadf', 'asfadfa', 'dfadf', 'dfadf', 'adfadfa'),
(82, 'adfadf', 'afaf', 'adfad', 'adfa', 'adfadf'),
(83, '541/c', 'skldjfghh', 'alkjfhkjhakj', 'skjlfdb', 'akljsfd'),
(84, '234/v', 'aklsjdhf', 'alkjfh', 'alksdjfb', 'alkjfdb');

--
-- Triggers `Addresses`
--
DELIMITER $$
CREATE TRIGGER `afterupdateOf` AFTER UPDATE ON `Addresses` FOR EACH ROW UPDATE beds set bedStatus =0 where bedId not in (SELECT bedId from Admitted)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Admitted`
--

CREATE TABLE `Admitted` (
  `patientId` int(11) NOT NULL,
  `bedId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Admitted`
--

INSERT INTO `Admitted` (`patientId`, `bedId`) VALUES
(11, 1);

--
-- Triggers `Admitted`
--
DELIMITER $$
CREATE TRIGGER `bedIdOff` AFTER DELETE ON `Admitted` FOR EACH ROW UPDATE beds set bedStatus =0 where bedId not in (SELECT bedId from Admitted)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `bedIdtoOn` AFTER INSERT ON `Admitted` FOR EACH ROW UPDATE beds set bedStatus = 1 where bedId = (SELECT bedId FROM Admitted ORDER BY patientId DESC LIMIT 1)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Advices`
--

CREATE TABLE `Advices` (
  `AdviceId` int(11) NOT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `patientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Advices`
--

INSERT INTO `Advices` (`AdviceId`, `doctorId`, `patientId`) VALUES
(1, 1, 11),
(2, 2, 11),
(3, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `Beds`
--

CREATE TABLE `Beds` (
  `bedId` int(11) NOT NULL,
  `bedType` varchar(30) DEFAULT NULL,
  `bedRent` double NOT NULL,
  `bedStatus` tinyint(1) DEFAULT NULL,
  `wardId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Beds`
--

INSERT INTO `Beds` (`bedId`, `bedType`, `bedRent`, `bedStatus`, `wardId`) VALUES
(1, 'typ1', 500, 1, 1),
(2, 'type3', 300, 1, 1),
(3, 'wer', 1233, 0, 1),
(4, 'qwe', 33, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Bills`
--

CREATE TABLE `Bills` (
  `patientId` int(11) DEFAULT NULL,
  `totalBill` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Bills`
--

INSERT INTO `Bills` (`patientId`, `totalBill`) VALUES
(11, 40630);

-- --------------------------------------------------------

--
-- Table structure for table `Contacts`
--

CREATE TABLE `Contacts` (
  `contactId` int(11) NOT NULL,
  `mob1` int(15) DEFAULT NULL,
  `mob2` int(30) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Contacts`
--

INSERT INTO `Contacts` (`contactId`, `mob1`, `mob2`, `email`) VALUES
(1, 0, 0, 'archar'),
(2, 0, 0, 'archar'),
(3, 0, 0, 'archar'),
(4, 0, 0, 'archar'),
(5, 0, 0, 'archar'),
(6, 0, 0, 'archar'),
(7, NULL, NULL, NULL),
(8, NULL, NULL, NULL),
(9, NULL, NULL, NULL),
(10, NULL, NULL, NULL),
(11, NULL, NULL, NULL),
(12, NULL, NULL, NULL),
(13, NULL, NULL, NULL),
(14, NULL, NULL, NULL),
(15, NULL, NULL, NULL),
(16, NULL, NULL, NULL),
(17, 1918131084, 2147483647, 'xdriyad@gmail.com'),
(18, 1918131084, 2147483647, 'xdriyad@gmail.com'),
(19, 1918131084, 2147483647, 'xdriyad@gmail.com'),
(20, 1918131084, 2147483647, 'xdriyad@gmail.com'),
(21, 1918131084, 2147483647, 'xdriyad@gmail.com'),
(22, 1918134108, 1816820458, 'xdriyad@gmail.com'),
(23, 1918134108, 1816820458, 'xdriyad@gmail.com'),
(24, 1918134108, 1816820458, 'xdriyad@gmail.com'),
(25, 19183234, 20971230, 'arifur@baa.com'),
(26, 2345, 3542, 'ADFS@GMAIL.COM'),
(27, 2345, 3542, 'ADFS@GMAIL.COM'),
(28, 2345, 3542, 'ADFS@GMAIL.COM'),
(29, 3824242, 9238428, 'lsjhg@adad.com'),
(30, 0, 0, ''),
(31, 0, 0, ''),
(32, 0, 0, ''),
(33, 0, 0, ''),
(34, 0, 0, ''),
(35, 0, 0, ''),
(36, 0, 0, ''),
(37, 0, 0, ''),
(38, 0, 0, ''),
(39, 0, 0, ''),
(40, 1231234, 1234123123, 'umo@asd.com'),
(41, 0, 0, ''),
(42, 1234, 4514, 'd22@gmail.com'),
(43, 1324, 13242, 'adfadf@sl.co'),
(44, 1918134108, 1815125698, 'XDRIYAD@GMAIL.COM');

-- --------------------------------------------------------

--
-- Table structure for table `Doctors`
--

CREATE TABLE `Doctors` (
  `doctorId` int(11) NOT NULL,
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
  `visitFee` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Doctors`
--

INSERT INTO `Doctors` (`doctorId`, `dateOfAppointment`, `fName`, `mName`, `lName`, `dateOfBirth`, `contactId`, `presAddress`, `permAddress`, `workingDays`, `specilation`, `registerId`, `membership`, `visitFee`) VALUES
(1, '2018-01-13', 'fname', 'mname', 'lname', '2018-01-13', NULL, 1, 2, 'archar', 'archar', 500, 'archar', 600),
(2, '2018-01-13', 'fname', 'mname', 'lname', '2018-01-13', NULL, 3, 4, 'archar', 'archar', 500, 'archar', 600),
(3, '2018-01-13', 'fname', 'mname', 'lname', '2018-01-13', NULL, 5, 6, 'archar', 'archar', 500, 'archar', 600),
(4, '2018-01-13', 'fname', 'mname', 'lname', '2018-01-13', NULL, 7, 8, 'archar', 'archar', 500, 'archar', 600),
(5, '0000-00-00', 'adlfkj', 'ajndv', 'zkl', '0000-00-00', 28, 51, 52, 'work', 'sdf', 1, 'speciial', 200),
(6, '2018-12-03', 'hab', 'baa', 'asss', '1998-12-03', 29, 53, 54, 'ST', 'tut specialsadf', 1, 'naik kono', 5000),
(7, '0000-00-00', '', '', '', '0000-00-00', 30, 55, 56, '', '', 0, '', 0),
(8, '0000-00-00', '', '', '', '0000-00-00', 31, 57, 58, '', '', 0, '', 0),
(9, '0000-00-00', '', '', '', '0000-00-00', 32, 59, 60, '', '', 0, '', 0),
(10, '0000-00-00', '', '', '', '0000-00-00', 33, 61, 62, '', '', 0, '', 0),
(11, '0000-00-00', '', '', '', '0000-00-00', 34, 63, 64, '', '', 0, '', 0),
(12, '0000-00-00', '', '', '', '0000-00-00', 35, 65, 66, '', '', 0, '', 0),
(13, '0000-00-00', '', '', '', '0000-00-00', 36, 67, 68, '', '', 0, '', 0),
(14, '0000-00-00', '', '', '', '0000-00-00', 37, 69, 70, '', '', 0, '', 0),
(15, '0000-00-00', '', '', '', '0000-00-00', 38, 71, 72, '', '', 0, '', 0),
(16, '0000-00-00', '', '', '', '0000-00-00', 39, 73, 74, '', '', 0, '', 0),
(17, '2018-12-01', 'arif', 'ur', 'suhan', '0000-00-00', 40, 75, 76, 'kvk', 'stf', 2, 'nai kono', 500),
(18, '0000-00-00', '', '', '', '0000-00-00', 41, 77, 78, '', '', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `doc_exper`
--

CREATE TABLE `doc_exper` (
  `doctorId` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `started` date DEFAULT NULL,
  `till` date DEFAULT NULL,
  `org` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doc_exper`
--

INSERT INTO `doc_exper` (`doctorId`, `title`, `started`, `till`, `org`) VALUES
(18, 'asdad', '0000-00-00', '0000-00-00', 'adad');

-- --------------------------------------------------------

--
-- Table structure for table `doc_qualifi`
--

CREATE TABLE `doc_qualifi` (
  `doctorId` int(11) DEFAULT NULL,
  `quaId` int(11) DEFAULT NULL,
  `board` varchar(30) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `cgpa` float(4,2) DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doc_qualifi`
--

INSERT INTO `doc_qualifi` (`doctorId`, `quaId`, `board`, `year`, `cgpa`, `position`) VALUES
(16, 101, 'Dhaka', 2019, 3.50, 1),
(17, 101, 'dhaka', 2000, 5.00, 2),
(17, 102, 'dhaka', 2002, 5.00, 5),
(17, 103, 'DMC', 2007, 3.50, 100),
(18, 101, '', 0, 0.00, 0),
(18, 102, '', 0, 0.00, 0),
(18, 103, '', 0, 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Investigations`
--

CREATE TABLE `Investigations` (
  `patientId` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `symptom` varchar(256) DEFAULT NULL,
  `bloodPressure` varchar(30) DEFAULT NULL,
  `breakfast` varchar(256) DEFAULT NULL,
  `lunch` varchar(256) DEFAULT NULL,
  `dinner` varchar(256) DEFAULT NULL,
  `games` varchar(256) DEFAULT NULL,
  `other` varchar(256) DEFAULT NULL,
  `diseaseName` varchar(60) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicineAdviced`
--

CREATE TABLE `medicineAdviced` (
  `medicineId` int(10) UNSIGNED DEFAULT NULL,
  `adviceId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `beforeAfter` int(11) DEFAULT NULL,
  `medAdId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicineAdviced`
--

INSERT INTO `medicineAdviced` (`medicineId`, `adviceId`, `quantity`, `times`, `beforeAfter`, `medAdId`) VALUES
(1, 1, 10, 2, NULL, 1),
(2, 2, 100, NULL, NULL, 12),
(2, 2, 100, NULL, NULL, 13),
(1, 2, 100, NULL, NULL, 14),
(2, 3, 100, NULL, NULL, 16);

--
-- Triggers `medicineAdviced`
--
DELIMITER $$
CREATE TRIGGER `updateMedAfterAdvice` AFTER INSERT ON `medicineAdviced` FOR EACH ROW UPDATE Medicines set quantity = quantity - (SELECT quantity FROM medicineAdviced where medicineAdviced.medicineId = medicineId and medAdId = (SELECT medAdId FROM medicineAdviced ORDER BY medAdId DESC LIMIT 1))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Medicines`
--

CREATE TABLE `Medicines` (
  `medicineId` int(10) UNSIGNED NOT NULL,
  `medicineName` varchar(40) NOT NULL,
  `medicineType` varchar(30) NOT NULL,
  `unitePrice` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `dateOfManu` date NOT NULL,
  `expireDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Medicines`
--

INSERT INTO `Medicines` (`medicineId`, `medicineName`, `medicineType`, `unitePrice`, `quantity`, `dateOfManu`, `expireDate`) VALUES
(1, 'name1', 'type1', 13, -300, '2009-01-03', '0000-00-00'),
(2, 'adad', 'adad', 123, -216, '2000-02-13', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `Nurses`
--

CREATE TABLE `Nurses` (
  `nurseId` int(11) NOT NULL,
  `dateOfAppointment` date NOT NULL,
  `fName` varchar(30) NOT NULL,
  `mName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `contactId` int(11) NOT NULL,
  `presAddress` int(11) NOT NULL,
  `permAddress` int(11) DEFAULT NULL,
  `dutyShift` varchar(7) NOT NULL,
  `superviserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Nurses`
--

INSERT INTO `Nurses` (`nurseId`, `dateOfAppointment`, `fName`, `mName`, `lName`, `dateOfBirth`, `contactId`, `presAddress`, `permAddress`, `dutyShift`, `superviserId`) VALUES
(1, '0000-00-00', 'qweqe', 'sdf', 'fsa', '0000-00-00', 42, 79, 80, 'gfsdfg', 1),
(2, '0000-00-00', 'adfasdf', 'dfadf', 'dfadf', '0000-00-00', 43, 81, 82, 'adfad', 2342);

-- --------------------------------------------------------

--
-- Table structure for table `nurse_exper`
--

CREATE TABLE `nurse_exper` (
  `nurseId` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `started` date DEFAULT NULL,
  `till` date DEFAULT NULL,
  `org` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurse_exper`
--

INSERT INTO `nurse_exper` (`nurseId`, `title`, `started`, `till`, `org`) VALUES
(2, 'habi ', '0000-00-00', '0000-00-00', 'na na '),
(2, 'abba', '0000-00-00', '0000-00-00', 'and'),
(2, 'abdba', '0000-00-00', '0000-00-00', 'af');

-- --------------------------------------------------------

--
-- Table structure for table `nurse_qualifi`
--

CREATE TABLE `nurse_qualifi` (
  `nurseId` int(11) NOT NULL,
  `quaId` int(11) NOT NULL,
  `board` varchar(30) NOT NULL,
  `year` date NOT NULL,
  `cgpa` double(4,2) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurse_qualifi`
--

INSERT INTO `nurse_qualifi` (`nurseId`, `quaId`, `board`, `year`, `cgpa`, `position`) VALUES
(2, 101, 'dhaka', '0000-00-00', 5.00, 1111),
(2, 102, 'dhaka', '0000-00-00', 4.60, 3000),
(2, 104, 'adad', '0000-00-00', 3.00, 232);

-- --------------------------------------------------------

--
-- Table structure for table `Patients`
--

CREATE TABLE `Patients` (
  `patientId` int(11) NOT NULL,
  `dateOfAdmission` date DEFAULT NULL,
  `fName` varchar(30) DEFAULT '',
  `mName` varchar(30) DEFAULT '',
  `lName` varchar(30) DEFAULT '',
  `dateOfBirth` date DEFAULT NULL,
  `contactId` int(11) DEFAULT NULL,
  `presAddress` int(11) DEFAULT NULL,
  `permAddress` int(11) DEFAULT NULL,
  `profession` varchar(45) DEFAULT NULL,
  `amountDeposite` double DEFAULT NULL,
  `wardId` int(11) DEFAULT NULL,
  `depositorName` varchar(60) DEFAULT NULL,
  `depositorsRel` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Patients`
--

INSERT INTO `Patients` (`patientId`, `dateOfAdmission`, `fName`, `mName`, `lName`, `dateOfBirth`, `contactId`, `presAddress`, `permAddress`, `profession`, `amountDeposite`, `wardId`, `depositorName`, `depositorsRel`) VALUES
(11, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Qualifications`
--

CREATE TABLE `Qualifications` (
  `quaId` int(11) NOT NULL,
  `quaName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Qualifications`
--

INSERT INTO `Qualifications` (`quaId`, `quaName`) VALUES
(101, 'SSC'),
(102, 'HSC'),
(103, 'MBBS'),
(104, 'BSC');

-- --------------------------------------------------------

--
-- Table structure for table `testAdviced`
--

CREATE TABLE `testAdviced` (
  `adviceId` int(11) DEFAULT NULL,
  `testName` varchar(40) DEFAULT NULL,
  `testCategory` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `testPros`
--

CREATE TABLE `testPros` (
  `testId` int(11) NOT NULL,
  `cId` int(11) DEFAULT NULL,
  `aID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user`, `pass`, `id`) VALUES
('admin', 'admin', 1),
('doc1', '12345', 2),
('riyad', 'habijabi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Wards`
--

CREATE TABLE `Wards` (
  `wardId` int(11) NOT NULL,
  `warName` varchar(30) DEFAULT NULL,
  `registerId` int(11) NOT NULL,
  `superviserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Wards`
--

INSERT INTO `Wards` (`wardId`, `warName`, `registerId`, `superviserId`) VALUES
(1, 'word1', 2, 2),
(2, 'word2', 1, 1),
(3, 'adad', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `WHO`
--

CREATE TABLE `WHO` (
  `id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WHO`
--

INSERT INTO `WHO` (`id`, `type`) VALUES
(1, 'admin'),
(2, 'doctor'),
(3, 'nurse'),
(4, 'patient');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Addresses`
--
ALTER TABLE `Addresses`
  ADD PRIMARY KEY (`addressId`);

--
-- Indexes for table `Admitted`
--
ALTER TABLE `Admitted`
  ADD KEY `patientId` (`patientId`),
  ADD KEY `bedId` (`bedId`);

--
-- Indexes for table `Advices`
--
ALTER TABLE `Advices`
  ADD PRIMARY KEY (`AdviceId`),
  ADD KEY `doctorId` (`doctorId`),
  ADD KEY `patientId` (`patientId`);

--
-- Indexes for table `Beds`
--
ALTER TABLE `Beds`
  ADD PRIMARY KEY (`bedId`),
  ADD KEY `wardId` (`wardId`);

--
-- Indexes for table `Bills`
--
ALTER TABLE `Bills`
  ADD KEY `patientId` (`patientId`);

--
-- Indexes for table `Contacts`
--
ALTER TABLE `Contacts`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `Doctors`
--
ALTER TABLE `Doctors`
  ADD PRIMARY KEY (`doctorId`),
  ADD KEY `contactId` (`contactId`),
  ADD KEY `presAddress` (`presAddress`),
  ADD KEY `permAddress` (`permAddress`);

--
-- Indexes for table `doc_exper`
--
ALTER TABLE `doc_exper`
  ADD KEY `doctorId` (`doctorId`);

--
-- Indexes for table `doc_qualifi`
--
ALTER TABLE `doc_qualifi`
  ADD KEY `doctorId` (`doctorId`),
  ADD KEY `quaId` (`quaId`);

--
-- Indexes for table `Investigations`
--
ALTER TABLE `Investigations`
  ADD KEY `patientId` (`patientId`),
  ADD KEY `doctorId` (`doctorId`);

--
-- Indexes for table `medicineAdviced`
--
ALTER TABLE `medicineAdviced`
  ADD PRIMARY KEY (`medAdId`),
  ADD KEY `medicineId` (`medicineId`),
  ADD KEY `adviceId` (`adviceId`);

--
-- Indexes for table `Medicines`
--
ALTER TABLE `Medicines`
  ADD PRIMARY KEY (`medicineId`);

--
-- Indexes for table `Nurses`
--
ALTER TABLE `Nurses`
  ADD PRIMARY KEY (`nurseId`),
  ADD KEY `contactId` (`contactId`),
  ADD KEY `presAddress` (`presAddress`),
  ADD KEY `permAddress` (`permAddress`);

--
-- Indexes for table `nurse_exper`
--
ALTER TABLE `nurse_exper`
  ADD KEY `nurseId` (`nurseId`);

--
-- Indexes for table `nurse_qualifi`
--
ALTER TABLE `nurse_qualifi`
  ADD KEY `quaId` (`quaId`),
  ADD KEY `nurseId` (`nurseId`);

--
-- Indexes for table `Patients`
--
ALTER TABLE `Patients`
  ADD PRIMARY KEY (`patientId`),
  ADD KEY `presAddress` (`presAddress`),
  ADD KEY `permAddress` (`permAddress`),
  ADD KEY `wardId` (`wardId`);

--
-- Indexes for table `Qualifications`
--
ALTER TABLE `Qualifications`
  ADD PRIMARY KEY (`quaId`);

--
-- Indexes for table `testAdviced`
--
ALTER TABLE `testAdviced`
  ADD KEY `adviceId` (`adviceId`);

--
-- Indexes for table `Wards`
--
ALTER TABLE `Wards`
  ADD PRIMARY KEY (`wardId`),
  ADD KEY `registerId` (`registerId`),
  ADD KEY `superviserId` (`superviserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Addresses`
--
ALTER TABLE `Addresses`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `Advices`
--
ALTER TABLE `Advices`
  MODIFY `AdviceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Beds`
--
ALTER TABLE `Beds`
  MODIFY `bedId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Contacts`
--
ALTER TABLE `Contacts`
  MODIFY `contactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `Doctors`
--
ALTER TABLE `Doctors`
  MODIFY `doctorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `medicineAdviced`
--
ALTER TABLE `medicineAdviced`
  MODIFY `medAdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `Medicines`
--
ALTER TABLE `Medicines`
  MODIFY `medicineId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Nurses`
--
ALTER TABLE `Nurses`
  MODIFY `nurseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Patients`
--
ALTER TABLE `Patients`
  MODIFY `patientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Wards`
--
ALTER TABLE `Wards`
  MODIFY `wardId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Admitted`
--
ALTER TABLE `Admitted`
  ADD CONSTRAINT `admitted_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `Patients` (`patientId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admitted_ibfk_2` FOREIGN KEY (`bedId`) REFERENCES `Beds` (`bedId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Advices`
--
ALTER TABLE `Advices`
  ADD CONSTRAINT `advices_ibfk_1` FOREIGN KEY (`doctorId`) REFERENCES `Doctors` (`doctorId`),
  ADD CONSTRAINT `advices_ibfk_2` FOREIGN KEY (`patientId`) REFERENCES `Patients` (`patientId`);

--
-- Constraints for table `Beds`
--
ALTER TABLE `Beds`
  ADD CONSTRAINT `wardId` FOREIGN KEY (`wardId`) REFERENCES `Wards` (`wardId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Bills`
--
ALTER TABLE `Bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `Patients` (`patientId`);

--
-- Constraints for table `Doctors`
--
ALTER TABLE `Doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `Contacts` (`contactId`),
  ADD CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`presAddress`) REFERENCES `Addresses` (`addressId`),
  ADD CONSTRAINT `doctors_ibfk_3` FOREIGN KEY (`permAddress`) REFERENCES `Addresses` (`addressId`);

--
-- Constraints for table `doc_exper`
--
ALTER TABLE `doc_exper`
  ADD CONSTRAINT `doc_exper_ibfk_1` FOREIGN KEY (`doctorId`) REFERENCES `Doctors` (`doctorId`);

--
-- Constraints for table `doc_qualifi`
--
ALTER TABLE `doc_qualifi`
  ADD CONSTRAINT `doc_qualifi_ibfk_1` FOREIGN KEY (`doctorId`) REFERENCES `Doctors` (`doctorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doc_qualifi_ibfk_2` FOREIGN KEY (`quaId`) REFERENCES `Qualifications` (`quaId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Investigations`
--
ALTER TABLE `Investigations`
  ADD CONSTRAINT `investigations_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `Patients` (`patientId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `investigations_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `Doctors` (`doctorId`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `medicineAdviced`
--
ALTER TABLE `medicineAdviced`
  ADD CONSTRAINT `medicineadviced_ibfk_1` FOREIGN KEY (`medicineId`) REFERENCES `Medicines` (`medicineId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `medicineadviced_ibfk_2` FOREIGN KEY (`adviceId`) REFERENCES `Advices` (`AdviceId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Nurses`
--
ALTER TABLE `Nurses`
  ADD CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `Contacts` (`contactId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `nurses_ibfk_2` FOREIGN KEY (`presAddress`) REFERENCES `Addresses` (`addressId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `nurses_ibfk_3` FOREIGN KEY (`permAddress`) REFERENCES `Addresses` (`addressId`) ON UPDATE CASCADE;

--
-- Constraints for table `nurse_exper`
--
ALTER TABLE `nurse_exper`
  ADD CONSTRAINT `nurse_exper_ibfk_1` FOREIGN KEY (`nurseId`) REFERENCES `Nurses` (`nurseId`);

--
-- Constraints for table `nurse_qualifi`
--
ALTER TABLE `nurse_qualifi`
  ADD CONSTRAINT `nurse_qualifi_ibfk_1` FOREIGN KEY (`nurseId`) REFERENCES `Nurses` (`nurseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nurse_qualifi_ibfk_2` FOREIGN KEY (`quaId`) REFERENCES `Qualifications` (`quaId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Patients`
--
ALTER TABLE `Patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`presAddress`) REFERENCES `Addresses` (`addressId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`permAddress`) REFERENCES `Addresses` (`addressId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `patients_ibfk_3` FOREIGN KEY (`wardId`) REFERENCES `Wards` (`wardId`) ON UPDATE CASCADE;

--
-- Constraints for table `testAdviced`
--
ALTER TABLE `testAdviced`
  ADD CONSTRAINT `testadviced_ibfk_1` FOREIGN KEY (`adviceId`) REFERENCES `Advices` (`AdviceId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
