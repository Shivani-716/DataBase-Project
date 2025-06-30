-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Little_lemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Little_lemon_db` DEFAULT CHARACTER SET utf8 ;
USE `Little_lemon_db` ;

-- -----------------------------------------------------
-- Table `Little_lemon_db`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_lemon_db`.`Customer` (
  `CustomerId` INT NOT NULL,
  `CustomerName` VARCHAR(45) NULL,
  `Phonenumber` CHAR(10) NULL,
  `CustomerEmail` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_lemon_db`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_lemon_db`.`Bookings` (
  `BookingId` INT NOT NULL,
  `BookingDate` DATE NULL,
  `Table_no` INT NULL,
  `CustomerId` INT NULL,
  PRIMARY KEY (`BookingId`),
  INDEX `CustomerId_idx` (`CustomerId` ASC) VISIBLE,
  CONSTRAINT `CustomerId`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `Little_lemon_db`.`Customer` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_lemon_db`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_lemon_db`.`Staff` (
  `StaffId` INT NOT NULL,
  `StaffName` VARCHAR(45) NULL,
  `Role` VARCHAR(45) NULL,
  PRIMARY KEY (`StaffId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_lemon_db`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_lemon_db`.`category` (
  `Category_Id` INT NOT NULL,
  `CategoryName` VARCHAR(45) NULL,
  PRIMARY KEY (`Category_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_lemon_db`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_lemon_db`.`Menu` (
  `Men_Id` INT NOT NULL,
  `Category_Id` VARCHAR(255) NULL,
  `itemName` VARCHAR(45) NULL,
  `Description` VARCHAR(255) NULL,
  `Price` DECIMAL NULL,
  PRIMARY KEY (`Men_Id`),
  INDEX `CategoryId_idx` (`Category_Id` ASC) VISIBLE,
  CONSTRAINT `Fk_CategoryId`
    FOREIGN KEY (`Category_Id`)
    REFERENCES `Little_lemon_db`.`category` (`Category_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_lemon_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_lemon_db`.`Orders` (
  `Order_Id` INT NOT NULL,
  `OrdersDate` DATE NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL NULL,
  `Booking_Id` INT NULL,
  `Staff_Id` INT NULL,
  `Mneu_Id` INT NULL,
  PRIMARY KEY (`Order_Id`),
  INDEX `BookingId_idx` (`Booking_Id` ASC) VISIBLE,
  INDEX `Staffid_idx` (`Staff_Id` ASC) VISIBLE,
  INDEX `MenuId_idx` (`Mneu_Id` ASC) VISIBLE,
  CONSTRAINT `BookingId`
    FOREIGN KEY (`Booking_Id`)
    REFERENCES `Little_lemon_db`.`Bookings` (`BookingId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Staffid`
    FOREIGN KEY (`Staff_Id`)
    REFERENCES `Little_lemon_db`.`Staff` (`StaffId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MenuId`
    FOREIGN KEY (`Mneu_Id`)
    REFERENCES `Little_lemon_db`.`Menu` (`Men_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_lemon_db`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_lemon_db`.`Delivery` (
  `DeliveryId` INT NOT NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `DeliveryDate` DATE NULL,
  `Order_id` INT NULL,
  PRIMARY KEY (`DeliveryId`),
  INDEX `Fk_order_id_idx` (`Order_id` ASC) VISIBLE,
  CONSTRAINT `Fk_order_id`
    FOREIGN KEY (`Order_id`)
    REFERENCES `Little_lemon_db`.`Orders` (`Order_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
