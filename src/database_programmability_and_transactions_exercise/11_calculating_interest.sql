USE `soft_uni`;

DELIMITER $$
CREATE PROCEDURE usp_calculate_future_value_for_account(account_id INT, interest_per_year DECIMAL(19,4))
BEGIN
    SELECT
        ah.id AS 'account_id',
        ah.first_name,
        ah.last_name,
        a.balance AS 'current_balance',
        ufn_calculate_future_value(a.balance, interest_per_year, 5) AS balance_in_5_years
    FROM account_holders ah
             LEFT JOIN accounts a on a.account_holder_id = ah.id
    WHERE a.id = account_id;
END $$;


CALL usp_calculate_future_value_for_account(1, 0.1);