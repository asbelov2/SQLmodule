﻿CREATE DATABASE STUDYTrace

--DROP DATABASE STUDYTrace

select DATABASEPROPERTYEX('STUDYTrace','IsAutoCreateStatistics');
ALTER DATABASE STUDYTrace SET AUTO_CREATE_STATISTICS ON
--ALTER DATABASE STUDYTrace SET AUTO_CREATE_STATISTICS OFF

select DATABASEPROPERTYEX('STUDYTrace','IsAutoUpdateStatistics');
ALTER DATABASE STUDYTrace SET AUTO_UPDATE_STATISTICS ON
--ALTER DATABASE STUDYTrace SET AUTO_UPDATE_STATISTICS OFF

ALTER DATABASE STUDYTrace MODIFY FILE
(NAME='STUDYTrace', SIZE = 60MB)

USE STUDYTrace
DBCC SHRINKFILE
('STUDYTrace',25)

select * from sys.messages
select * from sys.databases
select * from sys.database_principals
select * from sys.objects

select * from INFORMATION_SCHEMA.TABLES
select * from INFORMATION_SCHEMA.COLUMNS
select * from INFORMATION_SCHEMA.TABLE_PRIVILEGES

GO
EXEC sp_help;
GO
EXEC sp_helpdb;

GO
CREATE TABLE Customers
(
    Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(30) NOT NULL,
);

USE STUDYTrace
EXEC sp_helpindex N'Customers';

DROP TABLE Customers;