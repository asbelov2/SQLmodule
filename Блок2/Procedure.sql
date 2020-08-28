USE productsdb;
GO
CREATE PROCEDURE SelectByCity
    @City NVARCHAR(30)
AS
SELECT * FROM Orders WHERE (SELECT City FROM Customers WHERE Id=Orders.CustomerId)=@City