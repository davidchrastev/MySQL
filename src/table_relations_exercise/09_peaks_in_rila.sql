USE geography;


SELECT m.`mountain_range`,
       `peak_name`,
       `elevation` AS `peak_elevation`
FROM `peaks` AS p
         JOIN mountains m on m.id = p.mountain_id
WHERE `mountain_range` = 'Rila'
ORDER BY `peak_elevation` DESC;

