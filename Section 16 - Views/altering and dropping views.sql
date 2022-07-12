USE [70-461]
GO

-- SELECT * FROM sys.tables
-- IF EXISTS(SELECT * FROM sys.views WHERE name = 'ViewByDepartment')
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo')
	DROP VIEW [dbo].[ViewByDepartment]
GO
-- YOU CAN USE ALTER TO CHANGE A VIEW
CREATE VIEW [dbo].[ViewByDepartment] WITH SCHEMABINDING AS -- ADDED WITH SCHEMABINDING
SELECT D.Department, ET.EmployeeNumber, ET.DateOfTransaction, ET.Amount AS TotalAmount
FROM dbo.Department AS D
INNER JOIN dbo.Employee AS E -- CHANGED LEFT TO INNER
ON D.Department = E.Department
INNER JOIN dbo.EmployeeTransaction AS ET -- CHANGED LEFT TO INNER
ON E.EmployeeNumber = ET.EmployeeNumber
WHERE ET.EmployeeNumber BETWEEN 120 AND 139

GO
--CREATE INDEX ON VIEW
CREATE UNIQUE CLUSTERED INDEX inx_ViewByDepartment ON [dbo].[ViewByDepartment] (EmployeeNumber,Department, DateOfTransaction)

BEGIN TRAN


