USE `soft_uni`;

SELECT
    `employee_id`,
    `first_name`,
    `manager_id`,
    (SELECT first_name
            FROM
                employees WHERE e.manager_id = employee_id)
FROM `employees` e
WHERE `manager_id` IN (3, 7)
ORDER BY `first_name`;



