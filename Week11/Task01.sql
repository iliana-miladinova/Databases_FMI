--USE FLIGHTS;

--1. Създайте изглед, който извежда име на авиокомпания оператор на полета, номер на полет
--и брой пътници, потвърдили резервация за този полет. Тествайте изгледa.
--CREATE VIEW v_FLIGHT_INFO
--AS
--SELECT AIRLINE_OPERATOR, FNUMBER, COUNT(BOOKINGS.CUSTOMER_ID) AS customers_count
--FROM FLIGHTS LEFT JOIN BOOKINGS 
--ON FLIGHTS.FNUMBER= BOOKINGS.FLIGHT_NUMBER
--GROUP BY AIRLINE_OPERATOR, FNUMBER;

--SELECT * 
--FROM v_FLIGHT_INFO;

--2. Създайте изглед, който за всяка агенция извежда името на клиента с най-много
--резервации. Тествайте изгледa.
--CREATE VIEW v_MAX_AGENCY
--AS 
--SELECT CUSTOMERS.FNAME, CUSTOMERS.LNAME, CUSTOMERS.ID
--FROM CUSTOMERS
--WHERE ID IN (SELECT CUSTOMER_ID FROM BOOKINGS AS B
--GROUP BY AGENCY, CUSTOMER_ID
--HAVING COUNT(CUSTOMER_ID) >= (SELECT TOP 1 COUNT(CUSTOMER_ID)
--								FROM BOOKINGS
--								WHERE BOOKINGS.AGENCY=B.AGENCY
--								GROUP BY AGENCY, CUSTOMER_ID
--								ORDER BY COUNT(CUSTOMER_ID) DESC));

--SELECT *
--FROM v_MAX_AGENCY;

--3. Създайте изглед за таблицата Agencies, който извежда всички данни за агенциите от град  София.
--Дефинирайте изгледa с CHECK OPTION.
--CREATE VIEW v_AGENCIES_IN_SOFIA
--AS
--SELECT *
--FROM AGENCIES
--WHERE AGENCIES.CITY = 'Sofia'
--WITH CHECK OPTION;

--SELECT *
--FROM v_AGENCIES_IN_SOFIA;

--4. Създайте изглед за таблицата Agencies, който извежда всички данни за агенциите, такива
--че телефонните номера на тези агенции да имат стойност NULL. Дефинирайте изгледa с
--CHECK OPTION. Тествайте изгледa.
--CREATE VIEW v_AGENCIES_PHONE
--AS 
--SELECT *
--FROM AGENCIES
--WHERE PHONE IS NULL
--WITH CHECK OPTION;

--SELECT *
--FROM v_AGENCIES_PHONE;

--7. Изтрийте създадените изгледи.
--DROP VIEW v_FLIGHT_INFO;
--DROP VIEW v_MAX_AGENCY;
--DROP VIEW v_AGENCIES_IN_SOFIA;
--DROP VIEW v_AGENCIES_PHONE;
