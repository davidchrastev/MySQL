USE `geography`;


SELECT
    COUNT(*)
FROM countries c
JOIN mountains_countries mc on c.country_code = mc.country_code
WHERE c.country_code != mc.country_code;

SELECT
    *
FROM countries;

SELECT
    *
FROM mountains_countries;