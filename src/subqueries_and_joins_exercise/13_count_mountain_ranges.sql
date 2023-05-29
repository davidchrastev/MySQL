USE `geography`;


SELECT
    c.country_code,
    COUNT(mc.mountain_id) AS 'mountain_range_count'
FROM countries c
JOIN mountains_countries mc on c.country_code = mc.country_code
GROUP BY c.country_code
HAVING c.`country_code` IN ('BG', 'US', 'RU')
ORDER BY mountain_range_count DESC;