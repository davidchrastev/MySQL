USE `soft_uni`;


DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(`salary_level` VARCHAR(7))
BEGIN
    SELECT `first_name`,
           `last_name`
    FROM `employees`
    WHERE
       (SELECT ufn_get_salary_level(`salary_level`)) = 'Low'
    OR (SELECT ufn_get_salary_level(`salary_level`)) = 'Average'
    OR (SELECT ufn_get_salary_level(`salary_level`)) = 'High'
    ORDER BY `first_name` DESC,
             `last_name` DESC;
END $$;

DELIMITER ;

CALL usp_get_employees_by_salary_level('Average');

