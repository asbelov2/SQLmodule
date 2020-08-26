DELETE Products
WHERE Id=9

DELETE Products
WHERE Manufacturer='Xiaomi' AND Price < 15000

DELETE Products FROM
(SELECT TOP 2 * FROM Products
WHERE Manufacturer='Apple]') AS Selected
WHERE Products.Id = Selected.Id

DELETE Products