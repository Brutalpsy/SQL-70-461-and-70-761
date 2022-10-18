-- Add a manager to Employee 
BEGIN TRAN
ALTER TABLE Employee
ADD Manager INT
GO
UPDATE Employee
SET Manager =  ((EmployeeNumber-123)/10)+123
WHERE EmployeeNumber > 123

-- Show Employee's Manager Name
-- USING SUB QUERY
SELECT *, (SELECT (EmployeeFirstName + ' ' + EmployeeLastName) AS ManagerName FROM Employee as EE WHERE E.Manager = EE.EmployeeNumber) AS ManagerName FROM Employee as E

-- USING A SELF JOIN
SELECT E.*, (M.EmployeeFirstName + ' ' + M.EmployeeLastName) AS ManagerName FROM Employee AS E
LEFT JOIN Employee AS M ON E.Manager = M.EmployeeNumber
ROLLBACK TRAN