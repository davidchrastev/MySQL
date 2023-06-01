USE `soft_uni`;

## usp_get_towns_starting_with

DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(`start` VARCHAR(50))
    BEGIN
SELECT
    `name` AS town_name
FROM `towns`
WHERE `name` LIKE CONCAT(`start`, '%')
ORDER BY `name`;
END $$
DELIMITER ;


