--USE pc;

--1. �������� ������, ����� ������� ������ ������ �������, �� ����� ��
--��������� ����� ������������� � 15" �����, ���� � � 11" �����.

--(SELECT model
--FROM laptop
--WHERE screen=15)
--INTERSECT
--(SELECT model
--FROM laptop
--WHERE screen = 11);

--2. �� �� ������� ���������� ������ ��������, ����� ���� � ��-����� �� ���������� ������,
--����������� �� ����� ������������.
--SELECT DISTINCT PC.model
--FROM pc INNER JOIN PRODUCT AS P
--ON PC.model = P.model
--WHERE price < (SELECT TOP 1 price
--				FROM laptop INNER JOIN product as p1
--				ON PC.model = P1.model
--				WHERE P1.maker = P.maker
--				ORDER BY PRICE);  
--SELECT DISTINCT PC.MODEL
--FROM PC JOIN PRODUCT AS P
--             ON PC.MODEL = P.MODEL
--GROUP BY PC.MODEL, P.MAKER, PC.PRICE
--HAVING PC.PRICE < (SELECT TOP 1 LAPTOP.PRICE
--                   FROM LAPTOP JOIN PRODUCT
--                                    ON LAPTOP.MODEL = PRODUCT.MODEL
--                   GROUP BY PRODUCT.MAKER, LAPTOP.PRICE
--                   HAVING PRODUCT.MAKER = P.MAKER
--                   ORDER BY LAPTOP.PRICE)

--3. ���� ����� �������� ���� �� �� �������� � ������� ������������� �
--�������� ����. �� �� ������� ���� ������ ��������, ����� ������ ���� (��
--���������� �� �������������) � ��-����� �� ���-������� ������, �����������
--�� ����� ������������.
--SELECT pc.model, AVG(price) AS AVG_PRICE
--FROM pc INNER JOIN product AS PR
--ON PC.model = PR.model
--GROUP BY pc.model, PR.maker
--HAVING AVG(PRICE) < (SELECT TOP 1 price
--					FROM laptop INNER JOIN product
--					ON laptop.model = product.model
--					WHERE product.maker=PR.maker
--					ORDER BY price ASC);

--4. �������� ������, ����� ������� �� ����� �������� ��� �� ��������,
--������������ � ���� ��������, ����� ���� ����, ��-������ ��� ����� ��
--��������.
SELECT code, product.maker, (SELECT COUNT(pc.code) FROM pc WHERE P1.price < pc.price) AS PC_COUNT
FROM pc AS P1 INNER JOIN product
ON P1.model=product.model
GROUP BY P1.code, product.maker, P1.price
ORDER BY P1.price DESC;
