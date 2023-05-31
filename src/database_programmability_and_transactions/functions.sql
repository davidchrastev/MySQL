USE soft_uni;

SELECT 5;

DELIMITER $$
CREATE FUNCTION ufn_select_5()
    RETURNS INT
    DETERMINISTIC
BEGIN
    RETURN (SELECT 5);
END$$

DELIMITER ;
DROP FUNCTION ufn_select_5;

SELECT ufn_select_5();
SELECT CONCAT('a', 'b'), ufn_select_5();
SELECT * FROM towns WHERE town_id < ufn_select_5();

DELIMITER $$
CREATE FUNCTION ufn_append_before(str VARCHAR(50))
    RETURNS VARCHAR(75)
    DETERMINISTIC
BEGIN
    RETURN CONCAT('Function ', str);
END$$
DELIMITER ;
;

DROP FUNCTION ufn_append_before;
SELECT ufn_append_before('Test');
SELECT ufn_append_before(first_name) FROM employees;

DELIMITER $$
CREATE FUNCTION ufn_count_employees_by_town(`town_name` VARCHAR(50))
    RETURNS INT
    DETERMINISTIC
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM employees AS e
                 JOIN addresses AS a ON e.address_id = a.address_id
                 JOIN towns AS t ON a.town_id = t.town_id
        WHERE t.`name` = `town_name`
    );
END$$

DELIMITER ;
;
SELECT ufn_count_employees_by_town('Redmond') AS 'Count';
SELECT name, ufn_count_employees_by_town(name) FROM towns;


DELIMITER $$
CREATE FUNCTION ufn_return_var()
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE result INT;
    SET result := 10;

    RETURN result;
END$$

SELECT ufn_return_var()$$

SET @test := 10;
SELECT @test;

DELIMITER $$
DROP PROCEDURE usp_select_employees;
CREATE PROCEDURE usp_select_employees(max_id INT)
BEGIN
    SELECT * FROM employees WHERE employee_id < max_id;
END$$
DELIMITER ;
;

CALL usp_select_employees(10);

DELIMITER $$
-- DROP PROCEDURE usp_raise_salaries;
CREATE PROCEDURE usp_raise_salaries(percent DECIMAL(3, 2), OUT total_increase DECIMAL(19, 4))
BEGIN
    DECLARE actual_percent DECIMAL(3, 2);
    DECLARE local_increase DECIMAL(19, 4);

    SET actual_percent = 1 + percent;
    SET local_increase := (SELECT ABS(SUM(salary) - SUM(salary) * actual_percent) FROM employees);
    SET total_increase = local_increase;

    UPDATE employees SET salary = salary * actual_percent;
END$$
DELIMITER ;
;

SELECT ABS(SUM(salary) - SUM(salary) * 1.10) FROM employees;

SET @increase = 0;
CALL usp_raise_salaries(0.1, @increase);
SELECT @increase;

DELIMITER $$
DROP PROCEDURE usp_transaction;
CREATE PROCEDURE usp_transaction()
BEGIN
    -- Initial state
    START TRANSACTION;
    UPDATE employees SET first_name = 'Changed';
    UPDATE towns SET name = 'Change';
    UPDATE departments SET name = 'Dep0';
    -- ROLLBACK; -- Return to initial state
    COMMIT; -- Move to new state with changes applied
END$$
DELIMITER ;
;

SELECT * FROM towns;
CALL usp_transaction();
SELECT * FROM towns;

CREATE TABLE deleted_employees(
                                  employee_id INT PRIMARY KEY,
                                  first_name VARCHAR(50),
                                  last_name VARCHAR(50),
                                  job_title VARCHAR(50),
                                  department_name VARCHAR(50),
                                  hire_date TIMESTAMP(6)
);

DELIMITER $$
DROP TRIGGER tr_after_delete_employees;
CREATE TRIGGER tr_after_delete_employees
    AFTER DELETE
    ON employees
    FOR EACH ROW
BEGIN
    INSERT INTO deleted_employees
    VALUES (
               OLD.employee_id,
               OLD.first_name,
               OLD.last_name,
               OLD.job_title,
               (SELECT `name` FROM departments WHERE department_id = OLD.department_id),
               OLD.hire_date
           );
END$$
DELIMITER ;
;

UPDATE employees_projects SET employee_id = 3 WHERE employee_id = 2;

DELETE FROM employees WHERE employee_id = 2;
SELECT * FROM employees WHERE employee_id = 2;
SELECT * FROM deleted_employees;

DELIMITER $$
CREATE FUNCTION ufn_count_employees_by_town(`town_name` VARCHAR(50))
    RETURNS INT
    DETERMINISTIC
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM employees AS e
                 JOIN addresses AS a ON e.address_id = a.address_id
                 JOIN towns AS t ON a.town_id = t.town_id
        WHERE t.`name` = `town_name`
    );
END$$

SELECT ufn_count_employees_by_town('Sofia');

DELIMITER $$
-- DROP PROCEDURE usp_raise_salaries;
CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(50))
BEGIN
    UPDATE employees SET salary = salary * 1.05
    WHERE department_id = (
        SELECT department_id FROM departments WHERE `name` = department_name
    );
END$$
DELIMITER ;
;

DELIMITER $$
CREATE PROCEDURE usp_raise_salary_by_id(id INT)
BEGIN
    DECLARE employee_id_count INT;
    SET employee_id_count := (SELECT COUNT(*) FROM employees WHERE employee_id = id);

    IF (employee_id_count = 1)
    THEN
        UPDATE employees SET salary = salary * 1.05 WHERE employee_id = id;
    END IF;
END$$

CREATE TABLE deleted_employees(
                                  employee_id INT AUTO_INCREMENT PRIMARY KEY,
                                  first_name VARCHAR(50),
                                  last_name VARCHAR(50),
                                  middle_name VARCHAR(50),
                                  job_title VARCHAR(50),
                                  department_id INT,
                                  salary DECIMAL(19, 4)
);

DELIMITER $$
CREATE TRIGGER tr_after_delete_employees
    AFTER DELETE
    ON employees
    FOR EACH ROW
BEGIN
    INSERT INTO deleted_employees
    (first_name, last_name, middle_name, job_title, department_id, salary)
    VALUES (
               OLD.first_name,
               OLD.last_name,
               OLD.middle_name,
               OLD.job_title,
               OLD.department_id,
               OLD.salary
           );
END$$
DELIMITER ;
;