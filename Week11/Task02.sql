--USE pc;

--8. �������� ��������/� ������/� ����� ��������� Product �� ������ �� ����� PC
--CREATE CLUSTERED INDEX idx_Product
--ON Product(model);

--DROP INDEX idx_Product ON Product;

--9. �������� ��������� ������� ����� ��������� Classes, Ships, Battles, Outcomes �� ������
--�� ����� Ships.
--USE ships;

--CREATE NONCLUSTERED INDEX idx_Classes
--ON Classes(class, country);

--CREATE NONCLUSTERED INDEX idx_Ships
--ON Ships(name, class);

--CREATE CLUSTERED INDEX idx_Battles
--ON Battles(name);

--CREATE NONCLUSTERED INDEX idx_Outcomes
--ON Outcomes(ship, battle, result);

--10. �������� ����������� �������.
--DROP INDEX idx_Classes ON CLASSES;
--DROP INDEX idx_Ships ON Ships;
--DROP INDEX idx_Battles ON Battles;
--DROP INDEX idx_Outcomes ON Outcomes;