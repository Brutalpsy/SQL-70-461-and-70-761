-- Fire up the indexes, if your sql instace has be restared
-- so it shows up in the statistics logs
SELECT * FROM [dbo].[tblEmployee]
SELECT * FROM [dbo].[tblTransaction]
SELECT * FROM [dbo].[tblTransactionBig]

-------------------------------------------
-- With this you can see when the index is last used / that it is regularly used, it's supporting queries
-- every index that's being built, cumputer has to take time to make sure it's upto date,
-- if its not being used, why keep it? Meybe we should drop the index and same some processing times
-- It also shows how many seeks/lookups/scans are performed with that particular index

SELECT DB_NAME(database_id) AS [Database Name],
	   OBJECT_NAME(DDIUS.object_id) AS [Table Name],
	   I.name as [Index Name],
	   DDIUS.*
FROM sys.dm_db_index_usage_stats AS DDIUS
INNER JOIN sys.indexes AS I ON I.index_id = DDIUS.index_id AND i.object_id = DDIUS.object_id
WHERE database_id = DB_ID() -- get only the indexes for the current database that you are looking at