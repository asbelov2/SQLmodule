SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM Products
GROUP BY Manufacturer WITH ROLLUP

SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM Products
GROUP BY Manufacturer, ProductCount WITH ROLLUP

SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM Products
GROUP BY Manufacturer, ProductCount WITH CUBE

SELECT Manufacturer, COUNT(*) AS Models, ProductCount
FROM Products
GROUP BY GROUPING SETS(Manufacturer, ProductCount)

SELECT Manufacturer, COUNT(*) AS Models, 
        ProductCount, SUM(ProductCount) AS Units
FROM Products
GROUP BY GROUPING SETS(ROLLUP(Manufacturer), ProductCount)

SELECT Manufacturer, COUNT(*) AS Models, 
        ProductCount, SUM(ProductCount) AS Units
FROM Products
GROUP BY GROUPING SETS((Manufacturer, ProductCount), ProductCount)

SELECT ProductName, Manufacturer, ProductCount,
        COUNT(*) OVER (PARTITION BY Manufacturer) AS Models,
        SUM(ProductCount) OVER (PARTITION BY Manufacturer) AS Units
FROM Products