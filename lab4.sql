CREATE DATABASE lab4;

CREATE TABLE Warehouses(
  code INT PRIMARY KEY,
  location VARCHAR(255),
  capacity INT
);

CREATE TABLE Boxes(
  code CHAR(4),
  contents VARCHAR(255),
  value REAL,
  warehouse INT REFERENCES Warehouses(code)
);

INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);

INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

SELECT * FROM Warehouses;

SELECT * FROM Boxes WHERE value IN (SELECT value FROM Boxes WHERE value >=50 AND value <=100);

SELECT DISTINCT ON (Boxes) warehouse FROM Boxes;

SELECT DISTINCT ON (Boxes) warehouse FROM Boxes WHERE contents IN (SELECT contents FROM Boxes WHERE contents = 'Papers');

SELECT warehouse, count(code) FROM Boxes GROUP BY warehouse;

INSERT INTO Warehouses (code, location, capacity) VALUES (6, 'New York', 3);

INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('H5RT', 'Papers', 200, 2);

UPDATE Boxes SET value = value * 0.8 WHERE value = (SELECT value FROM Boxes ORDER BY value LIMIT 1 OFFSET 2);

DELETE FROM Boxes WHERE value IN (SELECT value FROM Boxes WHERE value <= 150);

DELETE FROM Boxes WHERE warehouse IN (SELECT code FROM Warehouses WHERE location = 'New York') RETURNING code, warehouse;