DECLARE @name NVARCHAR(20), @age INT;
SET @name='Tom';
SET @age = 18;
PRINT 'Name: ' + @name;
PRINT 'Age: ' + CONVERT(CHAR, @age);

SET @name='Tom';
SET @age = 18;
SELECT @name, @age;

DECLARE @maxPrice MONEY, 
    @minPrice MONEY, 
    @dif MONEY, 
    @count INT
 
SET @count = (SELECT SUM(ProductCount) FROM Orders);
 
SELECT @minPrice=MIN(Price), @maxPrice = MAX(Price) FROM Products
 
SET @dif = @maxPrice - @minPrice;
 
PRINT 'Всего продано: ' + STR(@count, 5) + ' товарa(ов)';
PRINT 'Разница между максимальной и минимальной ценой: ' + STR(@dif)

DECLARE @sum MONEY, @id INT, @prodid INT;
SET @id=2;
 
SELECT @sum = SUM(Orders.Price*Orders.ProductCount), 
     @name=Products.ProductName, @prodid = Products.Id
FROM Orders
INNER JOIN Products ON ProductId = Products.Id
GROUP BY Products.ProductName, Products.Id
HAVING Products.Id=@id
 
PRINT 'Товар ' + @name + ' продан на сумму ' + STR(@sum)