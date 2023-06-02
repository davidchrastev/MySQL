CREATE DATABASE `restaurants`;

USE `restaurants`;

## DATA DEFINITION LANGUAGE (DDL)
## 01

CREATE TABLE `products` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  type VARCHAR(30) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE `clients` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  birthdate DATE NOT NULL,
  card VARCHAR(50),
  review TEXT
);

CREATE TABLE `tables` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  floor INT NOT NULL,
  reserved TINYINT(1),
  capacity INT NOT NULL
);

CREATE TABLE `waiters` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone VARCHAR(50),
  salary DECIMAL(10,2)
);

CREATE TABLE `orders` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  table_id INT NOT NULL,
  waiter_id INT NOT NULL,
  order_time  TIME NOT NULL,
  payed_status TINYINT(1),
  CONSTRAINT fk_orders_tables
                      FOREIGN KEY (`table_id`) REFERENCES `tables`(id),
  CONSTRAINT fk_orders_waiters
                      FOREIGN KEY (`waiter_id`) REFERENCES `waiters`(id)
);


CREATE TABLE `orders_clients` (
  order_id INT,
  client_id INT,
  CONSTRAINT fk_orders_clients_orders
    FOREIGN KEY (`order_id`) REFERENCES orders(id),
  CONSTRAINT fk_orders_clients_clients
    FOREIGN KEY (`client_id`) REFERENCES clients(id)
);

CREATE TABLE `orders_products` (
    order_id INT,
    product_id INT,
    CONSTRAINT fk_orders_products_orders
        FOREIGN KEY (`order_id`) REFERENCES orders(id),
    CONSTRAINT fk_orders_products_products
        FOREIGN KEY (`product_id`) REFERENCES products(id)
);

## DATA MANIPULATION LANGUAGE (DML)

INSERT INTO products(name, type, price)
  (SELECT CONCAT_WS(' ', last_name, 'specialty'),
          'Cocktail'                             ,
          CEILING(0.01 * salary)
   FROM waiters
   WHERE id > 6);

UPDATE `orders`
SET table_id = table_id - 1
WHERE id BETWEEN 12 AND 23;

DELETE FROM `waiters` AS w
WHERE ( SELECT COUNT(*)
        FROM orders
        WHERE waiter_id = w.id ) = 0;

## QUERYING

SELECT
    id, first_name, last_name, birthdate, card, review
FROM clients
ORDER BY birthdate DESC;

SELECT
    first_name, last_name, birthdate, review
FROM clients
WHERE card IS NULL AND YEAR(birthdate) BETWEEN 1978 AND 1993
ORDER BY
    last_name DESC, id
LIMIT 5;

SELECT
    CONCAT(last_name, first_name, CHAR_LENGTH(first_name), 'Restaurant') AS `username`,
    REVERSE(SUBSTR(email, 2, 12)) AS `password`
FROM waiters
WHERE salary IS NOT NULL
ORDER BY `password` DESC;


SELECT p.id,
       p.name,
       COUNT(op.product_id) AS `count`
FROM orders_products op
         JOIN
     products p ON p.id = op.product_id
GROUP BY p.id,
         p.name
HAVING COUNT(op.product_id) >= 5
ORDER BY `count` DESC,
         p.name;

SELECT
    t.id,
    capacity,
    COUNT(oc.client_id) AS `count_clients`,
    (
        IF(t.capacity > COUNT(oc.client_id), 'Free seats',
        IF (capacity = COUNT(oc.client_id), 'Full', 'Extra seats'))
        ) AS availability
FROM
    tables t
        JOIN
    orders o ON t.id = o.table_id
        JOIN
    orders_clients oc ON o.id = oc.order_id
WHERE floor = 1
GROUP BY
    t.id
ORDER BY
    t.id DESC;

## PROGRAMABILITY

DELIMITER $$
CREATE function udf_client_bill(full_name VARCHAR(50))
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN
    DECLARE price DECIMAL(19,2);

    SET price = (SELECT
                     SUM(p.price)
                 FROM clients c
                          JOIN orders_clients oc on c.id = oc.client_id
                          JOIN orders o on o.id = oc.order_id
                          JOIN orders_products op on o.id = op.order_id
                          JOIN products p on op.product_id = p.id
                 WHERE CONCAT_WS(' ', c.first_name, c.last_name) = `full_name`);
    RETURN price;
END ;

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE udp_happy_hour(`type` VARCHAR(50))
BEGIN
    UPDATE products
        SET price = price * 0.8
    WHERE price >= 10;
end $$

DELIMITER ;