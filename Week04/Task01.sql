--USE movies;

--1. �������� ������, ����� ������� ����� �� ���������� � ������� ��
--�������, ����������� �� ���������� �� ����� �Star Wars�.
--SELECT MOVIE.TITLE, MOVIEEXEC.NAME
--FROM MOVIE INNER JOIN MOVIEEXEC
--ON PRODUCERC#=CERT#
--WHERE PRODUCERC# = (SELECT PRODUCERC#
--					FROM MOVIE
--					WHERE TITLE = 'Star Wars');

--2. �������� ������, ����� ������� ������� �� ������������ �� �������, �
--����� � �������� �Harrison Ford�
--SELECT DISTINCT NAME
--FROM MOVIEEXEC INNER JOIN MOVIE
--ON PRODUCERC# = CERT#
--WHERE PRODUCERC# = (SELECT DISTINCT PRODUCERC#
--					FROM MOVIE INNER JOIN STARSIN
--					ON TITLE=MOVIETITLE AND YEAR=MOVIEYEAR
--					WHERE STARNAME = 'Harrison Ford');

--3. �������� ������, ����� ������� ����� �� �������� � ������� ��
--���������, ��������� ��� �����, ����������� �� ���� ������, ���������
--�� ��� �� ������.--SELECT DISTINCT STUDIONAME, STARNAME--FROM MOVIE INNER JOIN STARSIN --ON TITLE = MOVIETITLE AND YEAR=MOVIEYEAR--ORDER BY STUDIONAME;--4. �������� ������, ����� ������� ������� �� ���������, ��������� ���
--����� �� ���������� � ���-������ ����� ������.
--SELECT STARNAME, NETWORTH, TITLE
--FROM STARSIN INNER JOIN MOVIE
--ON TITLE = MOVIETITLE AND YEAR=MOVIEYEAR
--INNER JOIN MOVIEEXEC 
--ON PRODUCERC#=CERT#
--WHERE PRODUCERC# = (SELECT TOP 1 PRODUCERC#
--					FROM MOVIE INNER JOIN MOVIEEXEC
--					ON PRODUCERC#=CERT#
--					ORDER BY NETWORTH DESC);

--5. �������� ������, ����� ������� ������� �� ���������, ����� �� ��
--��������� � ���� ���� ����.
SELECT NAME, MOVIETITLE
FROM MOVIESTAR LEFT JOIN STARSIN
ON STARNAME=NAME
WHERE MOVIETITLE IS NULL;