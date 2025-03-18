--USE pc;

--1. �������� ������, ����� ������� �������� ������� �� ������������ ��������.
--SELECT CONVERT(DECIMAL(5,2), AVG(speed)) AS AvgSpeed
--FROM PC;

--2.�������� ������, ����� ������� ������� ������ �� �������� �� ��������� ��
--����� ������������.
--SELECT maker, AVG(SCREEN) AS AvgScreen
--FROM laptop INNER JOIN product
--ON laptop.model=product.model
--GROUP BY maker;

--3.�������� ������, ����� ������� �������� ������� �� ��������� � ���� ��� 1000
--SELECT CONVERT(DECIMAL(5,2), AVG(SPEED)) AS AvgSpeed
--FROM laptop
--WHERE price > 1000;

--4. �������� ������, ����� ������� �������� ���� �� ������������ ��������,
--����������� �� ������������ �A�.
--SELECT CONVERT(DECIMAL(5,2), AVG(price)) AS Avg_price
--FROM pc INNER JOIN product
--ON pc.model=product.model
--WHERE product.maker = 'A';

--5.�������� ������, ����� ������� �������� ���� �� ������������ �������� �
--��������� �� ������������ �B�.
--SELECT AVG(price) AS Avg_price
--FROM ((SELECT pc.price
--		FROM pc INNER JOIN product
--		ON pc.model = product.model
--		WHERE product.maker= 'B')
--		UNION ALL(SELECT laptop.price
--		FROM laptop INNER JOIN product
--		ON laptop.model = product.model
--		WHERE product.maker= 'B')) AS new_table;

--6. �������� ������, ����� ������� �������� ���� �� ������������ ��������
--������ ���������� �� �������.
--SELECT speed, CONVERT(DECIMAL(5,1), AVG(price)) AS AvgPrice
--FROM pc
--GROUP BY speed;

--7. �������� ������, ����� ������� ���������������, ����� �� ��������� ���� 3
--�������� ���������� ��������� (� �������� ���).--SELECT product.maker, COUNT(pc.code) AS Num_of_pc--FROM product INNER JOIN pc--ON product.model=pc.model--GROUP BY maker--HAVING COUNT(pc.code)>=3;--8. �������� ������, ����� ������� ��������������� � ���-������ ���� ��
--���������� ��������.--SELECT TOP 1 product.maker, MAX(pc.price) AS price--FROM product INNER JOIN pc--ON product.model=pc.model--GROUP BY product.maker--ORDER BY MAX(pc.price) desc;--SELECT product.maker, price--FROM product INNER JOIN pc--ON product.model=pc.model--WHERE price = (SELECT MAX(pc.price)--				FROM pc);--9. �������� ������, ����� ������� �������� ���� �� ������������ �������� ��
--����� ������� ��-������ �� 800.
--SELECT speed, AVG(price) AS AvgPrice
--FROM PC 
--GROUP BY speed
--HAVING speed > 800;

--10.�������� ������, ����� ������� ������� ������ �� ����� �� ���� ����������
--��������, ����������� �� �������������, ����� ����������� � ��������.
--���������� �� �� ������ �� ����� ������� ������������.
SELECT product.maker, CONVERT(DECIMAL(5,2), AVG(hd)) as AvgHd
FROM product INNER JOIN pc
ON product.model = pc.model
WHERE product.maker IN(SELECT DISTINCT maker
						FROM product INNER JOIN printer
						ON product.model=printer.model)
GROUP BY product.maker;