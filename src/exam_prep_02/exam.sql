CREATE DATABASE `imbd`;

USE `imbd`;

CREATE TABLE countries (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           name VARCHAR(30) NOT NULL UNIQUE,
                           continent VARCHAR(30) NOT NULL,
                           currency VARCHAR(5) NOT NULL
);
CREATE TABLE genres (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE actors (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        first_name VARCHAR(50) NOT NULL,
                        last_name VARCHAR(50) NOT NULL,
                        birthdate DATE NOT NULL,
                        height INT,
                        awards INT,
                        country_id INT NOT NULL,
                        CONSTRAINT fk_actors_countries
                        FOREIGN KEY (country_id) REFERENCES countries(id)
);
CREATE TABLE movies_additional_info (
                                        id INT AUTO_INCREMENT PRIMARY KEY,
                                        rating DECIMAL(10, 2) NOT NULL,
                                        runtime INT NOT NULL,
                                        picture_url VARCHAR(80),
                                        budget DECIMAL(10, 2),
                                        release_date DATE NOT NULL,
                                        has_subtitles BOOLEAN,
                                        description TEXT
);
CREATE TABLE movies (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        title VARCHAR(70) NOT NULL UNIQUE,
                        country_id INT NOT NULL,
                        movie_info_id INT NOT NULL,
                        CONSTRAINT fk_movies_countries
                        FOREIGN KEY (country_id) REFERENCES countries(id),
                        CONSTRAINT fk_movies_movies_additional_info
                        FOREIGN KEY (movie_info_id) REFERENCES movies_additional_info(id)
);

CREATE TABLE movies_actors (
                               movie_id INT,
                               actor_id INT,
                               CONSTRAINT fk_movies_actors_movies
                               FOREIGN KEY (movie_id) REFERENCES movies(id),
                               CONSTRAINT fk_movies_actors_actors
                               FOREIGN KEY (actor_id) REFERENCES actors(id)

);
CREATE TABLE genres_movies (
                               genre_id INT,
                               movie_id INT,
                               CONSTRAINT fk_genres_movies_genres
                               FOREIGN KEY (genre_id) REFERENCES genres(id),
                               CONSTRAINT fk_genres_movies_movies
                               FOREIGN KEY (movie_id) REFERENCES movies(id)
);


##
INSERT INTO actors (first_name, last_name, birthdate, height, awards, country_id)
SELECT
    REVERSE(first_name),
    REVERSE(last_name),
    DATE_SUB(birthdate, INTERVAL 2 DAY),
    height + 10,
    country_id,
    (SELECT id FROM countries WHERE name = 'Armenia')
FROM actors
WHERE id <= 10;

UPDATE movies_additional_info
SET runtime = runtime - 10
WHERE id >= 15 AND id <= 25;

DELETE FROM countries
WHERE id NOT IN (SELECT DISTINCT country_id FROM movies);

###

SELECT id, name, continent, currency
FROM countries
ORDER BY currency DESC, id;


SELECT m.id,m2.title, m.runtime, m.budget, m.release_date
FROM movies_additional_info m
         JOIN movies m2 on m.id = m2.movie_info_id
WHERE YEAR(m.release_date) BETWEEN 1996 AND 1999
ORDER BY m.runtime, m.id
LIMIT 20;

SELECT CONCAT(a.first_name, ' ', a.last_name) full_name,
       CONCAT(REVERSE(a.last_name), LENGTH(a.last_name), '@cast.com') email, (2022 - YEAR(a.birthdate)) age, a.height
FROM actors a
         LEFT JOIN movies_actors ma on a.id = ma.actor_id
WHERE ma.movie_id IS NULL
ORDER by height;


SELECT c.name, COUNT(m.title) movies_count
FROM movies m
         JOIN countries c on c.id = m.country_id
GROUP BY c.name
HAVING movies_count >= 7
ORDER BY name desc;

SELECT m.title,
       (CASE
            WHEN mi.rating <= 4 THEN 'poor'
            WHEN mi.rating <= 7 THEN 'good'
            ELSE 'excellent'
           END) as rating,
       IF(mi.has_subtitles, 'english', '-') subtitles,
       mi.budget
FROM movies_additional_info mi
         JOIN movies m on mi.id = m.movie_info_id
ORDER BY budget desc;



DELIMITER $$
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE movies_count INT;
    SET movies_count := (
        SELECT COUNT(g.name) movies
        FROM actors a
                 JOIN movies_actors ma on a.id = ma.actor_id
                 JOIN genres_movies gm on ma.movie_id = gm.movie_id
                 JOIN genres g on g.id = gm.genre_id
        WHERE CONCAT(a.first_name, ' ', a.last_name) = full_name AND g.name = 'History'
        GROUP BY  g.name);
    RETURN movies_count;
end $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `udp_award_movie`(`movie_title` VARCHAR(50))
BEGIN
    UPDATE actors a
        JOIN movies_actors ma on a.id = ma.actor_id
        JOIN movies m on m.id = ma.movie_id
    SET  a.awards = a.awards + 1
    WHERE m.title = movie_title;
END $$
DELIMITER ;