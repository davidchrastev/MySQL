USE diablo;

SELECT
    name AS game,
    (CASE
        WHEN HOUR(start) < 12 THEN 'Morning'
        WHEN HOUR(start) < 18 THEN 'Afternoon'
        WHEN HOUR(start) < 24 THEN 'Evening'
    END) AS 'Part of the day',
    (CASE
    WHEN duration <= 3 THEN 'Extra Short'
    WHEN duration <= 6 THEN 'Short'
    WHEN duration <= 10 THEN 'Long'
    ELSE 'Extra Long'
    END) AS 'Duration'
FROM games;