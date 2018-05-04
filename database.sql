
Medicine Table:
CREATE TABLE `hms`.`Medicines`(
`medicineId` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
`medicineName` VARCHAR(40) NOT NULL ,
`medicineType` VARCHAR(30) NOT NULL ,
`unitePrice` DOUBLE NOT NULL ,
`quantity` INT NOT NULL ,
`dateOfManu` DATE NOT NULL ,
`expireDate` DATE NOT NULL ,
PRIMARY KEY (`medicineId`)
) ENGINE = InnoDB;

​
