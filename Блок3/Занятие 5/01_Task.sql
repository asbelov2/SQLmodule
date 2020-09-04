alter table Customers
add constraint d_rating default 100 for rating

insert Customers
(cnum, cname, city, snum)
values
(2012, 'Деточкин', 'Ижевск', 1001)
select * from Customers
where cnum=2012

alter table Salespeople
add constraint d_city default 'Ижевск' for city

insert Salespeople
(snum, sname, comm)
values
(1013, 'Кочкин', 0.3)
select * from Salespeople
where snum=1013

alter table Salespeople
add constraint ch_comm check (comm > 0)

update Salespeople
set comm = -0.13
where snum = 1001

alter table Orders
add constraint ch_amt check (amt > 0)

update Orders
set amt = -0.13
where onum = 3001

alter table Customers
add constraint pk_cust_cnum primary key clustered (cnum)

alter table Salespeople
add constraint pk_sale_cnum primary key clustered (snum)

alter table Orders
add constraint pk_ord_cnum primary key clustered (onum)

exec sp_helpconstraint Customers
exec sp_help pk_cust_cnum

alter table Salespeople
nocheck constraint ch_comm

update Salespeople
set comm = -0.13
where snum = 1001

alter table Salespeople
check constraint ch_comm

update Salespeople
set comm = 0.12
where snum = 1001