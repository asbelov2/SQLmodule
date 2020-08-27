DECLARE @lastDate DATE
 
SELECT @lastDate = MAX(CreatedAt) FROM Orders
 
IF DATEDIFF(day, @lastDate, GETDATE()) > 10
    PRINT '�� ��������� ������ ���� �� ���� �������'
ELSE
    PRINT '�� ��������� ������ ���� ���� ������'


DECLARE @count INT, @sum MONEY

SELECT @lastDate = MAX(CreatedAt), 
    @count = SUM(ProductCount) ,
    @sum = SUM(ProductCount * Price)
FROM Orders
 
IF @count > 0
    BEGIN
        PRINT '���� ���������� ������: ' + CONVERT(NVARCHAR, @lastDate) 
        PRINT '������� ' + CONVERT(NVARCHAR, @count) + ' ������(�)'
        PRINT '�� ����� ����� ' + CONVERT(NVARCHAR, @sum)
    END;
ELSE
    PRINT '������ � ���� ������ �����������'

DECLARE @number INT, @factorial INT
SET @factorial = 1;
SET @number = 5;
 
WHILE @number > 0
    BEGIN
        SET @factorial = @factorial * @number
        SET @number = @number - 1
    END;
 
PRINT @factorial