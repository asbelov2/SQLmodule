USE productsdb;
DECLARE @minPrice MONEY, @maxPrice MONEY
 
EXEC GetPriceStats @minPrice OUTPUT, @maxPrice OUTPUT
 
PRINT '����������� ���� ' + CONVERT(VARCHAR, @minPrice)
PRINT '������������ ���� ' + CONVERT(VARCHAR, @maxPrice)