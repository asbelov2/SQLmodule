--USE productsdb
--GO
--CREATE TRIGGER Products_INSERT
--ON Products
--AFTER INSERT
--AS
--INSERT INTO History (ProductId, Operation)
--SELECT Id, 'Добавлен товар ' + ProductName + '   фирма ' + Manufacturer
--FROM INSERTED

--USE productsdb
--GO
--CREATE TRIGGER Products_DELETE
--ON Products
--AFTER DELETE
--AS
--INSERT INTO History (ProductId, Operation)
--SELECT Id, 'Удален товар ' + ProductName + '   фирма ' + Manufacturer
--FROM DELETED

USE productsdb
GO
CREATE TRIGGER Products_UPDATE
ON Products
AFTER UPDATE
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'Обновлен товар ' + ProductName + '   фирма ' + Manufacturer
FROM INSERTED