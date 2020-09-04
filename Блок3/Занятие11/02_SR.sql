select * from sys.objects where schema_id = 1
select * from sys.objects where schema_id = 2

declare @query nvarchar(max);

declare TranfserTable cursor
	for
	select
		name
	from sys.objects where schema_id = 1 and type_desc = 'USER_TABLE'

open TranfserTable
declare @tbl_name varchar(max)
fetch next from TranfserTable into @tbl_name
while (@@fetch_status = 0)
begin
	set @query = 'alter schema guest transfer dbo.' + @tbl_name
	exec sp_executesql @query
	fetch next from TranfserTable into @tbl_name
end
close TranfserTable
deallocate TranfserTable

select * from sys.objects where schema_id = 1
select * from sys.objects where schema_id = 2

declare TranfserTable cursor
	for
	select
		name
	from sys.objects where schema_id = 2 and type_desc = 'USER_TABLE'
open TranfserTable
fetch next from TranfserTable into @tbl_name
while (@@fetch_status = 0)
begin
	set @query = 'alter schema dbo transfer guest.' + @tbl_name
	exec sp_executesql @query
	fetch next from TranfserTable into @tbl_name
end
close TranfserTable
deallocate TranfserTable

select * from sys.objects where schema_id = 1
select * from sys.objects where schema_id = 2