SELECT Department, count(*) as Number
FROM Employee
GROUP BY Department

--DERIVED TABLE LIVES IN THE FROM CLAUSE
SELECT Count(Department) as NumberOfDepartments
FROM 
(SELECT Department, count(*) as NumberPerDepartment
 FROM Employee
 GROUP BY Department
) AS newTable

-- CREATE TABLE DEPARTMENT
-- INTO KEYWORD GOES BETWEEN SELECT AND FROM
SELECT DISTINCT Department, CONVERT(NVARCHAR(20),N'') as DepartmentHead
INTO Department
FROM Employee

SELECT * 
FROM Department


-- Connect all three tables
SELECT *
FROM Department
LEFT JOIN Employee
ON Department.Department = Employee.Department
LEFT JOIN EmployeeTransaction
ON Employee.EmployeeNumber = EmployeeTransaction.EmployeeNumber

-- Get amount per department
SELECT Department.Department, Sum(Amount) AS SumOfAmount
FROM Department
LEFT JOIN Employee
ON Department.Department = Employee.Department
LEFT JOIN EmployeeTransaction
ON Employee.EmployeeNumber = EmployeeTransaction.EmployeeNumber
GROUP BY Department.Department

-- Get amount per department head
SELECT D.DepartmentHead, Sum(Amount) AS SumOfAmount
FROM Department AS D
LEFT JOIN Employee AS E
ON D.Department = E.Department
LEFT JOIN EmployeeTransaction AS ET
ON E.EmployeeNumber = ET.EmployeeNumber
GROUP BY D.DepartmentHead
ORDER BY D.DepartmentHead


INSERT INTO Department(Department,DepartmentHead)
VALUES('Accounts','James')

SELECT * 
FROM EmployeeTransaction
