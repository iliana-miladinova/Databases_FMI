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
SELECT CONVERT(DECIMAL(5,2), AVG(price)) AS Avg_price
FROM pc INNER JOIN product
ON pc.model=product.model
WHERE product.maker = 'A';

--5.�������� ������, ����� ������� �������� ���� �� ������������ �������� �
--��������� �� ������������ �B�.
SELECT AVG(price) AS Avg_price
FROM ((SELECT pc.price
		FROM pc INNER JOIN product
		ON pc.model = product.model
		WHERE product.maker= 'B')
		UNION ALL(SELECT laptop.price
		FROM laptop INNER JOIN product
		ON laptop.model = product.model
		WHERE product.maker= 'B')) AS new_table;

--6. �������� ������, ����� ������� �������� ���� �� ������������ ��������
--������ ���������� �� �������.
SELECT speed, CONVERT(DECIMAL(5,1), AVG(price)) AS AvgPrice
FROM pc
GROUP BY speed;