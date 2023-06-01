USE `soft_uni`;


DELIMITER $$
CREATE function ufn_calculate_future_value(initial_sum DECIMAL(19, 4),
                                           yearly_interest_rate DOUBLE(19, 4),
                                           number_of_years INT)
    RETURNS DECIMAL(19, 4)
    DETERMINISTIC
BEGIN
    DECLARE FV DECIMAL(19, 4);

    SET FV := (
        initial_sum * POWER(1 + yearly_interest_rate, number_of_years)
    );

    RETURN FV;

    RETURN FV;
END $$
DELIMITER ;