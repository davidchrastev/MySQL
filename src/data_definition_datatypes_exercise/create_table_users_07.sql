CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(26) NOT NULL,
    profile_picture BLOB,
    last_login_time DATETIME,
    is_deleted BOOLEAN
);

INSERT INTO users (username, password)
VALUES ('DAKATA1123', 'DAKATA1123'),
       ('DAKATA1123', 'DAKATA1123'),
       ('DAKATA1123', 'DAKATA1123'),
       ('DAKATA1123', 'DAKATA1123');

SELECT * FROM users;