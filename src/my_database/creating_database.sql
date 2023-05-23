CREATE DATABASE `sales`;

USE sales;

CREATE TABLE `customers` (
  `customer_id` INT PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(30),
  `last_name` VARCHAR(30),
  `email` VARCHAR(30)
);

CREATE TABLE `orders` (
    `order_id` INT PRIMARY KEY AUTO_INCREMENT,
    `customer_id` INT,
    `store_id` INT,
    `staff_id` INT
);

CREATE TABLE `staffs` (
    `staff_id` INT PRIMARY KEY AUTO_INCREMENT,
    `store_id` INT,
    `manager_id` INT
);

CREATE TABLE `stores` (
    `store_id` INT PRIMARY KEY AUTO_INCREMENT,
    `store_name` VARCHAR(30)
);


CREATE TABLE `order_items` (
    `order_id` INT,
    `item_id` INT  PRIMARY KEY AUTO_INCREMENT,
    `product_id` INT
);

CREATE DATABASE `production`;
USE `production`;

CREATE TABLE `categories` (
    `category_id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(30)
);

CREATE TABLE `products` (
    `product_id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_id` INT,
    `brand_id` INT
);

CREATE TABLE `stocks` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `store_id` INT,
    `product_id` INT
);

CREATE TABLE `brands` (
    `brand_id` INT PRIMARY KEY AUTO_INCREMENT,
    `brand_name` VARCHAR(30)
);

USE sales;

ALTER TABLE `orders`
ADD CONSTRAINT fk_customer
FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`),
ADD CONSTRAINT fk_staff
FOREIGN KEY (`staff_id`) REFERENCES `staffs`(`staff_id`),
ADD CONSTRAINT fk_store
FOREIGN KEY (`store_id`) REFERENCES `stores`(`store_id`);


ALTER TABLE `staffs`
ADD CONSTRAINT fk_store_id
FOREIGN KEY (`store_id`) REFERENCES `stores`(`store_id`);

ALTER TABLE `staffs`
ADD CONSTRAINT fk_manager_id
FOREIGN KEY (`manager_id`) REFERENCES `staffs`(`staff_id`);

ALTER TABLE `order_items`
ADD CONSTRAINT fk_product
FOREIGN KEY (`product_id`) REFERENCES `production`.products(`product_id`),
ADD CONSTRAINT fk_order_id
FOREIGN KEY (`order_id`) REFERENCES orders(`order_id`);

USE production;

ALTER TABLE `products`
ADD CONSTRAINT fk_category
FOREIGN KEY (`category_id`) REFERENCES categories(`category_id`),
ADD CONSTRAINT fk_brand
FOREIGN KEY (`brand_id`) REFERENCES brands(`brand_id`);

ALTER TABLE `stocks`
ADD CONSTRAINT fk_store_id
FOREIGN KEY (`store_id`) REFERENCES sales.stores(`store_id`),
ADD CONSTRAINT fk_product_id
FOREIGN KEY (`product_id`) REFERENCES products(`product_id`);

