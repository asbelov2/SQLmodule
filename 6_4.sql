SELECT *
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)

SELECT * FROM CUSTOMERS
WHERE Id NOT IN (SELECT CustomerId FROM Orders)

SELECT * FROM Products
WHERE Price < ALL(SELECT Price FROM Products WHERE Manufacturer='Apple')

SELECT * FROM Products
WHERE Price < ANY(SELECT Price FROM Products WHERE Manufacturer='Apple')

SELECT *, 
(SELECT ProductName FROM Products WHERE Id=Orders.ProductId) AS Product 
FROM Orders

INSERT INTO Orders (ProductId, CustomerId, CreatedAt, ProductCount, Price)
VALUES
( 
    (SELECT Id FROM Products WHERE ProductName='Galaxy S8'), 
    (SELECT Id FROM Customers WHERE FirstName='Tom'),
    '2017-07-11',  
    2, 
    (SELECT Price FROM Products WHERE ProductName='Galaxy S8')
)

UPDATE Orders
SET ProductCount = ProductCount + 2
WHERE CustomerId=(SELECT Id FROM Customers WHERE FirstName='Tom')

UPDATE Orders
SET Price = (SELECT Price FROM Products WHERE Id=Orders.ProductId) + 2000
WHERE Id=1

DELETE FROM Orders
WHERE ProductId=(SELECT Id FROM Products WHERE ProductName='Galaxy S8')
AND CustomerId=(SELECT Id FROM Customers WHERE FirstName='Bob')