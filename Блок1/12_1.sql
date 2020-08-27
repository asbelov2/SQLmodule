USE productsdb;
GO
CREATE TRIGGER Products_INSERT_UPDATE
ON Products
AFTER INSERT, UPDATE
AS
UPDATE Products
SET Price = Price + Price * 0.38
WHERE Id = (SELECT Id FROM inserted)