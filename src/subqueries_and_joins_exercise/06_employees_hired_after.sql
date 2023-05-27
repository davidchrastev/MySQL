USE `soft_uni`;

SELECT
    e.`first_name`,
    e.`last_name`,
    e.`hire_date`,
    d.`name` AS `dept_name`
FROM `employees` AS e
LEFT JOIN `departments` AS d ON e.`department_id` = d.`department_id`
WHERE e.`hire_date` > DATE('1999-01-01') AND (d.`name` = 'Sales' OR d.`name` = 'Finance')
ORDER BY e.`hire_date`;