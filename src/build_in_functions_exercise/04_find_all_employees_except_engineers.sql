USE soft_uni;

SELECT
    first_name,
    last_name
FROM
    employees
WHERE
    LOCATE('engineer', job_title) = 0
ORDER BY employee_id;
