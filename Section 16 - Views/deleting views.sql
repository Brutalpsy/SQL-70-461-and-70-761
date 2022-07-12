SELECT * FROM ViewByDepartment

-- is not updatable because the modification affects multiple base tables
DELETE FROM ViewByDepartment
WHERE TotalAmount = 333.30 AND EmployeeNumber = 132

GO
CREATE VIEW ViewSimple
AS 
SELECT * FROM EmployeeTransaction
GO

SELECT * FROM ViewSimple

-- DELETE WORKS FROM THE VIEW WHEN THERE IS NO MULTIPLE TABLES CONNECTED TO THE VIEW
BEGIN TRAN
DELETE FROM ViewSimple
OUTPUT deleted.*
WHERE EmployeeNumber = 132
ROLLBACK TRAN