SELECT *
INTO tblTransactionBig
FROM tblTransaction

INSERT INTO tblTransactionBig ([Amount],[DateOfTransaction],[EmployeeNumber])
SELECT T1.Amount, T1.DateOfTransaction, 1
FROM tblTransaction AS T1
CROSS JOIN (SELECT * FROM tblTransaction WHERE EmployeeNumber < 200 ) AS T2

CREATE NONCLUSTERED INDEX idx_tblTransactionBig on tblTransactionBig(EmployeeNumber)

GO

CREATE PROC procTransactionBig(@EmployeeNumber as int)
AS
SELECT *
FROM tblTransactionBig AS T
LEFT JOIN tblEmployee AS E
ON T.EmployeeNumber = E.EmployeeNumber
WHERE T.EmployeeNumber = @EmployeeNumber


SELECT *
FROM tblTransactionBig AS T
LEFT JOIN tblEmployee AS E
ON T.EmployeeNumber = E.EmployeeNumber
WHERE T.EmployeeNumber = 1

EXEC procTransactionBig 1
-------------------------------------------
-- once you create procedure, once you run it for the first time
-- it creates a plan guide which it then uses for each subsequent time
-- so in this case it uses SCAN to scan all of the Transactions (all 1 milion rows)
-- where instead it should use SEEK, since it has only 5 other records which are indexed
EXEC procTransactionBig 132

-- check this query and it's execution time
SELECT *
FROM tblTransactionBig AS T
LEFT JOIN tblEmployee AS E
ON T.EmployeeNumber = E.EmployeeNumber
WHERE T.EmployeeNumber = 132

-------------------------------------------------------------------------------------------
DROP PROC procTransactionBig
GO

-- WITH RECOMPILE means that every time you run this procedure
-- you are going to create new query plan, new plan guide

CREATE PROC procTransactionBig(@EmployeeNumber as int) WITH RECOMPILE
AS
SELECT *
FROM tblTransactionBig AS T
LEFT JOIN tblEmployee AS E
ON T.EmployeeNumber = E.EmployeeNumber
WHERE T.EmployeeNumber = @EmployeeNumber


EXEC procTransactionBig 1 -- uses scan
EXEC procTransactionBig 132 -- uses index seek (with RID(row indentifier) that way index corelate with the heap, merge them together with tblEmployee) 


