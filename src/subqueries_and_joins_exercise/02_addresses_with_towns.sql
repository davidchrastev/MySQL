USE `soft_uni`;

SELECT
    e.`first_name`,
    e.`last_name`,
    t.`name` AS 'town',
    a.`address_text`
FROM `employees` e
JOIN `addresses` a on a.`address_id` = e.`address_id`
JOIN `towns` t on a.`town_id` = t.`town_id`
ORDER BY `first_name`,
         `last_name`
LIMIT 5;
