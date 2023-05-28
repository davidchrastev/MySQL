USE `soft_uni`;

SELECT
    e.`employee_id`,
    e.`first_name`,
    p.`name`
FROM `employees` e
JOIN `employees_projects` ep on e.employee_id = ep.employee_id
JOIN `projects` p on ep.project_id = p.project_id
WHERE DATE(p.`start_date`) > DATE('2002-08-13') AND p.`end_date` IS NULL
ORDER BY `first_name`,
         p.`name`
LIMIT 5;