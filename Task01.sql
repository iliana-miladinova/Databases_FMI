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
SELECT CONVERT(DECIMAL(5,2), AVG(price)) AS Avg_price
FROM pc INNER JOIN product
ON pc.model=product.model
WHERE product.maker = 'A';

--5.Напишете заявка, която извежда средната цена на персоналните компютри и
--лаптопите за производител ‘B’.
SELECT AVG(price) AS Avg_price
FROM ((SELECT pc.price
		FROM pc INNER JOIN product
		ON pc.model = product.model
		WHERE product.maker= 'B')
		UNION ALL(SELECT laptop.price
		FROM laptop INNER JOIN product
		ON laptop.model = product.model
		WHERE product.maker= 'B')) AS new_table;

--6. Напишете заявка, която извежда средната цена на персоналните компютри
--според различните им честоти.
SELECT speed, CONVERT(DECIMAL(5,1), AVG(price)) AS AvgPrice
FROM pc
GROUP BY speed;