USE `geography`;

SELECT
    countries.`country_code`,
    m.`mountain_range`,
    p.`peak_name`,
    p.`elevation`
FROM countries
JOIN mountains_countries mc on countries.country_code = mc.country_code
JOIN mountains m on mc.mountain_id = m.id
JOIN peaks p on m.id = p.mountain_id
WHERE p.`elevation` > 2835 AND mc.country_code = 'BG'
ORDER BY p.`elevation` DESC;