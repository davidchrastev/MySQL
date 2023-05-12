CREATE DATABASE car_rental;

CREATE TABLE categories (
 id INT AUTO_INCREMENT PRIMARY KEY,
 category VARCHAR(20),
 daily_rate  DOUBLE,
 weekly_rate DOUBLE,
 monthly_rate DOUBLE,
 weekend_rate DOUBLE
);

INSERT INTO categories(category)
VALUES ('CAR'),
       ('TRUCK'),
       ('BUS');

CREATE TABLE cars (
  id INT AUTO_INCREMENT PRIMARY KEY,
  plate_number VARCHAR(20),
  make VARCHAR(20),
  model VARCHAR(20),
  car_year INT,
  category_id INT,
  doors INT,
  picture BLOB,
  car_condition VARCHAR(30),
  available BOOLEAN
);

INSERT INTO cars(plate_number)
VALUES ('AH2023PB'),
       ('TX3103CB'),
       ('CB2123CB');

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    title VARCHAR(50),
    notes TEXT
);

INSERT INTO employees(first_name, last_name)
VALUES ('Ilina', 'Minkova'),
       ('Ivan', 'Ivanov'),
       ('Tosho', 'Toshev');

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    driver_license VARCHAR(20),
    full_name VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(15),
    zip_code VARCHAR(15),
    notes TEXT
);

INSERT INTO customers(full_name)
VALUES('TOSHO TOSHEV'),
      ('GOSHO GOSHEV'),
      ('PESHO PESHOV');

CREATE TABLE rental_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    customer_id INT,
    car_id INT,
    car_condition VARCHAR(50),
    tank_level VARCHAR(20),
    kilometrage_start INT,
    kilometrage_end INT,
    total_kilometrage INT,
    start_date DATE,
    end_date DATE,
    total_days INT,
    rate_applied DOUBLE,
    tax_rate DOUBLE,
    order_status VARCHAR(20),
    notes TEXT
);

INSERT INTO rental_orders(employee_id, customer_id)
VALUES(1,2),
      (2,3),
      (3,1);

SELECT * FROM rental_orders;









