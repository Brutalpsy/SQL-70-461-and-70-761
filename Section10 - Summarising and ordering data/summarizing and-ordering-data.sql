-- Get the number of people born by the year
SELECT YEAR(DateOfBirth) AS 'Year of Birth', COUNT(*) AS 'Number of People' FROM Employee
GROUP BY YEAR(DateOfBirth)
ORDER BY 'Year of Birth' ASC

-- Get number of employees with a starting letter
SELECT SUBSTRING(EmployeeLastName,1,1) AS 'Employees starting letter', COUNT(*) as Number FROM Employee
GROUP BY SUBSTRING(EmployeeLastName,1,1)
ORDER BY 'Employees starting letter' ASC

-- Get top 5 number of starting letters of employees
SELECT TOP (5) LEFT(EmployeeLastName,1), 
			   COUNT(*) AS Number
FROM Employee
WHERE DateOfBirth > '19010101'
GROUP BY LEFT(EmployeeLastName,1)
HAVING COUNT(*) > 5
ORDER BY Number DESC

--UPDATE all of the date of employee table
UPDATE Employee
SET EmployeeMiddleName = NULL
WHERE EmployeeMiddleName = ''

-- Get number of emplyees month of birth and number of employees with and without middle name 
-- #1
SELECT DATENAME(MONTH,DateOfBirth) AS 'Month of Birth',
	   COUNT(*) AS Number,
	   COUNT(EmployeeMiddleName) AS numberOfMiddleName,
	   COUNT(case when EmployeeMiddleName = '' OR EmployeeMiddleName is null 
					   then 1 
					   else null
		     end) AS withoutMiddleName
FROM Employee
GROUP BY DATENAME(MONTH,DateOfBirth),
	     MONTH(DateOfBirth)
ORDER BY MONTH(DateOfBirth) ASC

-- Get number of emplyees month of birth and number of employees with and without middle name
-- #2
SELECT DATENAME(MONTH,DateOfBirth) AS 'Month of Birth',
	   COUNT(*) AS Number,
	   COUNT(EmployeeMiddleName) AS numberOfMiddleName,
	   COUNT(*) - COUNT(EmployeeMiddleName) AS withoutMiddleName
FROM Employee
GROUP BY DATENAME(MONTH,DateOfBirth),
		 MONTH(DateOfBirth)
ORDER BY MONTH(DateOfBirth) ASC

-- Get earliest and oldest date of birth by month of birth
SELECT DATENAME(MONTH,DateOfBirth) AS 'Month of Birth',
	   COUNT(*) AS Number,
	   COUNT(EmployeeMiddleName) AS numberOfMiddleName,
	   COUNT(*) - COUNT(EmployeeMiddleName) AS withoutMiddleName,
	   MAX(DateOfBirth) AS 'Earliest Date Of Birth',
	   MIN(DateOfBirth) AS 'Oldest Date Of Birth' FROM Employee
GROUP BY DATENAME(MONTH,DateOfBirth),
		 MONTH(DateOfBirth)
ORDER BY MONTH(DateOfBirth) ASC

-- Get earliest and oldest date of birth by month of birth
-- with different date format
SELECT DATENAME(MONTH,DateOfBirth) AS 'Month of Birth',
	   COUNT(*) AS Number,
	   COUNT(EmployeeMiddleName) AS numberOfMiddleName,
	   COUNT(*) - COUNT(EmployeeMiddleName) AS withoutMiddleName,
	   FORMAT(MAX(DateOfBirth),'dd-MM-yyyy') AS 'Earliest Date Of Birth',
	   FORMAT(MIN(DateOfBirth),'D') AS 'Oldest Date Of Birth' FROM Employee
GROUP BY DATENAME(MONTH,DateOfBirth),
		 MONTH(DateOfBirth)
ORDER BY MONTH(DateOfBirth) ASC



