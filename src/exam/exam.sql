CREATE DATABASE `universities_db`;

USE `universities_db`;

# 01

CREATE TABLE `countries` (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE cities (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(40) NOT NULL UNIQUE,
    population INT,
    country_id INT         NOT NULL,
    CONSTRAINT fk_cities_countries
        FOREIGN KEY (country_id) REFERENCES countries (id)
);

CREATE TABLE universities (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(60)    NOT NULL UNIQUE,
    address         VARCHAR(80)    NOT NULL UNIQUE,
    tuition_fee     DECIMAL(19, 2) NOT NULL,
    number_of_staff INT,
    city_id         INT,
    CONSTRAINT fk_universities_cities
    FOREIGN KEY (city_id) REFERENCES cities (id)
);

CREATE TABLE students (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    first_name   VARCHAR(40)  NOT NULL,
    last_name    VARCHAR(40)  NOT NULL,
    age          INT,
    phone        VARCHAR(20)  NOT NULL UNIQUE,
    email        VARCHAR(255) NOT NULL UNIQUE,
    is_graduated TINYINT(1)      NOT NULL,
    city_id      INT          NOT NULL,
    CONSTRAINT fk_students_cities
    FOREIGN KEY (city_id) REFERENCES cities (id)
);

CREATE TABLE courses (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    name           VARCHAR(40) NOT NULL UNIQUE,
    duration_hours DECIMAL(19, 2),
    start_date     DATE,
    teacher_name   VARCHAR(60) NOT NULL UNIQUE,
    description    TEXT,
    university_id  INT         NOT NULL,
    CONSTRAINT fk_courses_universities
    FOREIGN KEY (university_id) REFERENCES universities (id)
);

CREATE TABLE students_courses (
    grade      DECIMAL(19, 2) NOT NULL,
    student_id INT            NOT NULL,
    course_id  INT,
    CONSTRAINT fk_students_courses_students
    FOREIGN KEY (student_id) REFERENCES students (id),
    CONSTRAINT fk_students_courses_courses
    FOREIGN KEY (course_id) REFERENCES courses (id)
);

# 02
INSERT INTO courses (name, duration_hours, start_date, teacher_name, description, university_id)
SELECT CONCAT(teacher_name, ' course') AS name,
       CHAR_LENGTH(name) / 10 AS duration_hours,
       DATE_ADD(start_date, INTERVAL 5 DAY) AS start_date,
       REVERSE(teacher_name) AS teacher_name,
       CONCAT('Course ', teacher_name, REVERSE(description)) AS description,
       DAY(start_date) AS university_id
FROM courses
WHERE id <= 5;

# 03
UPDATE universities
SET tuition_fee = tuition_fee + 300
WHERE id >= 5 AND id <= 12;

# 04
DELETE FROM universities
WHERE number_of_staff IS NULL;

# 05
SELECT id, name, population, country_id
FROM cities
ORDER BY population DESC;

# 06
SELECT first_name, last_name, age, phone, email
FROM students
WHERE age >= 21
ORDER BY first_name DESC, email, id
LIMIT 10;

# 07
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS full_name,
    SUBSTRING(s.email, 2, 10) AS username,
    REVERSE(s.phone) AS password
    FROM students s
LEFT JOIN students_courses sc on s.id = sc.student_id
WHERE student_id IS NULL
ORDER BY password DESC;

# 08
SELECT COUNT(sc.student_id) AS students_count, u.name AS university_name
FROM universities u
         JOIN courses c ON u.id = c.university_id
         JOIN students_courses sc ON c.id = sc.course_id
GROUP BY u.id, u.name
HAVING COUNT(sc.student_id) >= 8
ORDER BY students_count DESC, university_name DESC;

# 09
SELECT u.name AS university_name, c.name AS city_name, u.address,
       CASE
           WHEN u.tuition_fee < 800 THEN 'cheap'
           WHEN u.tuition_fee >= 800 AND u.tuition_fee < 1200 THEN 'normal'
           WHEN u.tuition_fee >= 1200 AND u.tuition_fee < 2500 THEN 'high'
           ELSE 'expensive'
           END AS price_rank,
       u.tuition_fee
FROM universities u
         JOIN cities c ON u.city_id = c.id
ORDER BY u.tuition_fee;

# 10
CREATE FUNCTION udf_average_alumni_grade_by_course_name(course_name VARCHAR(60))
    RETURNS DECIMAL(5, 2)
BEGIN
    DECLARE avg_grade DECIMAL(5, 2);

    SELECT AVG(sc.grade) INTO avg_grade
    FROM students_courses sc
             JOIN students s ON sc.student_id = s.id
             JOIN courses c ON sc.course_id = c.id
    WHERE c.name = course_name AND s.is_graduated = true;

    RETURN avg_grade;
END;

# 11
CREATE PROCEDURE udp_graduate_all_students_by_year(IN year_started INT)
BEGIN
    UPDATE students s
        JOIN students_courses ON s.id = students_courses.student_id
        JOIN courses ON students_courses.course_id = courses.id
        JOIN universities ON courses.university_id = universities.id
    SET s.is_graduated = 1
    WHERE YEAR(courses.start_date) = year_started;
END;





















