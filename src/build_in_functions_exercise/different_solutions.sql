# USE soft_uni;
#
# /*
#     Task 3 - Solution
#  */
#
# SELECT
#     first_name
# FROM employees
# WHERE department_id IN (3, 10)
# AND YEAR(hire_date) BETWEEN  1995 AND 2005
# ORDER BY employee_id;
#
# /*
#     Task 4 - Solution
#  */
#
# select
#     first_name,
#     last_name
# from employees
# where job_title not like '%engineer%'
# order by employee_id;
#
# /*
#     Task 5 - Solution
#  */
#
# select
#     name
# from towns
# where char_length(name)
# in (5,6)
# order by name;
#
# /*
#     Task 6 - Solution
#  */
#
# select
#     town_id,
#     name
# from towns
# where left(name, 1) in ('m', 'k', 'b', 'e')
# order by name;
#
# SELECT *
# FROM towns
# WHERE
#       LOWER(name) LIKE 'm%'
#    OR LOWER(name) LIKE 'k%'
#    OR LOWER(name) LIKE 'b%'
#    OR LOWER(name) LIKE 'e%'
# ORDER BY name;
#
# select *
# from towns
# where name regexp ('^[MKBE]')
# order by name;
#
# /*
#     Task 7 - Solution
#  */
#
# select
#     *
# from towns
# where left(name, 1) not in ('r', 'b', 'd')
# order by name;
#
# select *
# from towns
# where name not regexp ('^[RBD]')
# order by name;
#
# /*
#     Task 8 - Solution
# */
#
# create view v_employees_hired_after_2000 as
# select
#     first_name,
#     last_name
# from employees
# where year(hire_date) >= 2000;
#
# /*
#  Task 9 - Solution
#  */
#
# select
#     first_name,
#     last_name
# from employees
# where char_length(last_name) = 5;
#
# /*
#  Task 10 - Solution
#  */
# use geography;
#
# SELECT
#     country_name,
#     iso_code
# FROM countries
# WHERE country_name LIKE ('%a%a%a%')
# ORDER BY iso_code;
#
# SELECT country_name, iso_code
# FROM countries
# WHERE country_name REGEXP '.*a.*a.*a.*'
# ORDER BY iso_code;
#
# select
#     country_name,
#     iso_code
# from countries
# where
#     (char_length(country_name) -
#      char_length(replace(lower(country_name), 'a', ''))) >= 3
# order by iso_code;
#
# /*
#  Task 11 - Solution
#  */
# use geography;
#
# SELECT
#     p.peak_name,
#     r.river_name,
#     LOWER(CONCAT(LEFT(p.peak_name, LENGTH(p.peak_name) - 1), r.river_name)) AS 'mix'
# FROM
#     peaks AS p,
#     rivers AS r
# WHERE
#         UPPER(RIGHT(p.peak_name, 1)) = LEFT(r.river_name, 1)
# ORDER BY `mix`;
#
#
# /*
#  Task 12 - Solution
#  */
# use diablo;
#
# select
#     name,
#     date_format(start, '%Y-%m-%d') as start
# from games
# where year(start) in (2011, 2012)
# order by start
# limit 50;
#
# /*
#  Task 13 - Solution
#  */
# use diablo;
#
# select
#     user_name,
#     substring(email, locate('@', email) + 1)
#         as 'email provider'
# from users
# order by `email provider`,
#          user_name;
#
# select
#     user_name,
#     substring_index(email, '@', - 1) as 'email provider'
# from users
# order by `email provider`,
#          user_name;
#
# select
#     user_name,
#     regexp_replace(email, '.*@', '') as 'email provider'
# from users
# order by `email provider`,
#          user_name;
#
# /*
#  Task 14 - Solution
#  */
#
# use diablo;
#
# select
#     user_name,
#     ip_address
# from users
# where ip_address LIKE '___.1%.%.___'
# order by user_name;
#
#
#
# /*
#  Task 15 - Solution
#  name AS game,
#
#  */
#
#  select
#      name as game,
#      (case
#           when hour(start) < 12 then 'Morning'
#           when hour(start) < 18 then 'Afternoon'
#           when hour(start) < 24 then 'Evening'
#          end) as 'Part of the day',
#      (case
#          when duration <= 3 then 'Extra short'
#          when duration <= 6 then 'Short'
#          when duration <= 10 then 'Long'
#          else 'Extra long'
#          end) as 'Duration'
#  from games;
#
# /*
#  Task 16 - Solution
#  */
#
# use orders;
#
# SELECT product_name,
#        order_date,
#        DATE_ADD(`order_date`, INTERVAL 3 DAY)   AS `pay_due`,
#        DATE_ADD(`order_date`, INTERVAL 1 MONTH) AS `deliver_due`
# FROM orders;
