USE Belov_ASproductsdb
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
		INSERT INTO Orders (Description, Sum, CustomerId, SellerId, OrderDate)
		SELECT Description, Sum, CustomerId, SellerId, OrderDate FROM INSERTED
		INSERT INTO OrderHistory (Operation, CustomerId, SellerId, OrderDate)
		SELECT 'INSERT', 
			CustomerId, 
			SellerId,
			OrderDate
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
			OrderDate
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
		UPDATE Orders 
		SET Description = (SELECT Description FROM INSERTED WHERE INSERTED.Id = Orders.Id), 
		Sum = (SELECT Sum FROM INSERTED WHERE INSERTED.Id = Orders.Id), 
		CustomerId = (SELECT CustomerId FROM INSERTED WHERE INSERTED.Id = Orders.Id), 
		SellerId = (SELECT SellerId FROM INSERTED WHERE INSERTED.Id = Orders.Id), 
		OrderDate = (SELECT OrderDate FROM INSERTED WHERE INSERTED.Id = Orders.Id)
		WHERE Id = (SELECT Id FROM INSERTED)
		SELECT Description, Sum, CustomerId, SellerId, OrderDate FROM INSERTED
		INSERT INTO OrderHistory (Operation, CustomerId, SellerId, OrderDate)
		SELECT 'UPDATE', 
			CustomerId, 
			SellerId,
			OrderDate
		FROM INSERTED
	END
ELSE
	THROW 51000, 'Seller and customer must be from one city', 1