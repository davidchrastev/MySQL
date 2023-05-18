USE soft_uni;


SELECT
    first_name,
    last_name
FROM
    employees
WHERE
    left(first_name, 2) LIKE 'Sa';