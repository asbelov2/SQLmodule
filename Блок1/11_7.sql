DECLARE @prodName NVARCHAR(20), @company NVARCHAR(20), @price MONEY
SET @prodName = 'Redmi Note 5A'
SET @company = 'Xiaomi'
SET @price = 22000
 
EXEC AddProductWithOptionalCount @prodName, @company, @price
 
SELECT * FROM Products