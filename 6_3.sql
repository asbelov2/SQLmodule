SELECT *
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products)

SELECT *
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)

SELECT  CreatedAt, 
        Price, 
        (SELECT ProductName FROM Products 
        WHERE Products.Id = Orders.ProductId) AS Product
FROM Orders

SELECT ProductName,
       Manufacturer,
       Price, 
        (SELECT AVG(Price) FROM Products AS SubProds 
         WHERE SubProds.Manufacturer=Prods.Manufacturer)  AS AvgPrice
FROM Products AS Prods
WHERE Price > 
    (SELECT AVG(Price) FROM Products AS SubProds 
     WHERE SubProds.Manufacturer=Prods.Manufacturer)