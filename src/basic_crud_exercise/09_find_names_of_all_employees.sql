USE soft_uni;

SELECT
    CONCAT_WS(' ',
        `first_name`,
        `middle_name`,
        `last_name`)
        AS `Full Name`
FROM
    employees AS e
WHERE salary IN
      (25000,
       14000,
       12500,
       23600)
ORDER BY employee_id;

--    CONCAT(
--        first_name,
--        ' ',
--        middle_name,
--        ' ',
--        last_name)
--        AS `Full Name`

-- WHERE (salary  = 25000 ||
--       salary = 14000  ||
--       salary = 12500  ||
--       salary = 23600)