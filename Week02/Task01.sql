--USE movies;

--1. �������� ������, ����� ������� ������� �� ��������� ����, ��������� ���
--����� The Usual Suspects.

--SELECT NAME
--FROM MOVIESTAR INNER JOIN STARSIN
--ON MOVIESTAR.NAME=STARSIN.STARNAME
--WHERE MOVIESTAR.GENDER = 'M' AND STARSIN.MOVIETITLE = 'The Usual Suspects';

--2. �������� ������, ����� ������� ������� �� ���������, ��������� ��� ����� ��
--1995, ����������� �� ������ MGM.

--SELECT STARNAME
--FROM STARSIN INNER JOIN MOVIE
--ON STARSIN.MOVIEYEAR = MOVIE.YEAR
--WHERE STARSIN.MOVIEYEAR=1995 AND MOVIE.STUDIONAME='MGM';

--3. �������� ������, ����� ������� ������� �� ������������, ����� ��
--����������� ����� �� ������ MGM.
--SELECT DISTINCT MOVIEEXEC.NAME
--FROM MOVIEEXEC INNER JOIN MOVIE
--ON MOVIEEXEC.CERT#=MOVIE.PRODUCERC#
--WHERE MOVIE.STUDIONAME = 'MGM';

--4. �������� ������, ����� ������� ������� �� ����� � �������, ��-������ ��
--��������� �� ����� Star Wars.
--SELECT M2.TITLE
--FROM MOVIE AS M1, MOVIE AS M2
--WHERE M1.TITLE = 'Star Wars' AND (M2.LENGTH>M1.LENGTH);

--5. �������� ������, ����� ������� ������� �� ������������ � ����� ������ �������� �� ���� �� Stephen Spielberg.
--SELECT M2.NAME
--FROM MOVIEEXEC AS M1, MOVIEEXEC AS M2
--WHERE M1.NAME = 'Stephen Spielberg' AND (M2.NETWORTH > M1.NETWORTH)
