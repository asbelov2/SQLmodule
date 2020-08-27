UPDATE Products
SET Price = Price + 5000

UPDATE Products
SET Manufacturer = 'Samsung Inc.'
WHERE Manufacturer = 'Samsung'

USE productsdb;

UPDATE Products
SET Manufacturer = 'Apple Inc.'
FROM
(SELECT TOP 2 * FROM Products WHERE Manufacturer='Apple') AS Selected
WHERE Products.Id = Selected.Id