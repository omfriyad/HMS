-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 09, 2018 at 12:04 AM
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
-- Database: `hms`
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
(1, '41', 'HUmming st', 'khapara', 'askjdf', 'kslajf'),
(2, '43', 'sdf st', 'sdf', 'sdfsdf', 'fgdhfh'),
(3, 'street', 'streetName', 'area', 'thana', 'district'),
(4, NULL, NULL, NULL, NULL, NULL),
(5, '21', 'stName', 'areName', 'thanaName', 'distName'),
(6, '23', '23', 'es', '234', 'wrwr'),
(7, '23', '23', 'es', '234', 'wrwr'),
(8, '23', '23', 'es', '234', 'wrwr'),
(9, '23', '23', 'es', '234', 'wrwr'),
(10, '23', '23', 'es', '234', 'wrwr'),
(11, '23', '23', 'es', '234', 'wrwr'),
(12, '3', 'adad', 'adsad', 'sdfsdf', 'adad'),
(13, '23', '23', 'es', '234', 'wrwr'),
(14, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Admitted`
--

CREATE TABLE `Admitted` (
  `patientId` int(11) NOT NULL,
  `bedId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Advices`
--

CREATE TABLE `Advices` (
  `AdviceId` int(11) NOT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `patientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `Contacts`
--

CREATE TABLE `Contacts` (
  `contactId` int(11) NOT NULL,
  `mob1` varchar(30) DEFAULT NULL,
  `mob2` varchar(30) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Contacts`
--

INSERT INTO `Contacts` (`contactId`, `mob1`, `mob2`, `email`) VALUES
(1, '01918134108', NULL, 'xdriyad@gmail.com'),
(2, '01918134108323', NULL, 'baal@saal.xom'),
(3, 'werwr', NULL, 'werwer'),
(4, 'werwr', NULL, 'werwer'),
(5, 'werwr', NULL, 'werwer'),
(6, 'werwr', NULL, 'werwer'),
(7, 'werwr', NULL, 'werwer'),
(8, 'werwr', NULL, 'werwer'),
(9, 'werwr', NULL, 'werwer');

-- --------------------------------------------------------

--
-- Table structure for table `Doctors`
--

CREATE TABLE `Doctors` (
  `doctorId` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `dateOfAppointment` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Doctors`
--

INSERT INTO `Doctors` (`doctorId`, `firstName`, `middleName`, `lastName`, `dateOfBirth`, `dateOfAppointment`) VALUES
(1, 'a', 'b', 'c', '2018-05-08', '2018-05-07');

-- --------------------------------------------------------

--
-- Table structure for table `doc_qualifi`
--

CREATE TABLE `doc_qualifi` (
  `doctorId` int(11) NOT NULL,
  `quaId` int(11) NOT NULL,
  `board` varchar(30) NOT NULL,
  `year` date NOT NULL,
  `cgpa` double(4,2) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doc_qualifi`
--

INSERT INTO `doc_qualifi` (`doctorId`, `quaId`, `board`, `year`, `cgpa`, `position`) VALUES
(1, 101, 'Dhaka', '2018-05-08', 3.41, 1);

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
  `beforeAfter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'Medicine 1', 'Type 1', 50, 100, '2018-05-23', '2018-05-01'),
(2, 'Medicine 2', 'type3', 121, 543, '2018-05-08', '2018-05-15');

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

-- --------------------------------------------------------

--
-- Table structure for table `Patients`
--

CREATE TABLE `Patients` (
  `patientId` int(11) NOT NULL,
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
  `depositorsRel` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(103, 'MBBS');

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
('doc1', '12345', 2);

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
-- Indexes for table `Contacts`
--
ALTER TABLE `Contacts`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `Doctors`
--
ALTER TABLE `Doctors`
  ADD PRIMARY KEY (`doctorId`);

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
-- Indexes for table `testPros`
--
ALTER TABLE `testPros`
  ADD PRIMARY KEY (`testId`),
  ADD KEY `cId` (`cId`),
  ADD KEY `aID` (`aID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD KEY `id` (`id`);

--
-- Indexes for table `Wards`
--
ALTER TABLE `Wards`
  ADD PRIMARY KEY (`wardId`),
  ADD KEY `registerId` (`registerId`),
  ADD KEY `superviserId` (`superviserId`);

--
-- Indexes for table `WHO`
--
ALTER TABLE `WHO`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Addresses`
--
ALTER TABLE `Addresses`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Advices`
--
ALTER TABLE `Advices`
  MODIFY `AdviceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Beds`
--
ALTER TABLE `Beds`
  MODIFY `bedId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Contacts`
--
ALTER TABLE `Contacts`
  MODIFY `contactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Doctors`
--
ALTER TABLE `Doctors`
  MODIFY `doctorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Medicines`
--
ALTER TABLE `Medicines`
  MODIFY `medicineId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Nurses`
--
ALTER TABLE `Nurses`
  MODIFY `nurseId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Patients`
--
ALTER TABLE `Patients`
  MODIFY `patientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testPros`
--
ALTER TABLE `testPros`
  MODIFY `testId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Wards`
--
ALTER TABLE `Wards`
  MODIFY `wardId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WHO`
--
ALTER TABLE `WHO`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Admitted`
--
ALTER TABLE `Admitted`
  ADD CONSTRAINT `admitted_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `Patients` (`patientId`),
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
  ADD CONSTRAINT `wardId` FOREIGN KEY (`wardId`) REFERENCES `Wards` (`wardId`);

--
-- Constraints for table `doc_qualifi`
--
ALTER TABLE `doc_qualifi`
  ADD CONSTRAINT `doc_qualifi_ibfk_1` FOREIGN KEY (`doctorId`) REFERENCES `Doctors` (`doctorId`) ON DELETE CASCADE,
  ADD CONSTRAINT `doc_qualifi_ibfk_2` FOREIGN KEY (`quaId`) REFERENCES `Qualifications` (`quaId`) ON DELETE CASCADE;

--
-- Constraints for table `Investigations`
--
ALTER TABLE `Investigations`
  ADD CONSTRAINT `investigations_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `Patients` (`patientId`),
  ADD CONSTRAINT `investigations_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `Doctors` (`doctorId`);

--
-- Constraints for table `medicineAdviced`
--
ALTER TABLE `medicineAdviced`
  ADD CONSTRAINT `medicineadviced_ibfk_1` FOREIGN KEY (`medicineId`) REFERENCES `Medicines` (`medicineId`),
  ADD CONSTRAINT `medicineadviced_ibfk_2` FOREIGN KEY (`adviceId`) REFERENCES `Advices` (`AdviceId`);

--
-- Constraints for table `Nurses`
--
ALTER TABLE `Nurses`
  ADD CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `Contacts` (`contactId`),
  ADD CONSTRAINT `nurses_ibfk_2` FOREIGN KEY (`presAddress`) REFERENCES `Addresses` (`addressId`),
  ADD CONSTRAINT `nurses_ibfk_3` FOREIGN KEY (`permAddress`) REFERENCES `Addresses` (`addressId`);

--
-- Constraints for table `Patients`
--
ALTER TABLE `Patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`presAddress`) REFERENCES `Addresses` (`addressId`),
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`permAddress`) REFERENCES `Addresses` (`addressId`),
  ADD CONSTRAINT `patients_ibfk_3` FOREIGN KEY (`wardId`) REFERENCES `Wards` (`wardId`);

--
-- Constraints for table `testAdviced`
--
ALTER TABLE `testAdviced`
  ADD CONSTRAINT `testadviced_ibfk_1` FOREIGN KEY (`adviceId`) REFERENCES `Advices` (`AdviceId`);

--
-- Constraints for table `testPros`
--
ALTER TABLE `testPros`
  ADD CONSTRAINT `testpros_ibfk_1` FOREIGN KEY (`cId`) REFERENCES `Contacts` (`contactId`),
  ADD CONSTRAINT `testpros_ibfk_2` FOREIGN KEY (`aID`) REFERENCES `Addresses` (`addressId`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id`) REFERENCES `WHO` (`id`);

--
-- Constraints for table `Wards`
--
ALTER TABLE `Wards`
  ADD CONSTRAINT `wards_ibfk_1` FOREIGN KEY (`registerId`) REFERENCES `Doctors` (`doctorId`),
  ADD CONSTRAINT `wards_ibfk_2` FOREIGN KEY (`superviserId`) REFERENCES `Nurses` (`nurseId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
