
SELECT A.EmployeeNumber,
A.AttendanceMonth,
NTILE(10) OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber, A.AttendanceMonth ) AS TheRowNumber
FROM Employee AS E
INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber
WHERE A.AttendanceMonth < '2015-01-01'