USE PC;

--1. �������� ������, ����� ������� ������������, ����� � ��� �� ������� ��
--���� �������������, �� ����� ����������� ������� �� �� ������� (���� ��
--� ��������� PC, Laptop ��� Printer).

--SELECT maker, product.model, product.type
--FROM product LEFT JOIN PC
--ON product.model=PC.model
--LEFT JOIN laptop
--ON product.model=laptop.model
--LEFT JOIN printer
--ON product.model=printer.model
--WHERE PC.model IS NULL AND laptop.model IS NULL AND printer.model IS NULL;

--2. �������� ������ �������������, ����� ������ ����� �������, ���� �
--��������.
--SELECT DISTINCT P1.maker
--FROM product AS P1 INNER JOIN product P2
--ON P1.maker=P2.maker
--WHERE P1.type='laptop' AND P2.type='printer';

--3. �������� ��������� �� ���� ������ �������, ����� �� �������� � ��� ���
--������ ������ �������.
--SELECT DISTINCT L1.hd
--FROM laptop AS L1, laptop AS L2
--WHERE L1.hd=L2.hd AND L1.model!=L2.model;

--4. �������� ������ ������ ���������� ��������, ����� ����� �����������
--������������.SELECT *FROM pc LEFT JOIN productON pc.model=product.modelWHERE product.model IS NULL;