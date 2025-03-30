--USE ships;

--1. Напишете заявка, която извежда имената на всички кораби без повторения,
--които са участвали в поне една битка и чиито имена започват с C или K.

--SELECT DISTINCT NAME
--FROM SHIPS INNER JOIN OUTCOMES
--ON NAME=SHIP
--WHERE NAME LIKE 'C%' OR NAME LIKE 'K%';

--2. Напишете заявка, която извежда име и държава на всички кораби, които
--никога не са потъвали в битка (може и да не са участвали).
--SELECT SHIPS.NAME, CLASSES.COUNTRY
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS LEFT JOIN OUTCOMES
--ON SHIPS.NAME=OUTCOMES.SHIP
--WHERE OUTCOMES.RESULT != 'sunk' OR OUTCOMES.RESULT IS NULL;

--3. Напишете заявка, която извежда държавата и броя на потъналите кораби за
--тази държава. Държави, които нямат кораби или имат кораб, но той не е
--участвал в битка, също да бъдат изведени.

--SELECT CLASSES.COUNTRY, COUNT(OUTCOMES.SHIP)
--FROM CLASSES LEFT JOIN SHIPS 
--ON SHIPS.CLASS = CLASSES.CLASS LEFT JOIN OUTCOMES
--ON SHIPS.NAME = OUTCOMES.SHIP
--WHERE OUTCOMES.RESULT = 'sunk' OR SHIPS.NAME IS NULL OR OUTCOMES.SHIP IS NULL
--GROUP BY CLASSES.COUNTRY;

--4. Напишете заявка, която извежда име на битките, които са по-мащабни (с
--повече участващи кораби) от битката при Guadalcanal.
--SELECT BATTLE
--FROM OUTCOMES
--GROUP BY BATTLE
--HAVING COUNT(SHIP) > (SELECT COUNT(SHIP)
--						FROM OUTCOMES
--						WHERE BATTLE = 'Guadalcanal');

--5. Напишете заявка, която извежда име на битките, които са по-мащабни (с
--повече участващи страни) от битката при Surigao Strait.
--SELECT OUTCOMES.BATTLE
--FROM OUTCOMES INNER JOIN SHIPS
--ON SHIPS.NAME = OUTCOMES.SHIP INNER JOIN CLASSES
--ON CLASSES.CLASS = SHIPS.CLASS
--GROUP BY BATTLE
--HAVING COUNT(COUNTRY) > (SELECT COUNT(COUNTRY)
--						FROM CLASSES INNER JOIN SHIPS
--						ON SHIPS.CLASS = CLASSES.CLASS INNER JOIN OUTCOMES
--						ON SHIPS.NAME = OUTCOMES.SHIP
--						WHERE OUTCOMES.BATTLE = 'Surigao Strait');

--6. Напишете заявка, която извежда имената на най-леките кораби с най-много
--оръдия.
--SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE CLASSES.DISPLACEMENT <= ALL (SELECT CLASSES.DISPLACEMENT
--                                   FROM CLASSES)
--  AND CLASSES.DISPLACEMENT >= ALL (SELECT CLASSES.NUMGUNS
--                                   FROM CLASSES);

--7. Изведете броя на корабите, които са били увредени в битка, но са били
--поправени и по-късно са победили в друга битка.
--SELECT COUNT(O.SHIP)
--FROM OUTCOMES AS O INNER JOIN BATTLES AS B
--ON BATTLE = B.NAME
--WHERE RESULT = 'ok' AND SHIP IN (SELECT OUTCOMES.SHIP
--								FROM OUTCOMES INNER JOIN BATTLES
--								ON OUTCOMES.BATTLE = BATTLES.NAME
--								WHERE OUTCOMES.RESULT = 'damaged' AND B.DATE>DATE);

--8. Изведете име на корабите, които са били увредени в битка, но са били
--поправени и по-късно са победили в по-мащабна битка (с повече кораби).
SELECT SHIP
FROM OUTCOMES AS O INNER JOIN BATTLES AS B
ON BATTLE = NAME
GROUP BY O.SHIP, O.RESULT, B.DATE
HAVING RESULT = 'damaged' AND B.DATE < (SELECT DATE
										FROM BATTLES INNER JOIN OUTCOMES
										ON BATTLE = NAME
										WHERE OUTCOMES.SHIP = O.SHIP
										GROUP BY OUTCOMES.SHIP, OUTCOMES.RESULT, BATTLES.DATE
										HAVING OUTCOMES.RESULT = 'ok')
										AND COUNT(O.SHIP) <= (SELECT COUNT(OUTCOMES.SHIP)
										FROM OUTCOMES INNER JOIN BATTLES
										ON BATTLE = NAME
										WHERE OUTCOMES.SHIP = O.SHIP
										GROUP BY OUTCOMES.BATTLE, OUTCOMES.RESULT, BATTLES.DATE
										HAVING OUTCOMES.RESULT = 'ok');


