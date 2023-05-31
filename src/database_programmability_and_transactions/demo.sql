DELIMITER $$
CREATE FUNCTION ufn_select_5()
RETURNS INT
    DETERMINISTIC
BEGIN
    RETURN 5;
END$$


SELECT ufn_select_5() as result_of_made_function;

drop function ufn_select_5;

DELIMITER $$
CREATE FUNCTION ufn_append_before(str VARCHAR(30))
RETURNS VARCHAR(70)
DETERMINISTIC
BEGIN
    return CONCAT_WS(' ', str, ufn_select_5());
end $$;

SELECT ufn_append_before('3 + 2 e');


SET @test := 4;
SET @test := 9;
select @test;
