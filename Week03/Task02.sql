--USE pc;

--1. Напишете заявка, която извежда производителите на персонални
--компютри с честота над 500.
--SELECT product.maker
--FROM product 
--WHERE model IN (SELECT model
--				FROM pc
--				WHERE speed > 500);

--2. Напишете заявка, която извежда код, модел и цена на принтерите с най-висока цена.
--SELECT code, model, price
--FROM printer
--WHERE price = (SELECT TOP 1 price
--				FROM printer
--				ORDER BY price DESC);

--3. Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от
--честотата на всички персонални компютри.
--SELECT *
--FROM laptop
--WHERE speed < ALL(SELECT speed
--					FROM pc);

--4. Напишете заявка, която извежда модела и цената на продукта (PC,
--лаптоп или принтер) с най-висока цена.
--SELECT TOP 1 comp.model, comp.price
--FROM ((SELECT model, price
--		FROM pc) 
--		UNION
--		(SELECT model, price
--		FROM laptop)
--		UNION
--		(SELECT model, price
--		FROM printer)) comp
--ORDER BY price DESC;

--5. Напишете заявка, която извежда производителя на цветния принтер с
--най-ниска цена.
--SELECT maker
--FROM product
--WHERE model = (SELECT TOP 1 model
--				FROM printer
--				WHERE color = 'y'
--				ORDER BY price ASC);

--6. Напишете заявка, която извежда производителите на тези персонални
--компютри с най-малко RAM памет, които имат най-бързи процесори.
SELECT DISTINCT maker
FROM product
WHERE model IN (SELECT model
				FROM pc
				WHERE speed = (SELECT TOP 1 speed
								FROM pc
								WHERE ram = (SELECT TOP 1 ram
											FROM pc
											ORDER BY ram ASC)
								ORDER BY speed DESC));
