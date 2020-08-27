--USE productsdb;
--INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
--VALUES('iPhone X', 'Apple', 2, 79900)
 
--SELECT * FROM History

--USE productsdb;
--DELETE FROM Products
--WHERE Id=2
 
--SELECT * FROM History

USE productsdb;
INSERT INTO Products(ProductName, Manufacturer, ProductCount, Price)
VALUES('C350', 'Motorola', 10, 2100);

UPDATE Products SET Manufacturer='Moto'
WHERE Manufacturer='Motorola';

SELECT * FROM History