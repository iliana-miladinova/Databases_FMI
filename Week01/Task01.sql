--�� ������ �� ����� Movies
--USE movies

--1. �������� ������, ����� ������� ������ �� ������ �Disney�
--SELECT ADDRESS
--FROM STUDIO
--WHERE NAME = 'Disney';

--2. �������� ������, ����� ������� ��������� ���� �� ������� Jack Nicholson
--SELECT BIRTHDATE
--FROM MOVIESTAR
--WHERE NAME = 'Jack Nicholson';

--3. �������� ������, ����� ������� ������� �� ���������, ����� �� ��������� ��� ���� �� 1980 ��� ��� ����, � ����� �������� ��� ������ �Knight�
--SELECT STARNAME
--FROM STARSIN
--WHERE (MOVIETITLE LIKE '%Knight%') OR MOVIEYEAR = 1980;

--4. �������� ������, ����� ������� ������� �� ������������ � ����� ������ ��� 10 000 000 ������--SELECT NAME--FROM MOVIEEXEC--WHERE NETWORTH > 10000000;--5. �������� ������, ����� ������� ������� �� ���������, ����� �� ���� ��� ������ �� Prefect Rd.--SELECT NAME--FROM MOVIESTAR--WHERE GENDER = 'M' OR ADDRESS = 'Prefect Rd.';