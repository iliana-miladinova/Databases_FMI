--USE pc;
--8. �������� ������, ����� ������� ��������������� � ���-������ ���� ��
--���������� ��������.

--SELECT PRODUCT.maker
--FROM product 
--WHERE model IN (SELECT TOP 1 model
--				FROM pc
--				ORDER BY PRICE DESC);

--SELECT PRODUCT.maker, PC.price
--FROM product INNER JOIN pc
--ON product.model=PC.model
--WHERE PRICE IN (SELECT MAX(PRICE)
--				FROM pc);

--9. �������� ������, ����� ������� �������� ���� �� ������������ �������� ��
--����� ������� ��-������ �� 800.--SELECT SPEED, AVG(PRICE) AS AVG_SPEED--FROM pc--GROUP BY speed--HAVING speed > 800;--10.�������� ������, ����� ������� ������� ������ �� ����� �� ���� ����������
--��������, ����������� �� �������������, ����� ����������� � ��������.
--���������� �� �� ������ �� ����� ������� ������������.

--SELECT product.maker, AVG(pc.hd) AS AVG_HD
--FROM PC INNER JOIN product
--ON product.model = pc.model
--GROUP BY product.maker
--HAVING product.maker IN (SELECT maker
--						FROM product INNER JOIN printer
--						ON product.model=printer.model);

--USE ships;
--4. �������� ������, ����� ������� �� ����� ���� ������� � ���������� ������, �
--����� ����� �� ���������� ���� � ������ �� ����
--SELECT SHIPS.CLASS, MIN(LAUNCHED), MAX(LAUNCHED)
--FROM SHIPS
--GROUP BY CLASS;

--6. �������� ������, ����� ������� ���� �� ��������, �������� � ����� ������
--�����, �� ���� ������� � ������ �� 2 ������.--SELECT COUNT(SHIP), SHIPS.CLASS--FROM OUTCOMES INNER JOIN SHIPS--ON OUTCOMES.SHIP = SHIPS.NAME--WHERE RESULT = 'sunk' AND CLASS IN (SELECT CLASS--									FROM SHIPS--									GROUP BY CLASS--									HAVING COUNT(CLASS) > 2)--GROUP BY SHIPS.CLASS;--7. �������� ������, ����� ������� ������� ������� �� �������� �� �������� ��
--����� ������.--SELECT COUNTRY, AVG(BORE) AS AVG_BORE--FROM CLASSES INNER JOIN SHIPS--ON SHIPS.CLASS=CLASSES.CLASS--GROUP BY COUNTRY;--USE movies;--6. �������� ������, ����� ������� ����� �� ���-������ ������ (���).--SELECT TOP 1 NAME--FROM MOVIESTAR--WHERE GENDER = 'M'--ORDER BY BIRTHDATE DESC;--7. �������� ������, ����� ������� ��� �� ������ � ��� �� ������ �� ����
--�������, ��������� � ���-����� ����� �� ���� ������.
SELECT DISTINCT STARNAME, STUDIONAME
FROM STARSIN INNER JOIN MOVIE AS M
ON TITLE=MOVIETITLE AND YEAR=MOVIEYEAR
WHERE STARNAME IN (SELECT TOP 1 STARNAME
					FROM STARSIN INNER JOIN MOVIE
					ON TITLE=MOVIETITLE AND YEAR=MOVIEYEAR
					WHERE M.STUDIONAME = STUDIONAME
					GROUP BY STARNAME, STUDIONAME
					ORDER BY COUNT(STARNAME) DESC);