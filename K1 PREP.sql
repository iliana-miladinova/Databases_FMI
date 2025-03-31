--USE pc;
--8. Напишете заявка, която извежда производителите с най-висока цена на
--персонален компютър.

--SELECT PRODUCT.maker
--FROM product 
--WHERE model IN (SELECT TOP 1 model
--				FROM pc
--				ORDER BY PRICE DESC);

--SELECT PRODUCT.maker, PC.price
--FROM product INNER JOIN pc
--ON product.model=PC.model
--WHERE PRICE IN (SELECT MAX(PRICE)
--				FROM pc);

--9. Напишете заявка, която извежда средната цена на персоналните компютри за
--всяка честота по-голяма от 800.--SELECT SPEED, AVG(PRICE) AS AVG_SPEED--FROM pc--GROUP BY speed--HAVING speed > 800;--10.Напишете заявка, която извежда средния размер на диска на тези персонални
--компютри, произведени от производители, които произвеждат и принтери.
--Резултатът да се изведе за всеки отделен производител.

--SELECT product.maker, AVG(pc.hd) AS AVG_HD
--FROM PC INNER JOIN product
--ON product.model = pc.model
--GROUP BY product.maker
--HAVING product.maker IN (SELECT maker
--						FROM product INNER JOIN printer
--						ON product.model=printer.model);

--USE ships;
--4. Напишете заявка, която извежда за всеки клас първата и последната година, в
--която кораб от съответния клас е пуснат на вода
--SELECT SHIPS.CLASS, MIN(LAUNCHED), MAX(LAUNCHED)
--FROM SHIPS
--GROUP BY CLASS;

--6. Напишете заявка, която извежда броя на корабите, потънали в битка според
--класа, за тези класове с повече от 2 кораба.--SELECT COUNT(SHIP), SHIPS.CLASS--FROM OUTCOMES INNER JOIN SHIPS--ON OUTCOMES.SHIP = SHIPS.NAME--WHERE RESULT = 'sunk' AND CLASS IN (SELECT CLASS--									FROM SHIPS--									GROUP BY CLASS--									HAVING COUNT(CLASS) > 2)--GROUP BY SHIPS.CLASS;--7. Напишете заявка, която извежда средния калибър на оръдията на корабите за
--всяка страна.--SELECT COUNTRY, AVG(BORE) AS AVG_BORE--FROM CLASSES INNER JOIN SHIPS--ON SHIPS.CLASS=CLASSES.CLASS--GROUP BY COUNTRY;--USE movies;--6. Напишете заявка, която извежда името на най-младия актьор (мъж).--SELECT TOP 1 NAME--FROM MOVIESTAR--WHERE GENDER = 'M'--ORDER BY BIRTHDATE DESC;--7. Напишете заявка, която извежда име на актьор и име на студио за тези
--актьори, участвали в най-много филми на това студио.
SELECT DISTINCT STARNAME, STUDIONAME
FROM STARSIN INNER JOIN MOVIE AS M
ON TITLE=MOVIETITLE AND YEAR=MOVIEYEAR
WHERE STARNAME IN (SELECT TOP 1 STARNAME
					FROM STARSIN INNER JOIN MOVIE
					ON TITLE=MOVIETITLE AND YEAR=MOVIEYEAR
					WHERE M.STUDIONAME = STUDIONAME
					GROUP BY STARNAME, STUDIONAME
					ORDER BY COUNT(STARNAME) DESC);