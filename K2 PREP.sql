--USE PC;

--Намалете с 5% цената на онези персонални компютри, които имат производители,
--такива че средната цена на продаваните от тях принтери е над 800

--UPDATE PC
--SET PC.price=0.95*PC.price
--WHERE PC.model IN (SELECT PC.model
--					FROM PC INNER JOIN product
--					ON PC.model=product.model
--					WHERE product.maker IN (SELECT product.maker
--											FROM product INNER JOIN printer
--											ON product.model=printer.model
--											GROUP BY product.maker
--											HAVING AVG(printer.price) > 800));

--USE ships;

--Съставете изгледи, съдържащи имената на битките, които са по-мащабни от битката при
--Guadalcanal. Под по-мащабна битка се разбира:
--a) битка с повече участващи кораби;
--CREATE VIEW v_BATTLE_BY_SHIPS AS
--SELECT COUNT(SHIPS.NAME) AS SHIPS_COUNT, BATTLES.NAME
--FROM CLASSES INNER JOIN SHIPS 
--ON CLASSES.CLASS=SHIPS.CLASS 
--INNER JOIN OUTCOMES
--ON OUTCOMES.SHIP = SHIPS.NAME
--INNER JOIN BATTLES
--ON BATTLES.NAME = OUTCOMES.BATTLE
--GROUP BY BATTLES.NAME
--HAVING BATTLES.NAME = 'Guadalcanal';

--b) битка с повече участващи страни.
--CREATE VIEW v_BATTLE_BY_COUNTRY AS 
--SELECT COUNT(CLASSES.COUNTRY) AS COUNTRIES_COUNT
--FROM CLASSES INNER JOIN SHIPS
--ON CLASSES.CLASS = SHIPS.CLASS 
--INNER JOIN OUTCOMES 
--ON OUTCOMES.SHIP=SHIPS.NAME
--INNER JOIN BATTLES
--ON BATTLES.NAME=SHIPS.NAME
--GROUP BY BATTLES.NAME
--HAVING BATTLES.NAME='Guadalcanal';

--SELECT *
--FROM v_BATTLE_BY_COUNTRY;

--SELECT *
--FROM v_BATTLE_BY_SHIPS;

--Изтрийте от таблицата Outcomes всички битки, в които е участвал един единствен кораб.
--DELETE FROM OUTCOMES
--WHERE OUTCOMES.BATTLE IN (SELECT BATTLES.NAME
--							FROM BATTLES INNER JOIN OUTCOMES
--							ON BATTLES.NAME = OUTCOMES.BATTLE
--							GROUP BY BATTLES.NAME
--							HAVING COUNT(SHIP)=1);

--USE FLIGHTS;
--Създайте тригер за таблицата Bookings, който да се задейства при вмъкване на
--резервация в таблицата и да увеличава с единица броя на пътниците, потвърдили
--резервация за таблицата Flights, както и броя на резервациите към съответната агенция.
--CREATE TRIGGER trg_insert_Bookings 
--ON Bookings 
--AFTER INSERT
--AS 
--BEGIN
--UPDATE FLIGHTS
--SET num_pass=num_pass+1
--WHERE FNUMBER IN (SELECT FNUMBER FROM inserted);
--UPDATE AGENCIES
--SET num_book = num_book+1
--WHERE NAME IN (SELECT NAME FROM inserted);
--END

--Създайте изглед за таблицата Agencies, който извежда всички данни за агенциите, такива
--че телефонните номера на тези агенции да имат стойност NULL. Дефинирайте изгледa с
--CHECK OPTION. Тествайте изгледa.
--CREATE VIEW v_AGENCIES_PHONES
--AS
--SELECT *
--FROM AGENCIES
--WHERE PHONE IS NULL
--WITH CHECK OPTION;

--SELECT *
--FROM v_AGENCIES_PHONES;

--DROP VIEW v_AGENCIES_PHONES;

--USE PC;
--Създайте подходящ/и индекс/и върху таблицата Product от базата от данни PC
--CREATE CLUSTERED INDEX idx_Product
--ON PRODUCT(model);

--DROP INDEX idx_Product ON PRODUCT;

--Създайте подходящи индекси върху таблиците Classes, Ships от базата
--от данни Ships.
--USE ships;
--CREATE NONCLUSTERED INDEX idx_Classes
--ON CLASSES(class, country);

--DROP INDEX idx_Classes ON CLASSES;

--CREATE NONCLUSTERED INDEX idx_SHIPS
--ON SHIPS(NAME, CLASS);

--DROP INDEX idx_SHIPS ON SHIPS;

--USE FLIGHTS;

--Създайте тригер за таблицата Bookings, който да се задейства при изтриване на
--резервация в таблицата и да намалява с единица броя на пътниците, потвърдили
--резервация за таблицата Flights, както и броя на резервациите към съответната агенция.
--CREATE TRIGGER trg_DELETE_TRIGGER
--ON Bookings AFTER DELETE
--AS
--BEGIN
--UPDATE FLIGHTS
--SET num_pass=num_pass-1
--WHERE FNUMBER IN (SELECT FNUMBER FROM deleted);
--UPDATE AGENCIES
--SET num_book=num_book-1
--WHERE NAME IN (SELECT NAME FROM deleted);
--END
