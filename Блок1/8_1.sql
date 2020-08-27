USE productsdb

SELECT UPPER(LEFT(Manufacturer,2)) AS Abbreviation,
       CONCAT(ProductName, ' - ',  Manufacturer) AS FullProdName
FROM Products
ORDER BY Abbreviation

SELECT ProductName, ROUND(Price * ProductCount, 2)
FROM Products

SELECT * FROM Orders
WHERE DATEDIFF(day, CreatedAt, GETDATE()) = 16

SELECT Id, CAST(CreatedAt AS nvarchar) + '; total: ' + CAST(Price * ProductCount AS nvarchar) 
FROM Orders

SELECT CONVERT(nvarchar, CreatedAt, 3), 
       CONVERT(nvarchar, Price * ProductCount, 1) 
FROM Orders

SELECT TRY_CONVERT(int, 'sql')      -- NULL
SELECT TRY_CONVERT(int, '22')       -- 22

SELECT STR(123.4567, 6,2)   -- 123.46
SELECT CHAR(219)            --  Ы
SELECT ASCII('Ы')           -- 219
SELECT NCHAR(1067)          -- Ы
SELECT UNICODE('Ы')     -- 1067

SELECT ProductName, Manufacturer,
    CASE ProductCount
        WHEN 1 THEN 'Товар заканчивается'
        WHEN 2 THEN 'Мало товара'
        WHEN 3 THEN 'Есть в наличии'
        ELSE 'Много товара'
    END AS EvaluateCount
FROM Products

SELECT ProductName, Manufacturer,
    CASE
        WHEN Price > 50000 THEN 'Категория A'
        WHEN Price BETWEEN 40000 AND 50000 THEN 'Категория B'
        WHEN Price BETWEEN 30000 AND 40000 THEN 'Категория C'
        ELSE 'Категория D'
    END AS Category
FROM Products

SELECT ProductName, Manufacturer,
    IIF(ProductCount>3, 'Много товара', 'Мало товара')
FROM Products