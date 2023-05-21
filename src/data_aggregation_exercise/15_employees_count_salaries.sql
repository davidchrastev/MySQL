USE soft_uni;

SELECT COUNT(`employee_id`) AS ''
FROM employees
WHERE `manager_id` IS NULL;