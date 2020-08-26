USE usersdb;

CREATE TABLE Customers
(
    Id INT PRIMARY KEY,
    Age INT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20)
)

CREATE TABLE Customers2
(
    Id INT,
    Age INT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20),
    PRIMARY KEY(Id)
)

CREATE TABLE OrderLines
(
    OrderId INT,
    ProductId INT,
    Quantity INT,
    Price MONEY,
    PRIMARY KEY(OrderId, ProductId)
)

CREATE TABLE Customers3
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20)
)

CREATE TABLE Customers4
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Email VARCHAR(30) UNIQUE,
    Phone VARCHAR(20) UNIQUE
)

CREATE TABLE Customers5
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20),
    UNIQUE(Email, Phone)
)

CREATE TABLE Customers6
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) UNIQUE,
    Phone VARCHAR(20) UNIQUE
)

CREATE TABLE Customers7
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT DEFAULT 18,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) UNIQUE,
    Phone VARCHAR(20) UNIQUE
);

CREATE TABLE Customers8
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT DEFAULT 18 CHECK(Age >0 AND Age < 100),
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) UNIQUE CHECK(Email !=''),
    Phone VARCHAR(20) UNIQUE CHECK(Phone !='')
);

CREATE TABLE Customers9
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT DEFAULT 18,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) UNIQUE,
    Phone VARCHAR(20) UNIQUE,
    CHECK((Age >0 AND Age<100) AND (Email !='') AND (Phone !=''))
)

CREATE TABLE Customers10
(
    Id INT CONSTRAINT PK_Customer_Id PRIMARY KEY IDENTITY,
    Age INT
        CONSTRAINT DF_Customer_Age DEFAULT 18 
        CONSTRAINT CK_Customer_Age CHECK(Age >0 AND Age < 100),
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) CONSTRAINT UQ_Customer_Email UNIQUE,
    Phone VARCHAR(20) CONSTRAINT UQ_Customer_Phone UNIQUE
)

CREATE TABLE Customers11
(
    Id INT IDENTITY,
    Age INT CONSTRAINT DF_Customer_Age DEFAULT 18, 
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    Phone VARCHAR(20),
    CONSTRAINT PK_Customer_Id PRIMARY KEY (Id), 
    CONSTRAINT CK_Customer_Age CHECK(Age >0 AND Age < 100),
    CONSTRAINT UQ_Customer_Email UNIQUE (Email),
    CONSTRAINT UQ_Customer_Phone UNIQUE (Phone)
)