select * from Salespeople
-- Executing

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

select * from Salespeople with (nolock)