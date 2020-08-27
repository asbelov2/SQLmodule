SELECT * FROM Products
WHERE Manufacturer = 'Samsung'

SELECT * FROM Products
WHERE Price > 45000

SELECT * FROM Products
WHERE Price * ProductCount > 200000

SELECT * FROM Products
WHERE Manufacturer = 'Samsung' AND Price > 50000

SELECT * FROM Products
WHERE Manufacturer = 'Samsung' OR Price > 50000

SELECT * FROM Products
WHERE NOT Manufacturer = 'Samsung'

SELECT * FROM Products
WHERE Manufacturer = 'Samsung' OR Price > 30000 AND ProductCount > 2

SELECT * FROM Products
WHERE (Manufacturer = 'Samsung' OR Price > 30000) AND ProductCount > 2

SELECT * FROM Products
WHERE ProductCount IS NULL