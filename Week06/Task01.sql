--USE movies;

--1. �������� ������, ����� ������� �������� � ������ �� ������ �����, ����� ��
--��-����� �� 120 ������ � �� ������� ����� 2000 �. ��� ��������� �� ����� �
--����������, ���������� � �������� �� ���� ���� ���� �� �� �������.

--SELECT TITLE, YEAR
--FROM MOVIE
--WHERE (LENGTH > 120 OR LENGTH IS NULL) AND YEAR < 2000;

--2. �������� ������, ����� ������� ��� � ��� �� ������ ������� (���� � ����),
--����� ��� ������� � 'J' � �� ������ ���� 1948 ������. ���������� �� ����
--�������� �� ��� � ��������� ���.

--SELECT NAME, GENDER
--FROM MOVIESTAR 
--WHERE NAME LIKE 'J%' AND BIRTHDATE > 1948
--ORDER BY NAME asc;

--3. �������� ������, ����� ������� ��� �� ������ � ���� �� ���������,
--��������� ��� �����, ����� �� ��������� �� ���� ������.

--SELECT STUDIONAME, COUNT(DISTINCT STARNAME) AS NUM_OF_ACTORS
--FROM MOVIE INNER JOIN STARSIN 
--ON TITLE=MOVIETITLE
--GROUP BY STUDIONAME;

--4. �������� ������, ����� �� ����� ������ ������� ��� �� ������� � ���� ��
--�������, � ����� �������� � ��������.
--SELECT STARNAME, COUNT(DISTINCT MOVIETITLE)
--FROM STARSIN 
--GROUP BY STARNAME;

--5. �������� ������, ����� �� ����� ������ ������� ��� �� �������� � ��������
--�� �����, ������� �������� �� ����� �� ���� ������.

--SELECT STUDIONAME, TITLE, YEAR
--FROM MOVIE AS M
--WHERE TITLE = (SELECT TOP 1 TITLE
--				FROM MOVIE
--				WHERE M.STUDIONAME = STUDIONAME
--				ORDER BY YEAR DESC);

--6. �������� ������, ����� ������� ����� �� ���-������ ������ (���).
--SELECT TOP 1 NAME
--FROM MOVIESTAR
--WHERE GENDER = 'M'
--ORDER BY BIRTHDATE DESC;

--7. �������� ������, ����� ������� ��� �� ������ � ��� �� ������ �� ����
--�������, ��������� � ���-����� ����� �� ���� ������.

--SELECT DISTINCT STARSIN.STARNAME, STUDIONAME
--FROM MOVIE AS M INNER JOIN STARSIN
--ON M.TITLE = STARSIN.MOVIETITLE
--WHERE STARNAME = (SELECT TOP 1 STARNAME
--					FROM MOVIE INNER JOIN STARSIN
--					ON MOVIE.TITLE = STARSIN.MOVIETITLE
--					WHERE M.STUDIONAME = STUDIONAME
--					GROUP BY STUDIONAME, STARNAME
--					ORDER BY COUNT(STARNAME) DESC);			

--8. �������� ������, ����� ������� �������� � ������ �� �����, � ���� ��
--���������, ��������� � ���� ���� �� ���� ����� � ������ �� ����� �������.

--SELECT MOVIETITLE, MOVIEYEAR, COUNT(STARNAME)
--FROM STARSIN
--GROUP BY MOVIETITLE, MOVIEYEAR
--HAVING COUNT(STARNAME) > 2;