--USE FLIGHTS;

--1. �������� ������, ����� ������� ��� �� ������������ �������� �� ������, ����� �� �����
--� ���� �������, ���������� ���������� �� ���� �����. ��������� ������a.
--CREATE VIEW v_FLIGHT_INFO
--AS
--SELECT AIRLINE_OPERATOR, FNUMBER, COUNT(BOOKINGS.CUSTOMER_ID) AS customers_count
--FROM FLIGHTS LEFT JOIN BOOKINGS 
--ON FLIGHTS.FNUMBER= BOOKINGS.FLIGHT_NUMBER
--GROUP BY AIRLINE_OPERATOR, FNUMBER;

--SELECT * 
--FROM v_FLIGHT_INFO;

--2. �������� ������, ����� �� ����� ������� ������� ����� �� ������� � ���-�����
--����������. ��������� ������a.
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

--3. �������� ������ �� ��������� Agencies, ����� ������� ������ ����� �� ��������� �� ����  �����.
--����������� ������a � CHECK OPTION.
--CREATE VIEW v_AGENCIES_IN_SOFIA
--AS
--SELECT *
--FROM AGENCIES
--WHERE AGENCIES.CITY = 'Sofia'
--WITH CHECK OPTION;

--SELECT *
--FROM v_AGENCIES_IN_SOFIA;

--4. �������� ������ �� ��������� Agencies, ����� ������� ������ ����� �� ���������, ������
--�� ����������� ������ �� ���� ������� �� ���� �������� NULL. ����������� ������a �
--CHECK OPTION. ��������� ������a.
--CREATE VIEW v_AGENCIES_PHONE
--AS 
--SELECT *
--FROM AGENCIES
--WHERE PHONE IS NULL
--WITH CHECK OPTION;

--SELECT *
--FROM v_AGENCIES_PHONE;

--7. �������� ����������� �������.
--DROP VIEW v_FLIGHT_INFO;
--DROP VIEW v_MAX_AGENCY;
--DROP VIEW v_AGENCIES_IN_SOFIA;
--DROP VIEW v_AGENCIES_PHONE;
