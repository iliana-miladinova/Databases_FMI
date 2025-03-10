--USE pc;

--1. �������� ������, ����� ������� ��������������� �� ����������
--�������� � ������� ��� 500.
--SELECT product.maker
--FROM product 
--WHERE model IN (SELECT model
--				FROM pc
--				WHERE speed > 500);

--2. �������� ������, ����� ������� ���, ����� � ���� �� ���������� � ���-������ ����.
--SELECT code, model, price
--FROM printer
--WHERE price = (SELECT TOP 1 price
--				FROM printer
--				ORDER BY price DESC);

--3. �������� ������, ����� ������� ���������, ����� ������� � ��-����� ��
--��������� �� ������ ���������� ��������.
--SELECT *
--FROM laptop
--WHERE speed < ALL(SELECT speed
--					FROM pc);

--4. �������� ������, ����� ������� ������ � ������ �� �������� (PC,
--������ ��� �������) � ���-������ ����.
--SELECT TOP 1 comp.model, comp.price
--FROM ((SELECT model, price
--		FROM pc) 
--		UNION
--		(SELECT model, price
--		FROM laptop)
--		UNION
--		(SELECT model, price
--		FROM printer)) comp
--ORDER BY price DESC;

--5. �������� ������, ����� ������� ������������� �� ������� ������� �
--���-����� ����.
--SELECT maker
--FROM product
--WHERE model = (SELECT TOP 1 model
--				FROM printer
--				WHERE color = 'y'
--				ORDER BY price ASC);

--6. �������� ������, ����� ������� ��������������� �� ���� ����������
--�������� � ���-����� RAM �����, ����� ���� ���-����� ���������.
SELECT DISTINCT maker
FROM product
WHERE model IN (SELECT model
				FROM pc
				WHERE speed = (SELECT TOP 1 speed
								FROM pc
								WHERE ram = (SELECT TOP 1 ram
											FROM pc
											ORDER BY ram ASC)
								ORDER BY speed DESC));
