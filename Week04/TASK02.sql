USE PC;

--1. Напишете заявка, която извежда производител, модел и тип на продукт за
--тези производители, за които съответният продукт не се продава (няма го
--в таблиците PC, Laptop или Printer).

--SELECT maker, product.model, product.type
--FROM product LEFT JOIN PC
--ON product.model=PC.model
--LEFT JOIN laptop
--ON product.model=laptop.model
--LEFT JOIN printer
--ON product.model=printer.model
--WHERE PC.model IS NULL AND laptop.model IS NULL AND printer.model IS NULL;

--2. Намерете всички производители, които правят както лаптопи, така и
--принтери.
--SELECT DISTINCT P1.maker
--FROM product AS P1 INNER JOIN product P2
--ON P1.maker=P2.maker
--WHERE P1.type='laptop' AND P2.type='printer';

--3. Намерете размерите на тези твърди дискове, които се появяват в два или
--повече модела лаптопи.
--SELECT DISTINCT L1.hd
--FROM laptop AS L1, laptop AS L2
--WHERE L1.hd=L2.hd AND L1.model!=L2.model;

--4. Намерете всички модели персонални компютри, които нямат регистриран
--производител.SELECT *FROM pc LEFT JOIN productON pc.model=product.modelWHERE product.model IS NULL;