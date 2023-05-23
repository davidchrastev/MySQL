USE camp;

CREATE TABLE `mountains` (
    `id` INT PRIMARY KEY,
    `name` VARCHAR(255)
);

CREATE TABLE `peaks` (
    `id` INT PRIMARY KEY,
    `name` VARCHAR(255),
    `mountain_id` INT,
     FOREIGN KEY (`mountain_id`) REFERENCES mountains(`id`)
);
