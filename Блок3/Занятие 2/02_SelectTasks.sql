/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [cnum]
      ,[cname]
      ,[city]
      ,[rating]
      ,[snum]
  FROM [Chep_LabstudyNew].[dbo].[Customers]

select snum, sname, city, comm
from Salespeople

select *
from Salespeople

select sname,comm
from Salespeople

select cname,rating,city
from Customers

select snum
	from Orders

select DISTINCT snum
	from Orders

select DISTINCT cnum, snum
from Customers

select cname, city
	from Customers
	where city = 'Москва'

select cname, rating from Customers
where rating=300

select * from Orders
where amt > 2000

set dateformat dmy
select * from Orders
where odate = '23.10.1990'
union
select * from Customers
where (city='Москва') and (rating>200)

select * from Customers
where not((city='Москва') and (rating>200))

select *
	from Orders
	where not ((odate = '10.03.1990' and snum > 1002)
		or amt > 2000.00)

select * from Orders
where (not odate = '10.03.1990' or snum <= 1002) and amt <= 2000.00

-- 0.003 s
select * from Customers
where city = 'Таллин' or city = 'Ижевск'

-- 0.007 s
select * from Customers
where city in ('Таллин','Ижевск')

-- 0.003 s
select * from Salespeople
where comm >= 0.1 and comm <= 0.12

-- 0.003 s
select * from Salespeople
where comm between 0.1 and 0.12

select * from Customers
where city like '[М]%'

select * from Customers
where snum is null

set dateformat dmy
select sum(amt) from Orders
where odate < '05.10.1990'

select min(comm) from Salespeople

select avg(comm) from Salespeople

select count(*) from Customers
where rating < 200

select count(cnum) from Customers
where rating < 200

select distinct count(*) from Salespeople
where EXISTS(select 1 from Orders where Salespeople.snum = Orders.snum)

select max(amt) from Orders

select snum, max(amt) from Orders 
group by snum

select snum, odate, Max(amt) from Orders
group by snum, odate

select snum, odate, Max(amt)
	from Orders
group by snum, odate 
having Max(amt) > 1000

select Customers.cnum, Salespeople.snum, Customers.city
from Customers cross join Salespeople
where Customers.city = Salespeople.city

select cname,city from Customers
group by cname,city
having count(snum)>0

select sname as Name, comm as commCoef, comm*O.amt as CommSum, O.amt as Sum
from Salespeople as S
join Orders as O
on S.snum = O.snum

select Table1.cname, Table2.cname, Table1.rating
	from Customers Table1
JOIN Customers Table2
ON Table1.rating = Table2.rating
where Table1.cname>Table2.cname

select *
from Orders
where snum = (select snum
         		from Salespeople
          	where sname = 'Сергей')

select *
from Orders
where snum = 
(select DISTINCT snum
			from Orders
where cnum = 2001)

select * from Orders
where amt > (select avg(amt) from Orders)

set dateformat dmy
select * from Orders
where amt > 
(select AVG (amt)
			from Orders
where odate = '23.09.1990')

select * from Orders
where snum = (select snum from Salespeople where city in ('Ижевск','Томск') and Orders.snum = Salespeople.snum)

select * from Salespeople 
where EXISTS(select 1 from Customers where snum=Salespeople.snum)

-- Одинакого 24+36 reads

select * 
		from Salespeople s
		where (select COUNT(*)
			   from Customers c
			   where c.snum = s.snum) > 1

	select *
		from Salespeople s
		where Exists (select *
					from Customers c
					where c.snum = s.snum
						group by c.snum
						having COUNT(c.snum) > 1)

Declare @TableName char(11)
Set @TableName = 'Customers'
exec('select * from '+@TableName)
Set @TableName = 'Salespeople'
exec('select * from '+@TableName)