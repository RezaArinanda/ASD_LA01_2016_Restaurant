-- MySQL Script generated by MySQL Workbench
-- 05/16/16 13:55:06
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema latteincafe_v2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `latteincafe_v2` ;

-- -----------------------------------------------------
-- Schema latteincafe_v2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `latteincafe_v2` DEFAULT CHARACTER SET utf8 ;
USE `latteincafe_v2` ;

-- -----------------------------------------------------
-- Table `latteincafe_v2`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`role` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`role` (
  `role_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `latteincafe_v2`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`user` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`user` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `role_role_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `role_role_id`),
  INDEX `fk_user_role1_idx` (`role_role_id` ASC),
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_role_id`)
    REFERENCES `latteincafe_v2`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `latteincafe_v2`.`produk`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`produk` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`produk` (
  `produk_id` INT NOT NULL,
  `nama` VARCHAR(45) NULL,
  `harga` DOUBLE NULL,
  `jenis` VARCHAR(45) NULL,
  `Avability` TINYINT(1) NULL,
  PRIMARY KEY (`produk_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `latteincafe_v2`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`order` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`order` (
  `order_id` INT NOT NULL,
  `status_order` VARCHAR(45) NULL,
  `order_datetime` DATETIME NULL,
  `user_user_id` INT NOT NULL,
  `ordercol` VARCHAR(45) NULL,
  PRIMARY KEY (`order_id`, `user_user_id`),
  INDEX `fk_order_user1_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `latteincafe_v2`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `latteincafe_v2`.`order_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`order_item` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`order_item` (
  `order_item_id` INT NOT NULL,
  `order_order_id` INT NOT NULL,
  `order_user_user_id` INT NOT NULL,
  `produk_produk_id` INT NOT NULL,
  `qty` INT NULL,
  PRIMARY KEY (`order_item_id`, `order_order_id`, `order_user_user_id`, `produk_produk_id`),
  INDEX `fk_order_item_order1_idx` (`order_order_id` ASC, `order_user_user_id` ASC),
  INDEX `fk_order_item_produk1_idx` (`produk_produk_id` ASC),
  CONSTRAINT `fk_order_item_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `latteincafe_v2`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_item_produk1`
    FOREIGN KEY (`produk_produk_id`)
    REFERENCES `latteincafe_v2`.`produk` (`produk_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `latteincafe_v2`.`request_bill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`request_bill` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`request_bill` (
  `request_bill_id` INT NOT NULL,
  `order_order_id` INT NOT NULL,
  `order_user_user_id` INT NOT NULL,
  PRIMARY KEY (`request_bill_id`, `order_order_id`, `order_user_user_id`),
  INDEX `fk_request_bill_order1_idx` (`order_order_id` ASC, `order_user_user_id` ASC),
  CONSTRAINT `fk_request_bill_order1`
    FOREIGN KEY (`order_order_id` , `order_user_user_id`)
    REFERENCES `latteincafe_v2`.`order` (`order_id` , `user_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `latteincafe_v2`.`review_restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`review_restaurant` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`review_restaurant` (
  `review_restaurant_id` INT NOT NULL,
  `rating` INT NULL,
  `message` TEXT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`review_restaurant_id`, `user_user_id`),
  INDEX `fk_review_restaurant_user1_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_review_restaurant_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `latteincafe_v2`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `latteincafe_v2`.`review_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`review_item` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`review_item` (
  `review_item_id` INT NOT NULL,
  `rating` INT NULL,
  `message` TEXT NULL,
  `user_user_id` INT NOT NULL,
  `produk_produk_id` INT NOT NULL,
  PRIMARY KEY (`review_item_id`, `user_user_id`, `produk_produk_id`),
  INDEX `fk_review_item_user1_idx` (`user_user_id` ASC),
  INDEX `fk_review_item_produk1_idx` (`produk_produk_id` ASC),
  CONSTRAINT `fk_review_item_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `latteincafe_v2`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_item_produk1`
    FOREIGN KEY (`produk_produk_id`)
    REFERENCES `latteincafe_v2`.`produk` (`produk_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `latteincafe_v2`.`ingredients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`ingredients` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`ingredients` (
  `ingredients_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `expire_date` DATETIME NULL,
  `qty` INT NULL,
  PRIMARY KEY (`ingredients_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `latteincafe_v2`.`recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`recipe` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`recipe` (
  `recipe_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `produk_produk_id` INT NOT NULL,
  PRIMARY KEY (`recipe_id`, `produk_produk_id`),
  INDEX `fk_recipe_produk1_idx` (`produk_produk_id` ASC),
  CONSTRAINT `fk_recipe_produk1`
    FOREIGN KEY (`produk_produk_id`)
    REFERENCES `latteincafe_v2`.`produk` (`produk_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `latteincafe_v2`.`ingredients_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latteincafe_v2`.`ingredients_item` ;

CREATE TABLE IF NOT EXISTS `latteincafe_v2`.`ingredients_item` (
  `ingredients_item_id` INT NOT NULL,
  `qty` INT NULL,
  `ingredients_ingredients_id` INT NOT NULL,
  `recipe_recipe_id` INT NOT NULL,
  PRIMARY KEY (`ingredients_item_id`, `ingredients_ingredients_id`, `recipe_recipe_id`),
  INDEX `fk_ingredients_item_ingredients1_idx` (`ingredients_ingredients_id` ASC),
  INDEX `fk_ingredients_item_recipe1_idx` (`recipe_recipe_id` ASC),
  CONSTRAINT `fk_ingredients_item_ingredients1`
    FOREIGN KEY (`ingredients_ingredients_id`)
    REFERENCES `latteincafe_v2`.`ingredients` (`ingredients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredients_item_recipe1`
    FOREIGN KEY (`recipe_recipe_id`)
    REFERENCES `latteincafe_v2`.`recipe` (`recipe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
