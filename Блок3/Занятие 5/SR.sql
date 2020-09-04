USE Chep_LabstudyNew
CREATE TABLE Test
(
    Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(30) NOT NULL,
	Adress NVARCHAR(60) UNIQUE NULL
);

insert Test
(Name)
values
('Кочкин'),
('Кичкин')
select * from Test
--Violation of UNIQUE KEY constraint 'UQ__Test__08F62FE54C32663A'. Cannot insert duplicate key in object 'dbo.Test'. The duplicate key value is (<NULL>).

alter table Orders
add constraint fk_ord_cnum foreign key (cnum) REFERENCES Customers(cnum)

alter table Orders
drop fk_ord_cnum
alter table Orders
add constraint fk_ord_cnum foreign key (cnum) REFERENCES Customers(cnum) ON DELETE CASCADE

drop table Customers 
--Could not drop object 'Customers' because it is referenced by a FOREIGN KEY constraint.
