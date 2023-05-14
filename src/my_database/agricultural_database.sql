-- CREATE DATABASE agricultural;

CREATE TABLE insects_1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    име VARCHAR(50),
    поколения VARCHAR(50),
    зимуване VARCHAR(50)
);

CREATE TABLE insects_2 (
   id INT AUTO_INCREMENT PRIMARY KEY,
   име VARCHAR(50),
   поколения VARCHAR(50),
   зимуване VARCHAR(50)
);

CREATE TABLE insects_3 (
   id INT AUTO_INCREMENT PRIMARY KEY,
   име VARCHAR(50),
   поколения VARCHAR(50),
   зимуване VARCHAR(50)
);

CREATE TABLE insects_4 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    име VARCHAR(50),
    поколения VARCHAR(50),
    зимуване VARCHAR(50)
);

CREATE TABLE insects_5 (
   id INT AUTO_INCREMENT PRIMARY KEY,
   име VARCHAR(50),
   поколения VARCHAR(50),
   зимуване VARCHAR(50)
);

CREATE TABLE insects_6 (
   id INT AUTO_INCREMENT PRIMARY KEY,
   име VARCHAR(50),
   поколения VARCHAR(50),
   зимуване VARCHAR(50)
);

INSERT INTO insects_1(име, поколения, зимуване)
VALUES('западен царевичен коренов червей', '1', 'яйце');

INSERT INTO insects_5(име, поколения, зимуване)
VALUES('тютюнева белокрилка', '15-20', 'непрекъснат цикъл на развитие');

INSERT INTO insects_4(име, поколения, зимуване)
VALUES('листоминиращи мухи', '4-6', 'какавида');

INSERT INTO insects_2(име, поколения, зимуване)
VALUES('египетска нощенка', '2', 'гъсеница/какавида');

INSERT INTO insects_4(име, поколения, зимуване)
VALUES('доматен миниращ молец', '4-6 поле/10 оранжерия', 'във всички стадии');

INSERT INTO insects_6(име, поколения, зимуване)
VALUES('трипс палми', 'null', 'null');

INSERT INTO insects_2(име, поколения, зимуване)
VALUES('гватемалски молец', '2', 'гъсеница');

INSERT INTO insects_6(име, поколения, зимуване)
VALUES('гватемалски молец', 'няколко', 'гъсеница');

INSERT INTO insects_5(име, поколения, зимуване)
VALUES('drosophila suzukii', '10-12', 'възрастно');

INSERT INTO insects_1(име, поколения, зимуване)
VALUES('ябълкова муха', '1', 'какавида');

INSERT INTO insects_3(име, поколения, зимуване)
VALUES('крушова огневка', '2-3', 'гъсеница в цветните пъпки');

INSERT INTO insects_3(име, поколения, зимуване)
VALUES('сливов молец', '2-3', 'гъсеница под раст. остатъци, под кората');

INSERT INTO insects_2(име, поколения, зимуване)
VALUES('сливов хоботник', '1-2', 'възрастно под окап. листа');

INSERT INTO insects_4(име, поколения, зимуване)
VALUES('розов червей', '4-6', 'гъсеница');

INSERT INTO insects_4(име, поколения, зимуване)
VALUES('бодилов кутийков червей', '4-5', 'гъсеница');

INSERT INTO insects_6(име, поколения, зимуване)
VALUES('мексикански памуков хоботник', 'много', 'възрастно под раст. остатъци');

INSERT INTO insects_6(име, поколения, зимуване)
VALUES('кестенова галова оса', 'null', 'ларва в пъпките');

INSERT INTO insects_1(име, поколения, зимуване)
VALUES('смарактов ясенов агрилус', '1', 'ларва в място на повреда');

INSERT INTO insects_1(име, поколения, зимуване)
VALUES('сибирски копринопред', '2-3 годишен цикъл -> 1 поколение', 'гъсеница');

INSERT INTO insects_6(име, поколения, зимуване)
VALUES('борова нематода', '---', '---');

INSERT INTO insects_6(име, поколения, зимуване)
VALUES('палмов хоботник', '---', '---');

INSERT INTO insects_6(име, поколения, зимуване)
VALUES('червен хоботник', '---', '---');

INSERT INTO insects_1(име, поколения, зимуване)
VALUES('азиатски сечко', '1', 'всички стадии');

INSERT INTO insects_4(име, поколения, зимуване)
VALUES('южноафриканска листозавивачка', '4 поле/6 оранжерия', '---');

INSERT INTO insects_4(име, поколения, зимуване)
VALUES('листозавивачка карамфил', '7', 'гъсеница на листата');

INSERT INTO insects_6(име, поколения, зимуване)
VALUES('оризова нематода', '---', '---');

INSERT INTO insects_1(име, поколения, зимуване)
VALUES('земни бълхи', '1', 'възрастно');

INSERT INTO insects_6(име, поколения, зимуване)
VALUES('латинска пеперуда', '---', '---');

INSERT INTO insects_4(име, поколения, зимуване)
VALUES('многоцветна калинка', '3-4', '---');

INSERT INTO insects_4(име, поколения, зимуване)
VALUES('молец по див кестен', '2-4', 'какавида под окап. листа');

INSERT INTO insects_4(име, поколения, зимуване)
VALUES('бананов молец', '10', 'ларва в нападнатите части');


SELECT * FROM insects_1;
SELECT * FROM insects_2;
SELECT * FROM insects_3;
SELECT * FROM insects_4;
SELECT * FROM insects_5;
SELECT * FROM insects_6;

-- DROP DATABASE agricultural;












