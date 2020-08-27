USE productsdb;
DECLARE @minPrice MONEY, @maxPrice MONEY
 
EXEC GetPriceStats @minPrice OUTPUT, @maxPrice OUTPUT
 
PRINT 'Минимальная цена ' + CONVERT(VARCHAR, @minPrice)
PRINT 'Максимальная цена ' + CONVERT(VARCHAR, @maxPrice)