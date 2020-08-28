USE productsdb
GO
CREATE TRIGGER Orders_INSERT_UPDATE
ON Orders
INSTEAD OF INSERT, UPDATE
AS
IF(NOT EXISTS(
SELECT * FROM INSERTED WHERE
(SELECT City FROM Customers WHERE Id=INSERTED.CustomerId)<>(SELECT City FROM Sellers WHERE Id=INSERTED.SellerId)
))
	BEGIN
		INSERT INTO Orders (Description, Sum, CustomerId, SellerId, CreatedAt)
		SELECT Description, Sum, CustomerId, SellerId, CreatedAt FROM INSERTED
		INSERT INTO OrderHistory (Operation, CustomerId, SellerId)
		SELECT 'New order', 
			CustomerId, 
			SellerId
		FROM INSERTED
	END
ELSE
	PRINT 'Seller and customer must be from one city'

GO
CREATE TRIGGER Orders_DELETE
ON Orders
AFTER DELETE
AS
INSERT INTO OrderHistory (Operation, CustomerId, SellerId)
SELECT 'Order deleted', 
			CustomerId, 
			SellerId
FROM DELETED