-- Nested loop
-- takes a look at smaller table and than reinterates the larger table based on smaller table results
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee AS E
LEFT JOIN tblDepartment AS D
ON E.Department = D.Department
WHERE d.Department = 'HR'

-- Hash match, but we can reduce the time it takes by just getting certain columns, but it's still a hash match
-- two medium size tables, they are not eligible for a nested loops because neither of those tables are small
-- and not eligible for a merge join because they don't have any indexes
SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber

-- find duplicates
SELECT EmployeeNumber, COUNT(*) 
FROM tblEmployee
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1

-- DELETE EXTRA ROW SO WE CAN CREATE UNIQUE CLUSTERED INDEX
SELECT * FROM tblEmployee WHERE EmployeeNumber=131
DELETE FROM tblEmployee WHERE EmployeeNumber=131 AND DateOfBirth = '1971-12-24'

-- Equivalent to a primary key, excpet its just missing one attribute - enforcement of the key (missing a key), it's got an index but not a key
CREATE UNIQUE CLUSTERED INDEX inx_tblEmployee ON tblEmployee (EmployeeNumber)
CREATE UNIQUE CLUSTERED INDEX inx_tblTransaction ON tblTransaction (EmployeeNumber, DateOfTransaction, Amount) -- Not good unique columns

-- Now if we execute this previous query which were a Hash match
-- now it's using a Merge Join, because it's using a index scan to index scan, both of those can now be merged
-- Cost of exuting is down from 74% to 40%, much more efficient
SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber

-- LETS COMPARE INDEXED AND NON INDEXED TABLES

-- Create new two tables without an index
SELECT * INTO tblTransactionNoIndex FROM tblTransaction
SELECT * INTO tblEmployeeNoIndex FROM tblEmployee
-------------------------------------------------------------
-- #1 Merge join
-- Query cost : 30%
SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber

-- #2 Hash match
-- Query cost : 70%
SELECT * FROM tblEmployeeNoIndex as E
LEFT JOIN tblTransactionNoIndex AS T
ON E.EmployeeNumber = T.EmployeeNumber

