USE Chep_LabstudyNew
GO
INSERT INTO [dbo].[Customers]
           ([cnum]
           ,[cname]
           ,[city]
           ,[rating]
           ,[snum])
     VALUES
           (2010
           ,'Маршалов'
           ,'Ижевск'
           ,120
           ,1004),
		   (2011
           ,'Веточкин'
           ,'Ижевск'
           ,130
           ,1001)
GO

INSERT INTO [dbo].[Salespeople]
           ([snum]
           ,[sname]
           ,[city]
           ,[comm])
     VALUES
           (1005
           ,'Антон'
           ,'Ижевск'
           ,0.11)
GO

UPDATE [dbo].[Salespeople]
   SET [comm] = 0.17
 WHERE sname = 'Антон'
GO

UPDATE [dbo].[Customers]
   SET [rating] = rating + 150
 WHERE rating < 150
GO

UPDATE [dbo].[Customers]
   SET [rating] = rating * 2
GO

DELETE FROM [dbo].[Customers]
      WHERE cname = 'Веточкин'
GO







