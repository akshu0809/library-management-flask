CREATE DATABASE `librarydb`;
USE `librarydb`;
CREATE TABLE `librarydb`.`books` ( 
    `id` INT(11) NOT NULL AUTO_INCREMENT , 
    `title` VARCHAR(255)  , 
    `author` VARCHAR(255)  , 
    `average_rating` FLOAT NULL , 
    `isbn` VARCHAR(10)  , 
    `isbn13` VARCHAR(13)  , 
    `language_code` VARCHAR(3)  , 
    `num_pages` INT(5)  , 
    `ratings_count` INT(11)  , 
    `text_reviews_count` INT(11)  , 
    `publication_date` DATE  , 
    `publisher` VARCHAR(255)  , 
    `total_quantity` INT(11)  , 
    `available_quantity` INT(11)  , 
    `rented_count` INT(11)  , 
    PRIMARY KEY (`id`)) ENGINE = InnoDB;

CREATE TABLE `librarydb`.`members` ( 
    `id` INT(11) NOT NULL AUTO_INCREMENT , 
    `name` VARCHAR(100)  , 
    `email` VARCHAR(100)  ,
    `registered_on` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP , 
    `outstanding_debt` FLOAT  , 
    `amount_spent` FLOAT  , 
    PRIMARY KEY (`id`)) ENGINE = InnoDB;

CREATE TABLE `librarydb`.`transactions` ( 
    `id` INT(11) NOT NULL AUTO_INCREMENT , 
    `book_id` INT(11)  , 
    `member_id` INT(11)  , 
    `per_day_fee` FLOAT  , 
    `borrowed_on` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP , 
    `returned_on` TIMESTAMP NULL , 
    `total_charge` FLOAT NULL , 
    `amount_paid` FLOAT NULL , 
    PRIMARY KEY (`id`),
    FOREIGN KEY (`book_id`) REFERENCES books(`id`),
    FOREIGN KEY (`member_id`) REFERENCES members(`id`)) ENGINE = InnoDB;