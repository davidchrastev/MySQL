USE restaurant;

SELECT
    department_id,
    COUNT(id) as 'Number of employees'
FROM employees
GROUP BY department_id;

