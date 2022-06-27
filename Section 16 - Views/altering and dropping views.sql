USE [70-461]
GO

-- SELECT * FROM sys.tables
-- IF EXISTS(SELECT * FROM sys.views WHERE name = 'ViewByDepartment')
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

GO


