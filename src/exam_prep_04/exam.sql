CREATE DATABASE `stc`;

USE `stc`;

CREATE TABLE `addresses` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE `categories` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL
);

CREATE TABLE `clients` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE drivers (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name  VARCHAR(30) NOT NULL,
    age        INT         NOT NULL,
    rating     FLOAT DEFAULT 5.5
);

CREATE TABLE `cars` (
  id INT PRIMARY KEY AUTO_INCREMENT,
  make VARCHAR(20) NOT NULL,
  model VARCHAR(20) NOT NULL,
  year INT NOT NULL DEFAULT 0,
  mileage INT DEFAULT 0,
  `condition` CHAR(1),
  category_id INT NOT NULL,
  CONSTRAINT fk_cars_categories
  FOREIGN KEY (`category_id`) REFERENCES categories(`id`)
);

CREATE TABLE `courses` (
  id INT PRIMARY KEY AUTO_INCREMENT,
  from_address_id INT NOT NULL,
  start DATETIME NOT NULL,
  bill DECIMAL (10,2) DEFAULT 10,
  car_id INT NOT NULL,
  client_id INT NOT NULL,
  CONSTRAINT fk_courses_addresses
                       FOREIGN KEY (`from_address_id`) REFERENCES addresses(id),
  CONSTRAINT fk_courses_cars
                       FOREIGN KEY (`car_id`) REFERENCES cars(id),
  CONSTRAINT fk_courses_clients
                       FOREIGN KEY (`client_id`) REFERENCES clients(id)

);

CREATE TABLE cars_drivers (
                              car_id INT NOT NULL,
                              driver_id INT NOT NULL,
                              PRIMARY KEY (car_id, driver_id),
                              FOREIGN KEY (car_id) REFERENCES cars(id),
                              FOREIGN KEY (driver_id) REFERENCES drivers(id)
);


INSERT INTO clients (full_name, phone_number)
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name, CONCAT('(088) 9999', id * 2) AS phone_number
FROM drivers
WHERE id BETWEEN 10 AND 20;
