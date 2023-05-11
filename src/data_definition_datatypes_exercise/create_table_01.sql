create DATABASE minions;

USE minions;

-- primary key -> not null, unique

CREATE TABLE minions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(47),
  age INT
);

CREATE TABLE towns (
  town_id INT AUTO_INCREMENT PRIMARY KEY,
  town_name VARCHAR(47)
);


