INSERT INTO Orders 
VALUES
( 
	'Покупка фруктов',
	3500.0,
    (SELECT Id FROM Customers WHERE FirstName='Манго'),
	(SELECT Id FROM Sellers WHERE FirstName='Арбуз'),
	'2020-08-28'
),
( 
	'Покупка фруктов',
	1500,
    (SELECT Id FROM Customers WHERE FirstName='Манго'),
	(SELECT Id FROM Sellers WHERE FirstName='Апельсин'),
	'2020-08-28'
),
( 
	'Продажа овощей',
	12000,
    (SELECT Id FROM Customers WHERE FirstName='Лук'),
	(SELECT Id FROM Sellers WHERE FirstName='Брокколи'),
	'2020-08-28'
),
( 
	'Нелегальная продажа орехов в фруктовый сад',
	1000000,
    (SELECT Id FROM Customers WHERE FirstName='Фундук'),
	(SELECT Id FROM Sellers WHERE FirstName='Арбуз'),
	'2020-08-28'
)
