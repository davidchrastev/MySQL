USE `soft_uni`;

SELECT
    t.`town_id`,
    t.`name` AS `town_name`,
    a.`address_text`
FROM `towns` t
JOIN addresses a on t.`town_id` = a.`town_id`
AND t.`name` IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY t.`town_id`,
         a.`address_id`;
