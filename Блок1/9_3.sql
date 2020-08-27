USE productsdb;
 
CREATE TABLE #Accounts ( CreatedAt DATE, Balance MONEY)
 
DECLARE @rate FLOAT, @period INT, @sum MONEY, @date DATE
SET @date = GETDATE()
SET @rate = 0.065;
SET @period = 5;
SET @sum = 10000;
 
WHILE @period > 0
    BEGIN
        INSERT INTO #Accounts VALUES(@date, @sum)
        SET @period = @period - 1
        SET @date = DATEADD(year, 1, @date)
        SET @sum = @sum + @sum * @rate
    END;
 
SELECT * FROM #Accounts

DECLARE @number INT
SET @number = 1
 
WHILE @number < 10
    BEGIN
        PRINT CONVERT(NVARCHAR, @number)
        SET @number = @number + 1
        IF @number = 7
            BREAK;
        IF @number = 4
            CONTINUE;
        PRINT 'Конец итерации'
    END;