-- CREATE A HUGE TABLE
-- 6250000 rows (2500 x 2500)
SELECT T.*
INTO tblTransactionBigger
FROM tblTransaction  AS T
CROSS JOIN tblTransaction AS T2

-- WHEN RUNNING WITH Executing plan (CTRL + M)
-- it states : The Query Processor estimates that implementing the following index could improve the query cost by 99.9249%.
/*
USE [70-461S7]
GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [dbo].[tblTransactionBigger] ([EmployeeNumber])
INCLUDE ([Amount],[DateOfTransaction])
GO
*/
SELECT * FROM tblTransactionBigger
WHERE EmployeeNumber = 127


-- FIND ALL MISSING INDEXES FOR CURRENT DATABASE
SELECT * FROM sys.dm_db_missing_index_details
WHERE database_id = DB_ID()


-- FIND ALL MISSING INDEXES, SAME AS THE UPPER ONE, BUT PRESENTED BETTER, IN A DIFFERENT WAY
SELECT MIG.*, statement AS [Table Name], column_id, column_name, column_usage
FROM sys.dm_db_missing_index_details AS MID
CROSS APPLY sys.dm_db_missing_index_columns(MID.index_handle)
INNER JOIN sys.dm_db_missing_index_groups AS MIG ON MIG.index_handle = mid.index_handle
WHERE database_id = DB_ID()
ORDER BY column_id
