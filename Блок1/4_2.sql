SELECT * FROM Products
	
SELECT ProductName, Price FROM Products

SELECT ProductName + ' (' + Manufacturer + ')', Price, Price * ProductCount 
FROM Products

SELECT
ProductName + ' (' + Manufacturer + ')' AS ModelName, 
Price,  
Price * ProductCount AS TotalSum
FROM Products

SELECT DISTINCT Manufacturer
FROM Products

--SELECT ProductName + ' (' + Manufacturer + ')' AS ModelName, Price
--INTO ProductSummary
--FROM Products
 
--SELECT * FROM ProductSummary

INSERT INTO ProductSummary
SELECT ProductName + ' (' + Manufacturer + ')' AS ModelName, Price
FROM Products