USE AdventureWorksLT2016

select CompanyName from SalesLT.Customer as C
join SalesLT.CustomerAddress as CA on C.CustomerID = CA.CustomerID
join SalesLT.Address as A on A.AddressID = CA.AddressID
where A.City = 'Toronto'

select P.Name, OrderQty from SalesLT.SalesOrderDetail as SOD
left join SalesLT.Product as P on P.ProductID = SOD.ProductID
where UnitPrice > 1000

select (select CompanyName from SalesLT.Customer as C where C.CustomerID = SOH.CustomerID) as Company, SUM(SOH.TotalDue) as SalesSum from SalesLT.SalesOrderHeader as SOH
where SOH.TotalDue > 50000
group by CustomerID

select (select CompanyName from SalesLT.Customer as C where C.CustomerID = SOH.CustomerID) as Company from SalesLT.SalesOrderDetail as SOD
left join SalesLT.SalesOrderHeader as SOH on SOD.SalesOrderID = SOH.SalesOrderID
left join SalesLT.Product as P on SOD.ProductID=P.ProductID
left join SalesLT.ProductModel as PM on P.ProductModelID = PM.ProductModelID 
where PM.Name = 'Racing Socks'

select top 25 * from SalesLT.SalesOrderDetail as SOD
order by LineTotal
desc

select '0..99' as range, sum(OrderQty) as Qty, sum(LineTotal) as Total from SalesLT.SalesOrderDetail as SOD where SOD.LineTotal between 0 and 100
union
select '100..999' as range, sum(OrderQty), sum(LineTotal) from SalesLT.SalesOrderDetail as SOD where SOD.LineTotal between 100 and 1000
union
select '1000..9999' as range, sum(OrderQty), sum(LineTotal) from SalesLT.SalesOrderDetail as SOD where SOD.LineTotal between 1000 and 10000
union
select 'more 10000' as range, sum(OrderQty), sum(LineTotal) from SalesLT.SalesOrderDetail as SOD where SOD.LineTotal > 10000

select CompanyName from SalesLT.Customer
where (CompanyName like '%bike%' or CompanyName like '%cycle%')
order by case
	when CompanyName like '%bike%' then 1
	when CompanyName like '%cycle%' then 2
	else 3
end


select top 10 City, sum(SOH.TotalDue) as SummaryByCity from SalesLT.SalesOrderHeader as SOH 
left join SalesLT.Customer as C on C.CustomerID = SOH.CustomerID
left join SalesLT.CustomerAddress as CA on C.CustomerID = CA.CustomerID
left join SalesLT.Address as A on A.AddressID = CA.AddressID
group by City
order by sum(SOH.TotalDue)
desc