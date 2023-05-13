CREATE DATABASE soft_uni;

CREATE TABLE towns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address_text TEXT,
    town VARCHAR(30),
    town_id INT
);

CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    middle_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    job_title VARCHAR(30),
    department_id INT,
    hire_date DATE,
    salary DOUBLE,
    address_id INT
);

INSERT INTO towns(name)
VALUE ('Sofia'),
      ('Plovdiv'),
    ('Varna'),
    ('Burgas');

INSERT INTO departments(name)
VALUES('Engineering'),
      ('Sales'),
      ('Marketing'),
      ('Software Development'),
      ('Quality Assurance');

INSERT
INTO employees(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES ('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', (SELECT id
                                                       FROM departments
                                                       WHERE name = 'Software Development'), '2013-02-01','3500.00'),

       ('Petar', 'Petrov', 'Petrov', 'Senior Engineer', (SELECT id
                                                         FROM departments
                                                         WHERE name = 'Engineering'), '2004-03-02', '4000.00'),

       ('Maria', 'Petrova', 'Ivanova', 'Intern', (SELECT id
                                                  FROM departments
                                                  WHERE name = 'Quality Assurance'), '2016-08-28', '525.25'),

       ('Georgi', 'Terziev', 'Ivanov', 'CEO', (SELECT id
                                               FROM departments
                                               WHERE name = 'Sales'), '2007-12-09', '3000.00'),

       ('Peter', 'Pan', 'Pan', 'Intern', (SELECT `id`
                                          FROM departments
                                          WHERE name = 'Marketing'), '2016-08-28', '599.88');

