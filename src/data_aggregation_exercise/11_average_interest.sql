USE gringotts;

SELECT `deposit_group`,
       (CASE
            WHEN `is_deposit_expired` = TRUE THEN 1
            WHEN `is_deposit_expired` = FALSE THEN 0
           END)                AS `is_deposit_expired`,
       AVG(`deposit_interest`) AS `average_interest`
FROM wizzard_deposits
WHERE `deposit_start_date` > DATE('1985-01-01')
GROUP BY `deposit_group`,
         `is_deposit_expired`
ORDER BY `deposit_group` DESC,
         is_deposit_expired;
