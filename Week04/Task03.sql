--USE ships;

--1. �������� ������, ����� ������� ������ ������� ���������� �� �����
--�����, ����������� � ������� �� ������� ����. � ��������� �� ������ ��
--�� �������� ���� �������, ����� ����� ������.
--SELECT * 
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS=CLASSES.CLASS;

--2. ��������� ������� ������, ���� ���� ��� �������� � ��������� � ���������,
--����� ����� ������, �� ����������� ������ ��� ������ ��� ���� �������.
--SELECT *
--FROM SHIPS RIGHT JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE CLASSES.CLASS IN (SELECT SHIPS.NAME
--					FROM SHIPS)
--ORDER BY SHIPS.NAME;

--3. �� ����� ������ �������� ������� �� ��������, ����� ������ �� ��
--��������� � �����.
--SELECT COUNTRY
--FROM CLASSES INNER JOIN SHIPS
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE SHIPS.NAME NOT IN (SELECT SHIP
--						FROM OUTCOMES)
--ORDER BY COUNTRY;

--4. �������� ������� �� ������ ������ � ���� 7 ������, ������� �� ���� ����
--1916, �� �������� ������������ ������ Ship Name
--SELECT NAME AS 'Ship Name'
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE CLASSES.NUMGUNS >=7 AND SHIPS.LAUNCHED=1916;

--5. �������� ������� �� ������ �������� � ����� ������, ����� � ���� ��
--���������� �� �������, � ����� �� �� ��������. ��������� ��������� ��
--��� �� �������.
--SELECT SHIP, BATTLE, DATE
--FROM OUTCOMES INNER JOIN BATTLES
--ON BATTLE=BATTLES.NAME
--WHERE RESULT = 'sunk'
--ORDER BY BATTLE;

--6. �������� �����, ����������������� � �������� �� ������� �� ���� ��
--������ ������, ����� ���� ������ ��� ���� ������ ����.
--SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, SHIPS.LAUNCHED
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.NAME = CLASSES.CLASS
--WHERE SHIPS.NAME = SHIPS.CLASS;

--7. �������� ������ ������� ������, �� ����� ���� ������ �� ���� ���� ����
--�����.
--SELECT CLASSES.CLASS, TYPE, COUNTRY, NUMGUNS, BORE, DISPLACEMENT
--FROM CLASSES LEFT JOIN SHIPS
--ON CLASSES.CLASS = SHIPS.CLASS
--WHERE SHIPS.LAUNCHED IS NULL;

--8. �������� �����, ����������������� � ���� ������ �� ��������,
--��������� � ������� �North Atlantic�, � ���� � ��������� �� �������.
SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS, OUTCOMES.RESULT
FROM SHIPS INNER JOIN CLASSES
ON SHIPS.CLASS=CLASSES.CLASS 
INNER JOIN OUTCOMES
ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.BATTLE = 'North Atlantic';