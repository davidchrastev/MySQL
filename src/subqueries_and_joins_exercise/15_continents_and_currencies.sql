USE `geography`;

SELECT
    c.continent_code,
    c.currency_code,
    COUNT(*) AS `currency_usage`
FROM countries c
GROUP BY c.continent_code, c.currency_code
HAVING `currency_usage` > 1
AND `currency_usage` = (SELECT COUNT(*) AS count_of_currencies
                        FROM countries c2
                        WHERE c2.continent_code = c.continent_code
                        GROUP BY c2.currency_code
                        ORDER BY `count_of_currencies` DESC
                        LIMIT 1)
ORDER BY continent_code,
         currency_code;




