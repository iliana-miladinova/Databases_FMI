--USE ships;
--10. ��� ��������� ����� ������ �� ����� Nelson - Nelson � Rodney - �� ���� ������� �� ����
--������������ ���� 1927 �. ����� �� ����� 16-������ ������ (bore) � ��������������� �� 34000
--���� (displacement). �������� ���� ����� ��� ������ �� �����.
--INSERT INTO CLASSES(CLASS, TYPE, BORE, DISPLACEMENT, COUNTRY)
--VALUES('Nelson', 'bb', 16, 34000, 'Britain');
--INSERT INTO SHIPS(NAME, CLASS, LAUNCHED)
--VALUES('Nelson', 'Nelson', 1927), ('Rodney', 'Nelson', 1927);

--11. �������� �� ��������� Ships ������ ������, ����� �� �������� � �����.
--DELETE FROM SHIPS
--WHERE NAME IN (SELECT SHIP
--				FROM OUTCOMES
--				WHERE RESULT='sunk');

--12. ��������� ������� � ��������� Classes ����, �� ��������� (bore) �� �� ������� � ���������� (�
--������� � � ������, 1 ��� ~ 2.5 ��) � ����������������� �� �� ������� � �������� ������ (1 �.�.
--= 1.1 �.)
UPDATE CLASSES
SET BORE=2.5*BORE,
	DISPLACEMENT=1.1*DISPLACEMENT;