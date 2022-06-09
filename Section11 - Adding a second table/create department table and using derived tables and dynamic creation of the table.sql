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