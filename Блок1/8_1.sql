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
SELECT CHAR(219)            --  �
SELECT ASCII('�')           -- 219
SELECT NCHAR(1067)          -- �
SELECT UNICODE('�')     -- 1067

SELECT ProductName, Manufacturer,
    CASE ProductCount
        WHEN 1 THEN '����� �������������'
        WHEN 2 THEN '���� ������'
        WHEN 3 THEN '���� � �������'
        ELSE '����� ������'
    END AS EvaluateCount
FROM Products

SELECT ProductName, Manufacturer,
    CASE
        WHEN Price > 50000 THEN '��������� A'
        WHEN Price BETWEEN 40000 AND 50000 THEN '��������� B'
        WHEN Price BETWEEN 30000 AND 40000 THEN '��������� C'
        ELSE '��������� D'
    END AS Category
FROM Products

SELECT ProductName, Manufacturer,
    IIF(ProductCount>3, '����� ������', '���� ������')
FROM Products