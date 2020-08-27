USE productsdb;
 
DECLARE @prodName NVARCHAR(20), @company NVARCHAR(20);
DECLARE @prodCount INT, @price MONEY
SET @prodName = 'Galaxy C7'
SET @company = 'Samsung'
SET @price = 22000
SET @prodCount = 5
 
EXEC AddProduct @prodName, @company, @prodCount, @price
 
SELECT * FROM Products

-- EXEC AddProduct 'Galaxy C7', 'Samsung', 5, 22000