--USE pc;

--8. Създайте подходящ/и индекс/и върху таблицата Product от базата от данни PC
--CREATE CLUSTERED INDEX idx_Product
--ON Product(model);

--DROP INDEX idx_Product ON Product;

--9. Създайте подходящи индекси върху таблиците Classes, Ships, Battles, Outcomes от базата
--от данни Ships.
--USE ships;

--CREATE NONCLUSTERED INDEX idx_Classes
--ON Classes(class, country);

--CREATE NONCLUSTERED INDEX idx_Ships
--ON Ships(name, class);

--CREATE CLUSTERED INDEX idx_Battles
--ON Battles(name);

--CREATE NONCLUSTERED INDEX idx_Outcomes
--ON Outcomes(ship, battle, result);

--10. Изтрийте създадените индекси.
--DROP INDEX idx_Classes ON CLASSES;
--DROP INDEX idx_Ships ON Ships;
--DROP INDEX idx_Battles ON Battles;
--DROP INDEX idx_Outcomes ON Outcomes;