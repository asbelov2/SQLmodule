USE productsdb

SELECT FirstName, COUNT(Orders.Id)
FROM Customers JOIN Orders 
ON Orders.CustomerId = Customers.Id
GROUP BY Customers.Id, Customers.FirstName;

SELECT FirstName, COUNT(Orders.Id)
FROM Customers LEFT JOIN Orders 
ON Orders.CustomerId = Customers.Id
GROUP BY Customers.Id, Customers.FirstName;

SELECT Products.ProductName, Products.Manufacturer, 
        SUM(Orders.ProductCount * Orders.Price) AS Units
FROM Products LEFT JOIN Orders
ON Orders.ProductId = Products.Id
GROUP BY Products.Id, Products.ProductName, Products.Manufacturer