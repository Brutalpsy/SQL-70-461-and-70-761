SET STATISTICS IO ON -- queries take a bit longer to execute
GO

-- we get a disk statistics in the Messages window
-- we get number of scans(seek or scans, started at a leaf level), 
-- logical reads (number of pages(8000 bytes), number of pages read from data cache)
-- physical reads (how often is gone to the disc), in this case 0, because it's already got everything temporaly in the data (logical reads)
-- read-ahead-reads transfering pages from disc to the cache
-- remainder are about large object blocks (text, ntext,image, varchar(max), varbinary(max), nvarchar(max))

SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  
LEFT LOOP JOIN tblDepartment AS D --Warning: The join order has been enforced because a local join hint is used.
ON E.Department = D.Department
WHERE d.Department = 'HR'

SET STATISTICS IO OFF 