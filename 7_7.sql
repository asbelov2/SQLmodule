SELECT FirstName, LastName 
FROM Customers
UNION SELECT FirstName, LastName FROM Employees

SELECT FirstName + ' ' +LastName AS FullName
FROM Customers
UNION SELECT FirstName + ' ' + LastName AS EmployeeName 
FROM Employees
ORDER BY FullName DESC

SELECT FirstName, LastName
FROM Customers
UNION ALL SELECT FirstName, LastName 
FROM Employees

SELECT FirstName, LastName, AccountSum + AccountSum * 0.1 AS TotalSum 
FROM Customers WHERE AccountSum < 3000
UNION SELECT FirstName, LastName, AccountSum + AccountSum * 0.3 AS TotalSum 
FROM Customers WHERE AccountSum >= 3000