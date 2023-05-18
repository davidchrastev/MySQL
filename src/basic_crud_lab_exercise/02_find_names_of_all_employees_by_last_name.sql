USE soft_uni;

SELECT
    first_name,
    last_name
FROM
    employees
WHERE
    NOT LOCATE('ei', last_name) = 0;

/*
 LOCATE('ei', last_name) is an
 SQL string function that searches for the first occurrence
 of the substring 'ei' within the last_name column.
 It returns the position of the substring or 0 if it is not found.
 */