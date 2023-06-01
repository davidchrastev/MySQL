USE `soft_uni`;


DELIMITER $$
CREATE FUNCTION ufn_get_salary_level(argument DECIMAL)
    RETURNS VARCHAR(50)
    DETERMINISTIC
BEGIN

    DECLARE salary VARCHAR(50);

    SET salary :=
        (CASE
           WHEN argument < 30000 THEN 'Low'
           WHEN argument > 50000 THEN 'High'
           ELSE 'Average'
         END
        );
    RETURN salary;
END $$;

DELIMITER ;

SELECT ufn_get_salary_level(50001);