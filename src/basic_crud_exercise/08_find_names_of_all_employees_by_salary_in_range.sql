USE soft_uni;

SELECT
    first_name, last_name, job_title
FROM employees
WHERE (salary >= 20000 && salary <= 30000)
ORDER BY employee_id;