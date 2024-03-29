SELECT E.Department,E.EmployeeFirstName,E.EmployeeLastName, A.* FROM Employee AS E
INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber


-- GET EMPLOYEE ATTENDANCE BY YEAR
SELECT A.EmployeeNumber, YEAR(A.AttendanceMonth) as Year, SUM(A.NumberAttendance) AS TotalAttendance FROM Employee AS E
INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY A.EmployeeNumber, YEAR(A.AttendanceMonth)
ORDER BY A.EmployeeNumber, Year


-- GET THE PERCENTAGE OF ATTENDANCE BY EACH MONTH OF ALL EMPLOYEES
SELECT A.EmployeeNumber,
 A.AttendanceMonth,
 A.NumberAttendance,
 CONVERT(DECIMAL(18,7),A.NumberAttendance) / SUM(A.NumberAttendance) over() * 100 AS Percentage, --OVER() TAKES RANGE OF ROWS AND IT DOES THE CALCULATION - IN THIS CASE SUM BASED PM THAT NUMBER																					 
 SUM(A.NumberAttendance) over() as TotalAttendance												 --OVER THOSE ROWS
 FROM Employee AS E
INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber

select SUM(NumberAttendance) from Attendance --35409