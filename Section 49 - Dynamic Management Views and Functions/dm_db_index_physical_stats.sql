-- WAY TO GET INDEX STATISTICS
SELECT * FROM sys.dm_db_index_physical_stats(DB_ID('70-461S7'),OBJECT_ID('tblEmployee'),NULL,NULL,'DETAILED')

-- YOU CAN USE NULLS TO GET ALL INFORMATION
SELECT * FROM sys.dm_db_index_physical_stats(DB_ID('70-461S7'), NULL, NULL,NULL,'DETAILED')
