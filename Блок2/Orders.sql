INSERT INTO Orders 
VALUES
( 
	'������� �������',
	3500.0,
    (SELECT Id FROM Customers WHERE FirstName='�����'),
	(SELECT Id FROM Sellers WHERE FirstName='�����'),
	'2020-08-28'
),
( 
	'������� �������',
	1500,
    (SELECT Id FROM Customers WHERE FirstName='�����'),
	(SELECT Id FROM Sellers WHERE FirstName='��������'),
	'2020-08-28'
),
( 
	'������� ������',
	12000,
    (SELECT Id FROM Customers WHERE FirstName='���'),
	(SELECT Id FROM Sellers WHERE FirstName='��������'),
	'2020-08-28'
),
( 
	'����������� ������� ������ � ��������� ���',
	1000000,
    (SELECT Id FROM Customers WHERE FirstName='������'),
	(SELECT Id FROM Sellers WHERE FirstName='�����'),
	'2020-08-28'
)
