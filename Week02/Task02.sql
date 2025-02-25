--USE pc;

--1. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜˜˜ ˜
--˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜ ˜˜˜˜ 9 GB.

--SELECT maker, speed
--FROM product INNER JOIN laptop
--ON product.model = laptop.model
--WHERE laptop.hd >= 9;

--2. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜ ˜ ˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜˜˜˜, ˜˜˜˜˜˜˜˜˜˜˜ ˜˜
--˜˜˜˜˜˜˜˜˜˜˜˜ ˜ ˜˜˜ B.

--SELECT product.model, price
--FROM product INNER JOIN laptop
--ON product.model = laptop.model
--WHERE maker = 'B'
--UNION
--SELECT product.model, price
--FROM product INNER JOIN pc
--ON product.model = pc.model
--WHERE maker = 'B'
--UNION
--SELECT product.model, price
--FROM product INNER JOIN printer
--ON product.model = printer.model
--WHERE maker = 'B';

--3. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜,
--˜˜ ˜˜ ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜.

--SELECT maker
--FROM product INNER JOIN laptop
--ON product.model = laptop.model
--EXCEPT 
--SELECT maker
--FROM product INNER JOIN pc
--ON product.model = pc.model;

--4. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜ ˜˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜˜˜
--˜ ˜˜˜˜ ˜˜˜ ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜ (˜˜˜ ˜˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ ˜˜˜).

--SELECT DISTINCT P1.hd
--FROM pc AS P1 INNER JOIN pc AS P2
--ON P1.hd = P2.hd
--WHERE P1.code!=P2.code;

--5. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜,
--˜˜˜˜˜ ˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜ ˜˜ ˜˜ ˜˜˜˜˜˜˜˜ ˜˜˜˜ ˜˜
--˜˜˜˜˜˜, ˜˜˜˜˜˜˜˜ ˜˜˜˜ (i, j), ˜˜ ˜˜ ˜ (j, i).

--SELECT P1.model, P2.model
--FROM pc AS P1, pc AS P2
--WHERE P1.speed = P2.speed 
--	AND P1.ram = P2.ram
--	AND P1.model < P2.model;

--6. ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜, ˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜ ˜˜˜ ˜˜˜˜˜˜˜˜
--˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜ ˜˜˜˜ 400
SELECT DISTINCT pr1.maker
FROM product AS pr1 INNER JOIN pc AS p1 
ON pr1.model = p1.model INNER JOIN product AS pr2 
ON pr1.maker = pr2.maker INNER JOIN pc AS p2 
ON pr2.model = p2.model
WHERE p1.code != p2.code AND p1.speed >= 400 AND p2.speed >= 400;