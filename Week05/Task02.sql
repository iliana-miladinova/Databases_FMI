--USE ships;

--1. �������� ������, ����� ������� ���� �� ��������� ����� ������.
--SELECT COUNT(CLASSES.TYPE) AS Num_of_Classes
--FROM CLASSES
--WHERE CLASSES.TYPE='bb';

--2. �������� ������, ����� ������� ������� ���� ������ �� ����� ���� ���� �����.
--SELECT CLASS, CONVERT(DECIMAL(5,2), AVG(NUMGUNS)) AS AvgNumGuns
--FROM CLASSES
--WHERE CLASSES.TYPE = 'bb'
--GROUP BY CLASS;

--3. �������� ������, ����� ������� ������� ���� ������ �� ������ ����� ������.
--SELECT CONVERT(DECIMAL(5,2), AVG(NUMGUNS)) AS AvgNumGuns
--FROM CLASSES
--WHERE CLASSES.TYPE = 'bb';

--4. �������� ������, ����� ������� �� ����� ���� ������� � ���������� ������, �
--����� ����� �� ���������� ���� � ������ �� ����.
--SELECT SHIPS.CLASS, MIN(SHIPS.LAUNCHED) AS firstYear, MAX(SHIPS.LAUNCHED) AS lastYear
--FROM SHIPS
--GROUP BY SHIPS.CLASS;

--5. �������� ������, ����� ������� ���� �� ��������, �������� � ����� ������
--�����.
--SELECT SHIPS.CLASS, COUNT(OUTCOMES.RESULT) AS NumOfSunk
--FROM SHIPS INNER JOIN OUTCOMES
--ON SHIPS.NAME=OUTCOMES.SHIP
--WHERE OUTCOMES.RESULT='sunk'
--GROUP BY SHIPS.CLASS;

--6. �������� ������, ����� ������� ���� �� ��������, �������� � ����� ������
----�����, �� ���� ������� � ������ �� 2 ������.
--SELECT SHIPS.CLASS, COUNT(OUTCOMES.RESULT) AS NumOfSunk
--FROM SHIPS INNER JOIN OUTCOMES
--ON SHIPS.NAME=OUTCOMES.SHIP
--WHERE OUTCOMES.RESULT='sunk' AND CLASS IN (SELECT CLASS
--											FROM SHIPS
--											GROUP BY CLASS
--											HAVING COUNT(CLASS)>2)
--GROUP BY SHIPS.CLASS;

--7. �������� ������, ����� ������� ������� ������� �� �������� �� �������� ��
--����� ������.
SELECT CLASSES.COUNTRY, CONVERT(DECIMAL(5,2), AVG(CLASSES.BORE)) AS AvgBore
FROM CLASSES INNER JOIN SHIPS
ON SHIPS.CLASS=CLASSES.CLASS
GROUP BY CLASSES.COUNTRY;