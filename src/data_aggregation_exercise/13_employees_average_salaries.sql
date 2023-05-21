USE soft_uni;

CREATE TABLE highest_paid_employees AS (
    SELECT *
    FROM employees
    WHERE `salary` > 30000
);

ALTER TABLE highest_paid_employees
MODIFY `employee_id` INT NOT NULL PRIMARY KEY;

DELETE
FROM highest_paid_employees
WHERE `manager_id` = 42 AND `employee_id` > 0;

UPDATE highest_paid_employees
SET `salary` = `salary` + 5000
WHERE `department_id` = 1
AND `employee_id` > 0;

SELECT `department_id`,
    AVG(`salary`) AS `avg_salary`
FROM highest_paid_employees
GROUP BY `department_id`
ORDER BY `department_id`;
