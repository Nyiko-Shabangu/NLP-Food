-- Host: localhost    Database: FOOD_delivery
-- ------------------------------------------------------
-- Server version	8.0.42


-- Drop tables if they exist
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `order_tracking`;
DROP TABLE IF EXISTS `food_items`;


-- Create food_items table
CREATE TABLE `food_items` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Create orders table
CREATE TABLE `orders` (
  `order_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  `quantity` INT DEFAULT NULL,
  `total_price` DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`, `item_id`),
  KEY `orders_ibfk_1` (`item_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `food_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Create order_tracking table
CREATE TABLE `order_tracking` (
  `order_id` INT NOT NULL,
  `status` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;