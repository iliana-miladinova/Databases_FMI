--USE movies;

--1. Напишете заявка, която извежда заглавие и година на всички филми, които са
--по-дълги от 120 минути и са снимани преди 2000 г. Ако дължината на филма е
--неизвестна, заглавието и годината на този филм също да се изведат.

--SELECT TITLE, YEAR
--FROM MOVIE
--WHERE (LENGTH > 120 OR LENGTH IS NULL) AND YEAR < 2000;

--2. Напишете заявка, която извежда име и пол на всички актьори (мъже и жени),
--чието име започва с 'J' и са родени след 1948 година. Резултатът да бъде
--подреден по име в намаляващ ред.

--SELECT NAME, GENDER
--FROM MOVIESTAR 
--WHERE NAME LIKE 'J%' AND BIRTHDATE > 1948
--ORDER BY NAME asc;

--3. Напишете заявка, която извежда име на студио и брой на актьорите,
--участвали във филми, които са създадени от това студио.

--SELECT STUDIONAME, COUNT(DISTINCT STARNAME) AS NUM_OF_ACTORS
--FROM MOVIE INNER JOIN STARSIN 
--ON TITLE=MOVIETITLE
--GROUP BY STUDIONAME;

--4. Напишете заявка, която за всеки актьор извежда име на актьора и броя на
--филмите, в които актьорът е участвал.
--SELECT STARNAME, COUNT(DISTINCT MOVIETITLE)
--FROM STARSIN 
--GROUP BY STARNAME;

--5. Напишете заявка, която за всяко студио извежда име на студиото и заглавие
--на филма, излязъл последно на екран за това студио.

--SELECT STUDIONAME, TITLE, YEAR
--FROM MOVIE AS M
--WHERE TITLE = (SELECT TOP 1 TITLE
--				FROM MOVIE
--				WHERE M.STUDIONAME = STUDIONAME
--				ORDER BY YEAR DESC);

--6. Напишете заявка, която извежда името на най-младия актьор (мъж).
--SELECT TOP 1 NAME
--FROM MOVIESTAR
--WHERE GENDER = 'M'
--ORDER BY BIRTHDATE DESC;

--7. Напишете заявка, която извежда име на актьор и име на студио за тези
--актьори, участвали в най-много филми на това студио.

--SELECT DISTINCT STARSIN.STARNAME, STUDIONAME
--FROM MOVIE AS M INNER JOIN STARSIN
--ON M.TITLE = STARSIN.MOVIETITLE
--WHERE STARNAME = (SELECT TOP 1 STARNAME
--					FROM MOVIE INNER JOIN STARSIN
--					ON MOVIE.TITLE = STARSIN.MOVIETITLE
--					WHERE M.STUDIONAME = STUDIONAME
--					GROUP BY STUDIONAME, STARNAME
--					ORDER BY COUNT(STARNAME) DESC);			

--8. Напишете заявка, която извежда заглавие и година на филма, и брой на
--актьорите, участвали в този филм за тези филми с повече от двама актьори.

--SELECT MOVIETITLE, MOVIEYEAR, COUNT(STARNAME)
--FROM STARSIN
--GROUP BY MOVIETITLE, MOVIEYEAR
--HAVING COUNT(STARNAME) > 2;