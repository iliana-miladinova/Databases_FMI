--USE ships;

--1. Напишете заявка, която извежда броя на класовете бойни кораби.
--SELECT COUNT(CLASSES.TYPE) AS Num_of_Classes
--FROM CLASSES
--WHERE CLASSES.TYPE='bb';

--2. Напишете заявка, която извежда средния брой оръдия за всеки клас боен кораб.
--SELECT CLASS, CONVERT(DECIMAL(5,2), AVG(NUMGUNS)) AS AvgNumGuns
--FROM CLASSES
--WHERE CLASSES.TYPE = 'bb'
--GROUP BY CLASS;

--3. Напишете заявка, която извежда средния брой оръдия за всички бойни кораби.
--SELECT CONVERT(DECIMAL(5,2), AVG(NUMGUNS)) AS AvgNumGuns
--FROM CLASSES
--WHERE CLASSES.TYPE = 'bb';

--4. Напишете заявка, която извежда за всеки клас първата и последната година, в
--която кораб от съответния клас е пуснат на вода.
--SELECT SHIPS.CLASS, MIN(SHIPS.LAUNCHED) AS firstYear, MAX(SHIPS.LAUNCHED) AS lastYear
--FROM SHIPS
--GROUP BY SHIPS.CLASS;

--5. Напишете заявка, която извежда броя на корабите, потънали в битка според
--класа.
--SELECT SHIPS.CLASS, COUNT(OUTCOMES.RESULT) AS NumOfSunk
--FROM SHIPS INNER JOIN OUTCOMES
--ON SHIPS.NAME=OUTCOMES.SHIP
--WHERE OUTCOMES.RESULT='sunk'
--GROUP BY SHIPS.CLASS;

--6. Напишете заявка, която извежда броя на корабите, потънали в битка според
----класа, за тези класове с повече от 2 кораба.
--SELECT SHIPS.CLASS, COUNT(OUTCOMES.RESULT) AS NumOfSunk
--FROM SHIPS INNER JOIN OUTCOMES
--ON SHIPS.NAME=OUTCOMES.SHIP
--WHERE OUTCOMES.RESULT='sunk' AND CLASS IN (SELECT CLASS
--											FROM SHIPS
--											GROUP BY CLASS
--											HAVING COUNT(CLASS)>2)
--GROUP BY SHIPS.CLASS;

--7. Напишете заявка, която извежда средния калибър на оръдията на корабите за
--всяка страна.
SELECT CLASSES.COUNTRY, CONVERT(DECIMAL(5,2), AVG(CLASSES.BORE)) AS AvgBore
FROM CLASSES INNER JOIN SHIPS
ON SHIPS.CLASS=CLASSES.CLASS
GROUP BY CLASSES.COUNTRY;