-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_db` DEFAULT CHARACTER SET utf8mb3 ;
USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Table `little_lemon_db`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`customer` (
  `CustomerId` VARCHAR(100) NOT NULL,
  `CustomerName` VARCHAR(45) NULL DEFAULT NULL,
  `Phonenumber` CHAR(10) NULL DEFAULT NULL,
  `CustomerEmail` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`bookings` (
  `BookingId` INT NOT NULL,
  `BookingDate` DATE NULL DEFAULT NULL,
  `Table_no` INT NULL DEFAULT NULL,
  `CustomerId` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`BookingId`),
  INDEX `CustomerId_idx` (`CustomerId` ASC) VISIBLE,
  CONSTRAINT `CustomerId`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `little_lemon_db`.`customer` (`CustomerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`menuitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`menuitem` (
  `MenuitemsId` VARCHAR(100) NOT NULL,
  `Coursename` VARCHAR(100) NULL DEFAULT NULL,
  `StarterName` VARCHAR(100) NULL DEFAULT NULL,
  `DesertName` VARCHAR(100) NULL DEFAULT NULL,
  `Drinks` VARCHAR(100) NULL DEFAULT NULL,
  `Sides` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuitemsId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`menu` (
  `Men_Id` INT NOT NULL,
  `itemName` VARCHAR(45) NULL DEFAULT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `Price` DECIMAL(10,0) NULL DEFAULT NULL,
  `Cuisine_name` VARCHAR(255) NULL DEFAULT NULL,
  `MenuitemsId` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`Men_Id`),
  INDEX `MenuitemsId` (`MenuitemsId` ASC) VISIBLE,
  CONSTRAINT `MenuitemsId`
    FOREIGN KEY (`MenuitemsId`)
    REFERENCES `little_lemon_db`.`menuitem` (`MenuitemsId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`staff` (
  `StaffId` INT NOT NULL,
  `StaffName` VARCHAR(45) NULL DEFAULT NULL,
  `Role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`StaffId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`orders` (
  `Order_Id` VARCHAR(100) NOT NULL,
  `OrdersDate` DATE NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `TotalCost` DECIMAL(10,0) NULL DEFAULT NULL,
  `Booking_Id` INT NULL DEFAULT NULL,
  `Staff_Id` INT NULL DEFAULT NULL,
  `Mneu_Id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Order_Id`),
  INDEX `BookingId_idx` (`Booking_Id` ASC) VISIBLE,
  INDEX `Staffid_idx` (`Staff_Id` ASC) VISIBLE,
  INDEX `MenuId_idx` (`Mneu_Id` ASC) VISIBLE,
  CONSTRAINT `BookingId`
    FOREIGN KEY (`Booking_Id`)
    REFERENCES `little_lemon_db`.`bookings` (`BookingId`),
  CONSTRAINT `MenuId`
    FOREIGN KEY (`Mneu_Id`)
    REFERENCES `little_lemon_db`.`menu` (`Men_Id`),
  CONSTRAINT `Staffid`
    FOREIGN KEY (`Staff_Id`)
    REFERENCES `little_lemon_db`.`staff` (`StaffId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`delivery` (
  `DeliveryId` INT NOT NULL,
  `DeliveryStatus` VARCHAR(45) NULL DEFAULT NULL,
  `DeliveryDate` DATE NULL DEFAULT NULL,
  `Order_id` VARCHAR(100) NULL DEFAULT NULL,
  `delivery_cost` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`DeliveryId`),
  INDEX `Fk_order_id_idx` (`Order_id` ASC) VISIBLE,
  CONSTRAINT `Order_id`
    FOREIGN KEY (`Order_id`)
    REFERENCES `little_lemon_db`.`orders` (`Order_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`littlelemon_data_1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`littlelemon_data_1` (
  `Row_num` INT NULL DEFAULT NULL,
  `Order_ID` VARCHAR(100) NULL DEFAULT NULL,
  `Order_date` DATE NULL DEFAULT NULL,
  `Delivery_Date` DATE NULL DEFAULT NULL,
  `CustomerId` VARCHAR(100) NULL DEFAULT NULL,
  `Customer_name` VARCHAR(100) NULL DEFAULT NULL,
  `City` TEXT NULL DEFAULT NULL,
  `Country` TEXT NULL DEFAULT NULL,
  `Postal Code` TEXT NULL DEFAULT NULL,
  `Country Code` TEXT NULL DEFAULT NULL,
  `Cost` INT NULL DEFAULT NULL,
  `Sales` DOUBLE NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `Discount` DOUBLE NULL DEFAULT NULL,
  `Delivery_cost` DECIMAL(10,0) NULL DEFAULT NULL,
  `Course_Name` VARCHAR(255) NULL DEFAULT NULL,
  `Cuisine_Name` VARCHAR(255) NULL DEFAULT NULL,
  `Starter_Name` VARCHAR(255) NULL DEFAULT NULL,
  `Desert_Name` VARCHAR(255) NULL DEFAULT NULL,
  `Drink` TEXT NULL DEFAULT NULL,
  `Sides` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
