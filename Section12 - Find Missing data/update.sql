SELECT *
FROM Employee
WHERE EmployeeNumber = 194

SELECT *
FROM EmployeeTransaction
WHERE EmployeeNumber BETWEEN 3 AND 9

BEGIN TRAN

-- Move all transactions from employee number 194 to employee number 3 WITHOUT OUTPUT DATA
UPDATE EmployeeTransaction
SET EmployeeNumber = 194
OUTPUT inserted.*,deleted.* -- inserted.EmployeeNumber, deleted.EmployeeNumber
WHERE EmployeeNumber = 3

ROLLBACK TRAN
