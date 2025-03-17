--USE movies;

--1. Напишете заявка, която извежда името на продуцента и имената на
--филмите, продуцирани от продуцента на филма ‘Star Wars’.
--SELECT MOVIE.TITLE, MOVIEEXEC.NAME
--FROM MOVIE INNER JOIN MOVIEEXEC
--ON PRODUCERC#=CERT#
--WHERE PRODUCERC# = (SELECT PRODUCERC#
--					FROM MOVIE
--					WHERE TITLE = 'Star Wars');

--2. Напишете заявка, която извежда имената на продуцентите на филмите, в
--които е участвал ‘Harrison Ford’
--SELECT DISTINCT NAME
--FROM MOVIEEXEC INNER JOIN MOVIE
--ON PRODUCERC# = CERT#
--WHERE PRODUCERC# = (SELECT DISTINCT PRODUCERC#
--					FROM MOVIE INNER JOIN STARSIN
--					ON TITLE=MOVIETITLE AND YEAR=MOVIEYEAR
--					WHERE STARNAME = 'Harrison Ford');

--3. Напишете заявка, която извежда името на студиото и имената на
--актьорите, участвали във филми, произведени от това студио, подредени
--по име на студио.--SELECT DISTINCT STUDIONAME, STARNAME--FROM MOVIE INNER JOIN STARSIN --ON TITLE = MOVIETITLE AND YEAR=MOVIEYEAR--ORDER BY STUDIONAME;--4. Напишете заявка, която извежда имената на актьорите, участвали във
--филми на продуценти с най-големи нетни активи.
--SELECT STARNAME, NETWORTH, TITLE
--FROM STARSIN INNER JOIN MOVIE
--ON TITLE = MOVIETITLE AND YEAR=MOVIEYEAR
--INNER JOIN MOVIEEXEC 
--ON PRODUCERC#=CERT#
--WHERE PRODUCERC# = (SELECT TOP 1 PRODUCERC#
--					FROM MOVIE INNER JOIN MOVIEEXEC
--					ON PRODUCERC#=CERT#
--					ORDER BY NETWORTH DESC);

--5. Напишете заявка, която извежда имената на актьорите, които не са
--участвали в нито един филм.
SELECT NAME, MOVIETITLE
FROM MOVIESTAR LEFT JOIN STARSIN
ON STARNAME=NAME
WHERE MOVIETITLE IS NULL;