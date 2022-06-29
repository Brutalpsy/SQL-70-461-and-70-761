
-- WAYS TO FIND A VIEW ----------------------------
---------------------------------------------------
SELECT * FROM sys.syscomments
SELECT * FROM sys.views 

SELECT V.name, C.text FROM sys.syscomments AS C
INNER JOIN sys.views AS V 
ON V.object_id = C.id

SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.ViewByDepartment')) as ViewByDepartmentObjectDefinition

SELECT * FROM sys.sql_modules
---------------------------------------------------
-- TO SECURE A VIEW YOU NEED TO USE  -> "WITH ENCRYPTION" KEYWORD
-- BUT LATER ON YOU WON'T BE ABLE TO CHECK THE CODE OF THE PARTICULAR VIEW

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo')
	DROP VIEW [dbo].[ViewByDepartment]
GO
-- YOU CAN USE ALTER TO CHANGE A VIEW
CREATE VIEW [dbo].[ViewByDepartment] WITH ENCRYPTION AS
SELECT D.Department, ET.EmployeeNumber, ET.DateOfTransaction, ET.Amount AS TotalAmount
FROM Department AS D
INNER JOIN Employee AS E
ON D.Department = E.Department
LEFT JOIN EmployeeTransaction AS ET
ON E.EmployeeNumber = ET.EmployeeNumber
WHERE ET.EmployeeNumber BETWEEN 120 AND 139

GO