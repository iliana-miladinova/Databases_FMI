--USE FLIGHTS;

--1. �������� ���� ������ num_pass ��� ��������� Flights, ����� �� ������� ���� ��
--���������, ���������� ���������� �� ���������� �����.

--ALTER TABLE FLIGHTS
--ADD num_pass INT;

--UPDATE FLIGHTS
--SET num_pass = 0
--WHERE num_pass IS NULL;

--2. �������� ���� ������ num_book ��� ��������� Agencies, ����� �� ������� ���� ��
--������������ ��� ����������� �������.

--ALTER TABLE AGENCIES
--ADD num_book INT;

--UPDATE AGENCIES
--SET num_book = 0
--WHERE num_book IS NULL;

--3. �������� ������ �� ��������� Bookings, ����� �� �� ��������� ��� �������� ��
--���������� � ��������� � �� ��������� � ������� ���� �� ���������, ����������
--���������� �� ��������� Flights, ����� � ���� �� ������������ ��� ����������� �������.

--CREATE TRIGGER trg_insert_Bookings
--ON Bookings AFTER INSERT
--AS
--BEGIN
--UPDATE FLIGHTS
--SET num_pass=num_pass+1
--WHERE FNUMBER IN (SELECT FNUMBER FROM inserted);
--UPDATE AGENCIES
--SET num_book=num_book+1
--WHERE NAME IN (SELECT NAME FROM inserted);
--END

--4. �������� ������ �� ��������� Bookings, ����� �� �� ��������� ��� ��������� ��
--���������� � ��������� � �� �������� � ������� ���� �� ���������, ����������
--���������� �� ��������� Flights, ����� � ���� �� ������������ ��� ����������� �������.

--CREATE TRIGGER trg_delete_Bookings
--ON Bookings AFTER DELETE
--AS BEGIN
--UPDATE FLIGHTS
--SET num_pass=num_pass-1
--WHERE FNUMBER IN (SELECT FNUMBER FROM deleted);
--UPDATE AGENCIES
--SET num_book=num_book-1
--WHERE NAME IN (SELECT NAME FROM deleted);
--END;

--5. �������� ������ �� ��������� Bookings, ����� �� �� ��������� ��� ���������� ��
--���������� � ��������� � �� ��������� ��� �������� � ������� ���� �� ���������,
--���������� ���������� �� ��������� Flights ��� ������� �� ������� �� ������������.

--CREATE TRIGGER trg_update_Bookings
--ON Bookings AFTER UPDATE
--AS 
--BEGIN
--UPDATE FLIGHTS
--SET num_pass=num_pass-1
--WHERE FNUMBER IN (SELECT FLIGHT_NUMBER 
					--FROM deleted 
					--WHERE STATUS = 0) AND
--		FNUMBER IN (SELECT FLIGHT_NUMBER 
					--FROM inserted 
					--WHERE STATUS = 1);
--UPDATE FLIGHTS
--SET num_pass=num_pass+1
--WHERE FNUMBER IN (SELECT FLIGHT_NUMBER 
					--FROM inserted 
					--WHERE STATUS = 0) AND 
--		FNUMBER IN (SELECT FLIGHT_NUMBER 
					--FROM deleted 
					--WHERE STATUS=1);
--END