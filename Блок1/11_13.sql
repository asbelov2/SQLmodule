USE productsdb;
 
DECLARE @result MONEY
 
EXEC @result = GetAvgPrice
PRINT @result