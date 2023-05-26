USE soft_uni;

SELECT
    `employee_id`,
    `first_name`,
    `last_name`,
    `department_id`,
    ROUND(`salary`, 4) AS `salary`
FROM employees
WHERE manager_id IS NULL;