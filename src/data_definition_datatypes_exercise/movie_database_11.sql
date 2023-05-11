CREATE DATABASE movies;

CREATE TABLE directors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    director_name VARCHAR(50) NOT NULL,
    notes TEXT
);

INSERT INTO directors (director_name)
VALUES ('test'),
       ('test'),
       ('test'),
       ('test'),
       ('test');

CREATE TABLE genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(20) NOT NULL,
    notes TEXT
);

INSERT INTO genres (genre_name)
VALUES ('test'),
       ('test'),
       ('test'),
       ('test'),
       ('test');

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(20) NOT NULL,
    notes TEXT
);

INSERT INTO categories (category_name)
VALUES ('test'),
       ('test'),
       ('test'),
       ('test'),
       ('test');

CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director_id INT,
    copyright_year YEAR,
    length DOUBLE(10,2),
    genre_id INT,
    category_id INT,
    rating DOUBLE(3,2),
    notes TEXT,

    FOREIGN KEY fk_movies_directors(director_id)
    REFERENCES directors(id),

    FOREIGN KEY fk_movies_genres(genre_id)
    REFERENCES genres(id),

    FOREIGN KEY fk_movies_categories(category_id)
    REFERENCES categories(id)
);

INSERT INTO movies(title, director_id, genre_id, category_id)
VALUES('test', 1, 1, 5),
      ('test', 1, 2, 4),
      ('test', 1, 3, 3),
      ('test', 1, 4, 2),
      ('test', 1, 5, 1);

SELECT * FROM movies;





