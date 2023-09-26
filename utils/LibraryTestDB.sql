-- To create database and tables for unit testing 
CREATE DATABASE `librarytestdb`;
USE `librarytestdb`;
CREATE TABLE `librarytestdb`.`books` ( 
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
CREATE TABLE `librarytestdb`.`members` ( 
    `id` INT(11) NOT NULL AUTO_INCREMENT , 
    `name` VARCHAR(100)  , 
    `email` VARCHAR(100) ,
    `registered_on` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP , 
    `outstanding_debt` FLOAT , 
    `amount_spent` FLOAT  , 
    PRIMARY KEY (`id`)) ENGINE = InnoDB;
CREATE TABLE `librarytestdb`.`transactions` ( 
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
INSERT INTO `books` (`id`, `title`, `author`, `average_rating`, `isbn`, `isbn13`, `language_code`, `num_pages`, `ratings_count`, `text_reviews_count`, `publication_date`, `publisher`, `total_quantity`, `available_quantity`, `rented_count`) VALUES
(1, 'A Man Called Ove', 'Fredrik Backman', 4.5, '1476738017', '9781476738017', 'ENG', 337, 600, 300, '2012-08-01', 'Atria Books', 20, 20, 1);
INSERT INTO `members` (`id`, `name`, `email`, `registered_on`, `outstanding_debt`, `amount_spent`) VALUES
(1, 'Mitul David', 'mituldavid@gmail.com', '2021-06-14 11:23:01', 15, 50);
INSERT INTO `transactions` (`id`, `book_id`, `member_id`, `per_day_fee`, `borrowed_on`, `returned_on`, `total_charge`, `amount_paid`) VALUES
(1, 1, 1, 5, '2021-06-01 11:49:12', '2021-06-14 11:52:44', 65, 50);