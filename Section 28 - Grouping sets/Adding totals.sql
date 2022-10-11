SELECT E.Department, A.EmployeeNumber, A.AttendanceMonth, SUM(A.NumberAttendance) /*, 0 AS IsNullValue  */
--SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)
FROM Employee AS E 
INNER JOIN Attendance AS A
ON A.EmployeeNumber = E.EmployeeNumber
GROUP BY E.Department, A.EmployeeNumber,A.AttendanceMonth
--ORDER BY Department, A.EmployeeNumber, AttendanceMonth -- CAN'T HAVE ORDER BY IN THE MIDDLE
UNION
SELECT E.Department, A.EmployeeNumber,NULL, SUM(A.NumberAttendance) /*, 1 as IsNullValue */-- IF WE WANT TO ORDER BY SUMMATION OF ATTENDANCE
FROM Employee AS E 
INNER JOIN Attendance AS A
ON A.EmployeeNumber = E.EmployeeNumber
GROUP BY E.Department, A.EmployeeNumber
--ORDER BY Department, A.EmployeeNumber /*, IsNullValue*/, A.AttendanceMonth --NULLS ARE THE SMALLES VALUE AND IN ASCENDING ORDER THEY WILL BE FIRST / DESCENDING - LAST
UNION 
SELECT E.Department, NULL,NULL, SUM(A.NumberAttendance) 
FROM Employee AS E 
INNER JOIN Attendance AS A
ON A.EmployeeNumber = E.EmployeeNumber
GROUP BY E.Department
--ORDER BY Department, A.EmployeeNumber,A.AttendanceMonth
UNION 
SELECT NULL, NULL,NULL, SUM(A.NumberAttendance) 
FROM Employee AS E 
INNER JOIN Attendance AS A
ON A.EmployeeNumber = E.EmployeeNumber
ORDER BY Department, A.EmployeeNumber,A.AttendanceMonth -- SINCE ITS ASCENDING ORDER -> NULLS WILL BE FIRST

--SELECT SUM(NumberAttendance) AS GRANDTOTAL FROM Attendance


