USE Chep_LabstudyNew
GO

SELECT *
  FROM Customers as C1
  CROSS JOIN Customers as C2
  where C1.snum=C2.snum and C1.cname>C2.cname
GO

UPDATE [dbo].[Salespeople]
   SET [comm] = comm - comm*0.1 -- = comm * 0.9
 WHERE city = 'Èæåâñê'

USE Chep_LabstudyNew
GO

SELECT C.cnum,C.cname
INTO C2
FROM Customers as C

select cnum, onum, sum(amt) as Summa
	from Orders 
	group by rollup (cnum, onum)
	having sum(amt) > 150 
	order by cnum 

select cnum, onum, sum(amt) as Summa
	from Orders 
	group by cube (cnum, onum)
	having sum(amt) > 150 
	order by cnum

select cnum, grouping(cnum), onum, grouping(Onum), sum(amt)
	from Orders 
	group by rollup (cnum, onum)
	having sum(amt) > 150 
		order by cnum 