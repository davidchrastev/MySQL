CREATE TABLE people(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  picture BLOB,
  height DOUBLE(10,2),
  weight DOUBLE(10,2),
  gender CHAR(1) NOT NULL,
  birthdate DATE NOT NULL,
  biography TEXT -- text(255) varchar(255) -> MAX,
);

INSERT INTO people(name, gender, birthdate) VALUES
('David','m', DATE(NOW())),
('IVANKA','f', DATE(NOW())),
('DJONITO', 'm', DATE(NOW())),
('JORDANKA', 'f', DATE(NOW())),
('KAKRIKUNSAN', 'm', DATE(NOW())),
('Bendiburdachkata', 'f', DATE(NOW()));

SELECT * FROM people;