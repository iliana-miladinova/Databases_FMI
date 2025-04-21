--CREATE DATABASE new_database;

--use new_database;
--CREATE TABLE Product
--(
--	id INT IDENTITY(1,1),
--	model CHAR(4),
--	maker CHAR(1),
--	type VARCHAR(7)
--);

--CREATE TABLE Printer
--(
--	id INT IDENTITY(1,1),
--	code INT,
--	model CHAR(4),
--	price DECIMAL(7,2)
--);

--INSERT INTO Product(model, maker, type)
--VALUES('ACER', 'A', 'COLOR');

--INSERT INTO Printer(code, model, price)
--VALUES(123, 'ACER', 123.56), (567, 'HP', 250.98);

--ALTER TABLE Printer
--ADD type VARCHAR(6);

--ALTER TABLE Printer
--ADD color CHAR(1) DEFAULT 'n';

--ALTER TABLE Printer
--DROP COLUMN price;

--DROP TABLE Printer, Product;