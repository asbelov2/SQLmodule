USE productsdb;
GO
CREATE PROCEDURE CreateProduct
    @name NVARCHAR(20),
    @manufacturer NVARCHAR(20),
    @count INT,
    @price MONEY,
    @id INT OUTPUT
AS
    INSERT INTO Products(ProductName, Manufacturer, ProductCount, Price)
    VALUES(@name, @manufacturer, @count, @price)
    SET @id = @@IDENTITY