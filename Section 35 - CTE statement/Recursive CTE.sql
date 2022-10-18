-- RECURSIVE CTE
BEGIN TRANSACTION
ALTER TABLE Employee
ADD Manager INT
GO
UPDATE Employee
SET Manager =  ((EmployeeNumber-123)/10)+123
WHERE EmployeeNumber > 123;
with myTable AS 
( SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName, 0 AS BossLevel --Anchor/ A Base
FROM Employee 
WHERE Manager IS NULL
UNION ALL --UNION ALL!!
SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, myTable.BossLevel + 1 -- Recursive part
FROM Employee as E
INNER JOIN myTable on E.Manager = myTable.EmployeeNumber
)
SELECT * FROM myTable
ROLLBACK TRANSACTION


