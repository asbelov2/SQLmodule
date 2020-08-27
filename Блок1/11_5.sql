USE productsdb;
 
DECLARE @prodName NVARCHAR(20), @company NVARCHAR(20);
SET @prodName = 'Honor 9'
SET @company = 'Huawei'
 
EXEC AddProduct @name = @prodName, 
                @manufacturer=@company,
                @count = 3, 
                @price = 18000