USE `soft_uni`;

SELECT
    e.`employee_id`,
    e.`job_title`,
    a.`address_id`,
    a.`address_text`
FROM `employees` as e
RIGHT JOIN `addresses` a on a.`address_id` = e.`address_id`
ORDER BY a.`address_id`
LIMIT 5;