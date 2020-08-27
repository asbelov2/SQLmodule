USE productsdb;
 
DECLARE @id INT
 
EXEC CreateProduct 'LG V30', 'LG', 3, 28000, @id OUTPUT
 
PRINT @id