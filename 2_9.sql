--ALTER TABLE Customers
--ADD "Address" NVARCHAR(50) NOT NULL DEFAULT 'Неизвестно';

--ALTER TABLE Customers
--DROP COLUMN "Address";

--ALTER TABLE Customers
--ALTER COLUMN FirstName NVARCHAR(200);

--ALTER TABLE Customers WITH NOCHECK
--ADD CHECK (Age > 21);

--ALTER TABLE Orders
--ADD FOREIGN KEY(CustomerId) REFERENCES Customers(Id);

--ALTER TABLE Orders
--ADD PRIMARY KEY (Id);

--ALTER TABLE Orders
--ADD CONSTRAINT PK_Orders_Id PRIMARY KEY (Id),
--    CONSTRAINT FK_Orders_To_Customers FOREIGN KEY(CustomerId) REFERENCES Customers(Id);
 
--ALTER TABLE Customers
--ADD CONSTRAINT CK_Age_Greater_Than_Zero CHECK (Age > 0);

--ALTER TABLE Orders
--DROP FK_Orders_To_Customers;