--USE ships;

--1. �������� ������, ����� ������� ��������, ����� ������ �� � ���-�����
--���� ������.
--SELECT DISTINCT COUNTRY
--FROM CLASSES
--WHERE NUMGUNS = (SELECT TOP 1 NUMGUNS
--				FROM CLASSES
--				ORDER BY NUMGUNS DESC);

--2. �������� ������, ����� ������� ���������, �� ����� ���� ���� ��
--�������� � ������� � �����.
--SELECT DISTINCT CLASS
--FROM SHIPS
--WHERE NAME IN (SELECT SHIP
--				FROM OUTCOMES
--				WHERE RESULT = 'sunk');

--3. �������� ������, ����� ������� ����� � ����� �� �������� � 16 ������
--������.
--SELECT NAME, CLASS
--FROM SHIPS
--WHERE CLASS IN (SELECT CLASS
--				FROM CLASSES
--				WHERE BORE = 16);

--4. �������� ������, ����� ������� ������� �� �������, � ����� ��
--��������� ������ �� ���� �Kongo�.
--SELECT BATTLE
--FROM OUTCOMES
--WHERE SHIP IN (SELECT NAME
--				FROM SHIPS
--				WHERE CLASS = 'Kongo');

--5. �������� ������, ����� ������� ����� � ����� �� ��������, ����� ����
--������ � ��-����� ��� ����� �� ���� �� �������� ��� ����� �������
--������.
SELECT NAME, CLASS
FROM SHIPS
WHERE CLASS IN (SELECT CLASS
				FROM CLASSES AS C
				WHERE C.NUMGUNS >= ALL(SELECT NUMGUNS
										FROM CLASSES
										WHERE C.BORE=BORE));