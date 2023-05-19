USE restaurant;

SELECT department_id, SUM(salary) AS 'Total Salaries'
FROM employees AS e
GROUP BY e.department_id
ORDER BY e.department_id DESC;

SELECT *
FROM employees;

SELECT count(*)
FROM employees;

SELECT `department_id`, COUNT(`id`) as 'Count people in department'
FROM employees
GROUP BY `department_id`;

SELECT `department_id`,
       SUM(`salary`) as 'sum salary'
FROM employees
WHERE id IN (6, 1, 9)
GROUP BY department_id;

# Промяна на колона
# ALTER TABLE employees
# CHANGE COLUMN `salary` salary DOUBLE;

## SUM(*), COUNT(*)
## подминават, ако колоната, която сме задали им НЪЛ

SELECT COUNT(salary)
FROM employees;

SELECT SUM(salary)
FROM employees;

SELECT MAX(salary)     as 'MAX SALARY',
       MAX(first_name) as 'MAX FIRST NAME'
FROM employees;

SELECT MIN(salary) as 'SMALLEST SALARY',
       MIN(salary) as 'SMALLEST FIRST NAME'
FROM employees;

SELECT ROUND(AVG(salary), 2)
FROM employees
ORDER BY department_id;

SELECT department_id,
       MIN(salary) AS 'Min Salary'
FROM employees
GROUP BY department_id
HAVING `Min Salary` > 800;

