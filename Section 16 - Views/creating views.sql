/*
 WHY SHOULD YOU CREATE VIEWS:
		- GET RID OF ROWS THAT YOU DON'T WANT PEOPLE TO SEE
		- GET RID OF COLUMNS THAT YOU DON'T WANT PEOPLE TO SEE
		- THAY CAN SUMMARISE / AGGREGADE DATA
		- REDUCE COMPLEXITY
*/

SELECT 1

GO -- ^ IF THERE IS MUTIPLE STATEMENTS, VIEWS NEEDS TO BE SEPARATED BY BATCHES

CREATE VIEW ViewByDepartment AS
SELECT D.Department, ET.EmployeeNumber, ET.DateOfTransaction, ET.Amount AS TotalAmount
FROM Department AS D
INNER JOIN Employee AS E
ON D.Department = E.Department
LEFT JOIN EmployeeTransaction AS ET
ON E.EmployeeNumber = ET.EmployeeNumber
WHERE ET.EmployeeNumber BETWEEN 120 AND 139

GO -- DEFINES END OF A BATCH

CREATE VIEW ViewSummary AS 
SELECT D.Department, ET.EmployeeNumber AS EmpNum, SUM(ET.Amount) AS TotalAmount
FROM Department AS D
LEFT JOIN Employee AS E
ON D.Department = E.Department
LEFT JOIN EmployeeTransaction AS ET
ON E.EmployeeNumber = ET.EmployeeNumber
GROUP BY D.Department, ET.EmployeeNumber

GO

SELECT * FROM ViewByDepartment
SELECT * FROM ViewSummary