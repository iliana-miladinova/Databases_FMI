--USE movies;

--1. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜˜˜ ˜˜˜˜, ˜˜˜˜˜˜˜˜˜ ˜˜˜
--˜˜˜˜˜ The Usual Suspects.

--SELECT NAME
--FROM MOVIESTAR INNER JOIN STARSIN
--ON MOVIESTAR.NAME=STARSIN.STARNAME
--WHERE MOVIESTAR.GENDER = 'M' AND STARSIN.MOVIETITLE = 'The Usual Suspects';

--2. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜˜˜, ˜˜˜˜˜˜˜˜˜ ˜˜˜ ˜˜˜˜˜ ˜˜
--1995, ˜˜˜˜˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜ MGM.

--SELECT STARNAME
--FROM STARSIN INNER JOIN MOVIE
--ON STARSIN.MOVIEYEAR = MOVIE.YEAR
--WHERE STARSIN.MOVIEYEAR=1995 AND MOVIE.STUDIONAME='MGM';

--3. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜
--˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜ MGM.
--SELECT DISTINCT MOVIEEXEC.NAME
--FROM MOVIEEXEC INNER JOIN MOVIE
--ON MOVIEEXEC.CERT#=MOVIE.PRODUCERC#
--WHERE MOVIE.STUDIONAME = 'MGM';

--4. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜, ˜˜-˜˜˜˜˜˜ ˜˜
--˜˜˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜ Star Wars.
--SELECT M2.TITLE
--FROM MOVIE AS M1, MOVIE AS M2
--WHERE M1.TITLE = 'Star Wars' AND (M2.LENGTH>M1.LENGTH);

--5. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜ ˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜ ˜˜ Stephen Spielberg.
--SELECT M2.NAME
--FROM MOVIEEXEC AS M1, MOVIEEXEC AS M2
--WHERE M1.NAME = 'Stephen Spielberg' AND (M2.NETWORTH > M1.NETWORTH)
select  NAME
from MOVIEEXEC
where NETWORTH > (select NETWORTH
				from MOVIEEXEC
				where name='Stephen Spielberg');

select name
from MOVIEEXEC inner join (select producerc#
							from MOVIE inner join STARSIN
								on title=MOVIETITLE and year=MOVIEYEAR
								where STARNAME='Harrison Ford') as prod
on MOVIEEXEC.CERT#=prod.PRODUCERC#;

select name
from MOVIEEXEC 
where cert# in (select producerc#
				from movie inner join STARSIN
				on title=MOVIETITLE and year=MOVIEYEAR
								where STARNAME='Harrison Ford');

select name, (select top 1 LENGTH 
from MOVIE
where PRODUCERC#=cert#
order by length asc) as maxlen
from MOVIEEXEC
order by name;

select m1.NAME, m2.NAME
from MOVIESTAR as m1, MOVIESTAR as m2
where m1.ADDRESS=m2.ADDRESS and m1.name < m2.name