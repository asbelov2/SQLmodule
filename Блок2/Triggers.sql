USE productsdb
GO
CREATE TRIGGER Orders_INSERT
ON Orders
INSTEAD OF INSERT
AS
IF(NOT EXISTS(
SELECT 1 FROM INSERTED WHERE
(SELECT City FROM Customers WHERE Id=INSERTED.CustomerId)<>(SELECT City FROM Sellers WHERE Id=INSERTED.SellerId)
))
	BEGIN
		INSERT INTO Orders (Description, Sum, CustomerId, SellerId, CreatedAt)
		SELECT Description, Sum, CustomerId, SellerId, CreatedAt FROM INSERTED
		INSERT INTO OrderHistory (Operation, CustomerId, SellerId, OrderDate)
		SELECT 'INSERT', 
			CustomerId, 
			SellerId,
			CreatedAt
		FROM INSERTED
	END
ELSE
	THROW 51000, 'Seller and customer must be from one city', 1

GO
CREATE TRIGGER Orders_DELETE
ON Orders
AFTER DELETE
AS
INSERT INTO OrderHistory (Operation, CustomerId, SellerId, OrderDate)
SELECT 'DELETE', 
			CustomerId, 
			SellerId,
			CreatedAt
FROM DELETED

GO
CREATE TRIGGER Orders_UPDATE
ON Orders
INSTEAD OF UPDATE
AS
IF(NOT EXISTS(
SELECT 1 FROM INSERTED WHERE
(SELECT City FROM Customers WHERE Id=INSERTED.CustomerId)<>(SELECT City FROM Sellers WHERE Id=INSERTED.SellerId)
))
	BEGIN
		INSERT INTO Orders (Description, Sum, CustomerId, SellerId, CreatedAt)
		SELECT Description, Sum, CustomerId, SellerId, CreatedAt FROM INSERTED
		INSERT INTO OrderHistory (Operation, CustomerId, SellerId, OrderDate)
		SELECT 'INSERT', 
			CustomerId, 
			SellerId,
			CreatedAt
		FROM INSERTED
	END
ELSE
	THROW 51000, 'Seller and customer must be from one city', 1