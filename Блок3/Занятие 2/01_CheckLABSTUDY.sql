USE [Chep_LabstudyNew]
GO

SELECT [cnum]
      ,[cname]
      ,[city]
      ,[rating]
      ,[snum]
  FROM [dbo].[Customers]
GO

USE [Chep_LabstudyNew]
GO

SELECT [onum]
      ,[amt]
      ,[odate]
      ,[cnum]
      ,[snum]
  FROM [dbo].[Orders]
GO

USE [Chep_LabstudyNew]
GO

SELECT [snum]
      ,[sname]
      ,[city]
      ,[comm]
  FROM [dbo].[Salespeople]
GO

