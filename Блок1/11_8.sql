USE productsdb;
GO
CREATE PROCEDURE GetPriceStats
    @minPrice MONEY OUTPUT,
    @maxPrice MONEY OUTPUT
AS
SELECT @minPrice = MIN(Price),  @maxPrice = MAX(Price)
FROM Products