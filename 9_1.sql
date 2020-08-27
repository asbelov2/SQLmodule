DECLARE @name NVARCHAR(20), @age INT;
SET @name='Tom';
SET @age = 18;
PRINT 'Name: ' + @name;
PRINT 'Age: ' + CONVERT(CHAR, @age);

SET @name='Tom';
SET @age = 18;
SELECT @name, @age;