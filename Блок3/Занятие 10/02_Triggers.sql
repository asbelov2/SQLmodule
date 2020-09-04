USE Chep_LabstudyNew

GO
CREATE TRIGGER Upd_cnum ON Customers
FOR UPDATE
AS
   declare @NumRow int
   set @NumRow = @@rowcount
   if Update(cnum) 
      begin
      if @NumRow=1
         update Orders
            set Orders.cnum=inserted.cnum
            from Orders, inserted, deleted
            where Orders.cnum=deleted.cnum 
      else
         rollback
      end

GO
CREATE TRIGGER upd_snum ON Salespeople
FOR UPDATE
AS
   declare @NumRow int
   set @NumRow = @@rowcount
   if Update(snum) 
      begin
      if @NumRow>1
         rollback
      else
         if exists(select * 
                   from deleted d 
                   join Customers c 
                   on d.snum=c.snum) or 
            exists(select * 
                   from deleted d 
                   join Orders o 
                   on d.snum=o.snum)
            rollback
      end

GO
create trigger in_documents
on Documents
for insert
as
update o
  set ocamt = isnull(ocamt,0) + (select isnull(sum(dcamt),0) from inserted i where i.onum = o.onum),
      osamt = isnull(osamt,0) + (select isnull(sum(dsamt),0) from inserted i where i.onum = o.onum)
FROM Orders o 
WHERE o.onum IN (SELECT DISTINCT onum FROM inserted)

GO
create trigger out_documents
on Documents
for delete
as
update o
  set ocamt = isnull(ocamt,0) - (select isnull(sum(dcamt),0) from deleted d where d.onum = o.onum),
      osamt = isnull(osamt,0) - (select isnull(sum(dsamt),0) from deleted d where d.onum = o.onum)
FROM Orders o 
WHERE o.onum IN (SELECT DISTINCT onum FROM deleted)