BEGIN TRAN

-- is able to insert data into one table
INSERT INTO ViewByDepartment (EmployeeNumber, DateOfTransaction, TotalAmount)
VALUES (142,'20220101',999.99)

-- is not able to insert because the modification affects multiple base tables:
-- -> EmployeeTransaction
-- -> Department
--INSERT INTO ViewByDepartment(Department, EmployeeNumber,DateOfTransaction,TotalAmount)
--VALUES ('Customer Relations',132,'20220101',999.99)

SELECT * FROM ViewByDepartment
SELECT * FROM EmployeeTransaction where EmployeeNumber = 132

ROLLBACK TRAN

GO

BEGIN TRAN

--SELECT * FROM ViewByDepartment ORDER BY EmployeeNumber, DateOfTransaction
--SELECT * FROM EmployeeTransaction WHERE EmployeeNumber IN (132,142)

--UPDATING A VIEW
UPDATE ViewByDepartment
SET EmployeeNumber = 142
WHERE EmployeeNumber = 132

SELECT * FROM ViewByDepartment ORDER BY EmployeeNumber, DateOfTransaction
--SELECT * FROM EmployeeTransaction WHERE EmployeeNumber IN (132,142)
ROLLBACK TRAN


GO

-- USE OF WITH CHECK OPTION -- 
-- WITH CHECK OPTION prevents a view from updating or inserting rows that are not visible through it

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo')
	DROP VIEW [dbo].[ViewByDepartment]
GO
-- YOU CAN USE ALTER TO CHANGE A VIEW
CREATE VIEW [dbo].[ViewByDepartment] AS
SELECT D.Department, ET.EmployeeNumber, ET.DateOfTransaction, ET.Amount AS TotalAmount
FROM Department AS D
INNER JOIN Employee AS E
ON D.Department = E.Department
LEFT JOIN EmployeeTransaction AS ET
ON E.EmployeeNumber = ET.EmployeeNumber
WHERE ET.EmployeeNumber BETWEEN 120 AND 139
WITH CHECK OPTION -- THIS WILL DISABLE UPDATING A VIEW OUTSIDE OF CONSTRAINT(FROM WHERE CLAUSE)
GO
