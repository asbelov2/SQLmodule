USE Chep_LabstudyNew

create index idx_cnum
on Orders(cnum)

exec sp_helpindex Orders

create index idx_snum
on Orders(snum)

exec sp_helpindex Orders

SET STATISTICS IO ON
SELECT * FROM Orders

SET STATISTICS IO OFF
SELECT * FROM Orders

DBCC SHOWCONTIG ('Orders')
--0.00%

drop index Orders.idx_cnum
drop index Orders.idx_snum