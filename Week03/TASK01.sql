--USE movies;

--1. Напишете заявка, която извежда имената на актрисите, които са също и
--продуценти с нетни активи над 10 милиона.
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

--2. Напишете заявка, която извежда имената на тези актьори (мъже и жени),
--които не са продуценти.--SELECT NAME--FROM MOVIESTAR--WHERE MOVIESTAR.NAME NOT IN (SELECT NAME
--									FROM MOVIEEXEC);

--3. Напишете заявка, която извежда имената на всички филми с дължина,
--по-голяма от дължината на филма ‘Star Wars’
--SELECT TITLE
--FROM MOVIE
--WHERE MOVIE.LENGTH > (SELECT LENGTH
--						FROM MOVIE
--						WHERE TITLE = 'Star Wars');


--4. Напишете заявка, която извежда имената на продуцентите и имената на
--филмите за всички филми, които са продуцирани от продуценти с нетни
--активи по-големи от тези на ‘Merv Griffin’SELECT MOVIE.TITLE, MOVIEEXEC.NAME
FROM MOVIEEXEC, MOVIE
WHERE NETWORTH > (SELECT NETWORTH FROM MOVIEEXEC WHERE NAME = 'merv griffin') AND
MOVIE.PRODUCERC# = MOVIEEXEC.CERT#;