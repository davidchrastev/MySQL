USE soft_uni;

SELECT
    town_id,
    name
FROM towns
WHERE
    NOT left(`name`, 1) IN ('r', 'b', 'd')
ORDER BY name;