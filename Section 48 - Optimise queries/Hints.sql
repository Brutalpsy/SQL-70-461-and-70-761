-- PASTE this query to another query window
-- and execute it

BEGIN TRAN
UPDATE tblEmployee
SET Department = 'Commercial'
WHERE EmployeeNumber = 130


--ROLLBACK TRAN

----------------------
-- Trying to run this query without WITH (NOLOCK), you wont get any results from the query
-- because the query is still not commited, still running
-- so the table is locked
-- if you use WITH (NOLOCK) on the table which you want data to be uncommited, you would get the data results
----
-- If we had huge system and there were alot of modification of the rows, there would be 
-- delay of retrival of data, since the tables would be locked
-- so it's necessary to introduce dirty reads -> WITH (NOLOCK)

SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  WITH (NOLOCK) -- EQUIVALENT OF READUNCOMMITTED
LEFT JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'



-- you can apply multiple hints, you can do that too
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  WITH (REPEATABLEREAD, FORCESEEK)
LEFT JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'


-- or you can apply hints in the joins 
-- like HASH JOIN
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  
LEFT HASH JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'

-- MERGE JOIN
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  
LEFT MERGE JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'

-- LOOP JOIN
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  
LEFT LOOP JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'


-- or without specifying and letting sql determine the type of join
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E  
LEFT JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'




