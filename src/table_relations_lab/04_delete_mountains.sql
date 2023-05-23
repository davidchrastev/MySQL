DROP TABLE IF EXISTS peaks;
DROP TABLE IF EXISTS mountains;

CREATE TABLE mountains (
  id     INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(45)
);

CREATE TABLE peaks (
   id          INT PRIMARY KEY AUTO_INCREMENT,
   `name`      VARCHAR(45),
   mountain_id INT,
   CONSTRAINT fk_peaks_ref_mountains
   FOREIGN KEY (mountain_id) REFERENCES mountains (id)
   ON DELETE CASCADE
);