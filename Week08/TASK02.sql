--USE pc;

--4. ����������� ��� INSERT ������. ��������� � ������ ����� �����, �� ���������� ��������
--����� 1100 � �������� �� ������������� C, ��� �������� 2400 MHz, RAM 2048 MB, ����� ����
--500 GB, 52x ������� ������� ���������� � ������ $299. ���� ������ �������� ��� ��� 12.
--���������: ����� � CD �� �� ��� ���.

--INSERT INTO pc(model ,code, speed, ram, hd, cd, price)
--VALUES('1100', 12, 2400, 2048, 500, '52x', 299)

--INSERT INTO product(maker, model, type)
--VALUES('C', '1100', 'pc')

--5. �� �� ������ ��������� ���������� � ��������� PC �� �������� ����� 1100
--DELETE FROM pc
--WHERE model = '1100';

--6. �� �� ������� �� ��������� Laptop ������ �������, ��������� �� ������������, ����� ��
--���������� ��������.
--DELETE FROM laptop
--WHERE model  NOT IN (SELECT model
--			FROM product
--			WHERE type = 'printer')

--7. ������������ � ������ ������������ B. �� ������ �������� �� � ��������� ������������� ��
--���� �.
--UPDATE product
--SET maker='A'
--WHERE maker='B';

--8. �� �� ������ ���������� ������ �� ����� �������� � �� �� ������� �� 20 GB ��� ����� �����
--����.
--UPDATE pc
--SET price=0.5*price,
--	hd=hd+20;

--9. �� ����� ������ �� ������������ B �������� �� ���� ��� ��� ��������� �� ������.
--UPDATE laptop
--SET screen=screen+1
--WHERE model IN (SELECT model
--				FROM product
--				WHERE maker = 'B');