CREATE TABLE Clients
(
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Phone NVARCHAR(20) NULL,
    Email NVARCHAR(20) NULL
)
 
INSERT INTO Clients (FirstName, LastName, Phone, Email)
VALUES ('Tom', 'Smith', '+36436734', NULL),
('Bob', 'Simpson', NULL, NULL)