--USE pc;

--1. Напишете заявка, която извежда средната честота на персоналните компютри.
--SELECT CONVERT(DECIMAL(5,2), AVG(speed)) AS AvgSpeed
--FROM PC;

--2.Напишете заявка, която извежда средния размер на екраните на лаптопите за
--всеки производител.
--SELECT maker, AVG(SCREEN) AS AvgScreen
--FROM laptop INNER JOIN product
--ON laptop.model=product.model
--GROUP BY maker;

--3.Напишете заявка, която извежда средната честота на лаптопите с цена над 1000
--SELECT CONVERT(DECIMAL(5,2), AVG(SPEED)) AS AvgSpeed
--FROM laptop
--WHERE price > 1000;

--4. Напишете заявка, която извежда средната цена на персоналните компютри,
--произведени от производител ‘A’.
--SELECT CONVERT(DECIMAL(5,2), AVG(price)) AS Avg_price
--FROM pc INNER JOIN product
--ON pc.model=product.model
--WHERE product.maker = 'A';

--5.Напишете заявка, която извежда средната цена на персоналните компютри и
--лаптопите за производител ‘B’.
--SELECT AVG(price) AS Avg_price
--FROM ((SELECT pc.price
--		FROM pc INNER JOIN product
--		ON pc.model = product.model
--		WHERE product.maker= 'B')
--		UNION ALL(SELECT laptop.price
--		FROM laptop INNER JOIN product
--		ON laptop.model = product.model
--		WHERE product.maker= 'B')) AS new_table;

--6. Напишете заявка, която извежда средната цена на персоналните компютри
--според различните им честоти.
--SELECT speed, CONVERT(DECIMAL(5,1), AVG(price)) AS AvgPrice
--FROM pc
--GROUP BY speed;

--7. Напишете заявка, която извежда производителите, които са произвели поне 3
--различни персонални компютъра (с различен код).--SELECT product.maker, COUNT(pc.code) AS Num_of_pc--FROM product INNER JOIN pc--ON product.model=pc.model--GROUP BY maker--HAVING COUNT(pc.code)>=3;--8. Напишете заявка, която извежда производителите с най-висока цена на
--персонален компютър.--SELECT TOP 1 product.maker, MAX(pc.price) AS price--FROM product INNER JOIN pc--ON product.model=pc.model--GROUP BY product.maker--ORDER BY MAX(pc.price) desc;--SELECT product.maker, price--FROM product INNER JOIN pc--ON product.model=pc.model--WHERE price = (SELECT MAX(pc.price)--				FROM pc);--9. Напишете заявка, която извежда средната цена на персоналните компютри за
--всяка честота по-голяма от 800.
--SELECT speed, AVG(price) AS AvgPrice
--FROM PC 
--GROUP BY speed
--HAVING speed > 800;

--10.Напишете заявка, която извежда средния размер на диска на тези персонални
--компютри, произведени от производители, които произвеждат и принтери.
--Резултатът да се изведе за всеки отделен производител.
SELECT product.maker, CONVERT(DECIMAL(5,2), AVG(hd)) as AvgHd
FROM product INNER JOIN pc
ON product.model = pc.model
WHERE product.maker IN(SELECT DISTINCT maker
						FROM product INNER JOIN printer
						ON product.model=printer.model)
GROUP BY product.maker;