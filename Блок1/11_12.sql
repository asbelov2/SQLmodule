USE productsdb;
GO
CREATE PROCEDURE GetAvgPrice AS
DECLARE @avgPrice MONEY
SELECT @avgPrice = AVG(Price)
FROM Products
RETURN @avgPrice;