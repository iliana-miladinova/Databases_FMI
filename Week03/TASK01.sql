--USE movies;

--1. �������� ������, ����� ������� ������� �� ���������, ����� �� ���� �
--���������� � ����� ������ ��� 10 �������.
--SELECT NAME
--FROM MOVIESTAR
--WHERE NAME IN (SELECT STARSIN.STARNAME
--FROM STARSIN
--WHERE STARSIN.STARNAME IN ( SELECT MOVIEEXEC.NAME
--FROM MOVIEEXEC
--WHERE MOVIEEXEC.CERT# IN (SELECT MOVIE.PRODUCERC#
--FROM MOVIE) AND MOVIEEXEC.NETWORTH > 10000000));

--SELECT NAME 
--FROM MOVIEEXEC INNER JOIN ( SELECT PRODUCERC#
--							FROM MOVIE JOIN STARSIN
--							ON TITLE = MOVIETITLE
--							)AS PROD
--ON MOVIEEXEC.CERT# = PROD.PRODUCERC#
--WHERE  MOVIEEXEC.NETWORTH > 10000000 AND MOVIEEXEC.NAME IN (SELECT NAME 
--															FROM MOVIESTAR
--															WHERE GENDER = 'F');
--SELECT NAME
--FROM MOVIESTAR
--WHERE GENDER = 'F' AND MOVIESTAR.NAME IN (SELECT NAME
--											FROM MOVIEEXEC
--											WHERE NETWORTH > 10000000);

--2. �������� ������, ����� ������� ������� �� ���� ������� (���� � ����),
--����� �� �� ����������.--SELECT NAME--FROM MOVIESTAR--WHERE MOVIESTAR.NAME NOT IN (SELECT NAME
--									FROM MOVIEEXEC);

--3. �������� ������, ����� ������� ������� �� ������ ����� � �������,
--��-������ �� ��������� �� ����� �Star Wars�
--SELECT TITLE
--FROM MOVIE
--WHERE MOVIE.LENGTH > (SELECT LENGTH
--						FROM MOVIE
--						WHERE TITLE = 'Star Wars');


--4. �������� ������, ����� ������� ������� �� ������������ � ������� ��
--������� �� ������ �����, ����� �� ����������� �� ���������� � �����
--������ ��-������ �� ���� �� �Merv Griffin�SELECT MOVIE.TITLE, MOVIEEXEC.NAME
FROM MOVIEEXEC, MOVIE
WHERE NETWORTH > (SELECT NETWORTH FROM MOVIEEXEC WHERE NAME = 'merv griffin') AND
MOVIE.PRODUCERC# = MOVIEEXEC.CERT#;