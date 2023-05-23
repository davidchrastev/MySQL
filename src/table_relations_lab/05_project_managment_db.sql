CREATE DATABASE `project_management`;

USE `project_management`;

CREATE TABLE `clients`(
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `client_name` VARCHAR(100)
);

CREATE TABLE `projects` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `client_id` INT,
    `project_lead_id` INT
);

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `project_id` INT
);

ALTER TABLE `projects`
ADD CONSTRAINT fk_employee
FOREIGN KEY (`project_lead_id`) REFERENCES `employees`(`id`),
ADD CONSTRAINT fk_client
FOREIGN KEY (`client_id`) REFERENCES `clients`(`id`);

ALTER TABLE `employees`
ADD CONSTRAINT fk_project
FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`);