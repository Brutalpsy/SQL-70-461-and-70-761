SET SHOWPLAN_ALL ON
GO
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  
LEFT JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'

SET SHOWPLAN_ALL OFF


-- shift + alt + s => include Client Statistics (how many trials, query profile , network and time statisctis)
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  
LEFT JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'


-- we can also use statistics time on 
-- SQL Server parse and compile time: (CPU time = 0 ms, elapsed time = 2 ms)
-- SQL Server Execution Times: (CPU time = 0 ms,  elapsed time = 0 ms)
SET STATISTICS TIME ON
GO
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  
LEFT JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'
SET STATISTICS TIME OFF



-- INPUT / OUTPUT 
SET STATISTICS IO ON
GO
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  
LEFT JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'
SET STATISTICS IO OFF