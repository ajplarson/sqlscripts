-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`drink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`drink` (
  `drinkid` INT(11) NOT NULL AUTO_INCREMENT,
  `drinkname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`drinkid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`size`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`size` (
  `sizeid` INT(11) NOT NULL AUTO_INCREMENT,
  `sizename` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sizeid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`drinksize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`drinksize` (
  `drinkid` INT(11) NOT NULL,
  `sizeid` INT(11) NOT NULL,
  `drinksizeid` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`drinksizeid`),
  INDEX `sizeid_idx` (`sizeid` ASC) VISIBLE,
  INDEX `drinkid` (`drinkid` ASC) VISIBLE,
  CONSTRAINT `drinkid`
    FOREIGN KEY (`drinkid`)
    REFERENCES `mydb`.`drink` (`drinkid`),
  CONSTRAINT `sizeid`
    FOREIGN KEY (`sizeid`)
    REFERENCES `mydb`.`size` (`sizeid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`time` (
  `timeid` INT(11) NOT NULL AUTO_INCREMENT,
  `time` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`timeid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`timedrinkprice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`timedrinkprice` (
  `timedrinkpriceid` INT(11) NOT NULL AUTO_INCREMENT,
  `drinksizeid` INT(11) NOT NULL,
  `timeid` INT(11) NOT NULL,
  PRIMARY KEY (`timedrinkpriceid`),
  INDEX `drinksizeid_idx` (`drinksizeid` ASC) VISIBLE,
  INDEX `timeid_idx` (`timeid` ASC) VISIBLE,
  CONSTRAINT `drinksizeid`
    FOREIGN KEY (`drinksizeid`)
    REFERENCES `mydb`.`drinksize` (`drinksizeid`),
  CONSTRAINT `timeid`
    FOREIGN KEY (`timeid`)
    REFERENCES `mydb`.`time` (`timeid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`drinkprice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`drinkprice` (
  `drinkpriceid` INT(11) NOT NULL AUTO_INCREMENT,
  `drinkprice` DECIMAL(10,0) NOT NULL,
  `timedrinkpriceid` INT(11) NOT NULL,
  PRIMARY KEY (`drinkpriceid`),
  INDEX `timedrinkpriceid_idx` (`timedrinkpriceid` ASC) VISIBLE,
  CONSTRAINT `timedrinkpriceid`
    FOREIGN KEY (`timedrinkpriceid`)
    REFERENCES `mydb`.`timedrinkprice` (`timedrinkpriceid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`food` (
  `foodid` INT(11) NOT NULL,
  `foodname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`foodid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`foodprice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`foodprice` (
  `foodpriceid` INT NOT NULL AUTO_INCREMENT,
  `foodtimeid` INT NOT NULL,
  `foodprice` DECIMAL NOT NULL,
  PRIMARY KEY (`foodpriceid`),
  INDEX `fk_foodprice_foodtime1_idx` (`foodtimeid` ASC) VISIBLE,
  CONSTRAINT `fk_foodprice_foodtime1`
    FOREIGN KEY (`foodtimeid`)
    REFERENCES `mydb`.`foodtime` (`foodtimeid`)
     ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`foodtime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`foodtime` (
  `foodtimeid` INT NOT NULL AUTO_INCREMENT,
  `timeid` INT NOT NULL,
  `foodid` INT NOT NULL,
  PRIMARY KEY (`foodtimeid`),
  INDEX `fk_foodtime_food1_idx` (`foodid` ASC) VISIBLE,
  INDEX `fk_foodtime_time1_idx` (`timeid` ASC) VISIBLE,
  CONSTRAINT `fk_foodtime_food1`
    FOREIGN KEY (`foodid`)
    REFERENCES `mydb`.`food` (`foodid`),
    CONSTRAINT `fk_foodtime_time1`
    FOREIGN KEY (`timeid`)
    REFERENCES `mydb`.`time` (`timeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`order` (
  `orderid` INT NOT NULL AUTO_INCREMENT,
  `drinkpriceid` INT NOT NULL,
  `foodpriceid` INT NOT NULL,
  `total` DECIMAL NOT NULL,
  PRIMARY KEY (`orderid`),
  INDEX `fk_order_foodprice1_idx` (`foodpriceid` ASC) VISIBLE,
  INDEX `fk_order_drinkprice1_idx` (`drinkpriceid` ASC) VISIBLE,
  CONSTRAINT `fk_order_foodprice1`
    FOREIGN KEY (`foodpriceid`)
    REFERENCES `mydb`.`foodprice` (`foodpriceid`),
    CONSTRAINT `fk_order_drinkprice1`
    FOREIGN KEY (`drinkpriceid`)
    REFERENCES `mydb`.`drinkprice` (`drinkpriceid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
