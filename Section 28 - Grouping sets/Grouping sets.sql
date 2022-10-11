-- SHOWCASE OF CUBE => GROUP BY EACH AND ONE OF THOSE FILDS, ALL COMBINATIONS. 
SELECT E.Department, A.EmployeeNumber, A.AttendanceMonth, SUM(A.NumberAttendance) AS NumberAttendance,
GROUPING( A.EmployeeNumber) AS EmployeeNumberGroupedBy, -- SHOW IF IT'S GROUPED BY CERTAIN FIELD
GROUPING_ID ( E.Department, A.EmployeeNumber,A.AttendanceMonth) AS EmployeeNumberGroupedID -- SAME AS GROUPING BUT CAN TAKE MULTIPLE PARAMETERS // SHOWING BINARY RESULT // 1 + 2 + 4
FROM Employee AS E 
INNER JOIN Attendance AS A
ON A.EmployeeNumber = E.EmployeeNumber
GROUP BY CUBE(E.Department, A.EmployeeNumber,A.AttendanceMonth)
ORDER BY E.Department, A.EmployeeNumber,A.AttendanceMonth


-- SHOWCASE OF GROUPING SETS
SELECT E.Department, A.EmployeeNumber, A.AttendanceMonth, SUM(A.NumberAttendance) AS NumberAttendance,
GROUPING( A.EmployeeNumber) AS EmployeeNumberGroupedBy, -- SHOW IF IT'S GROUPED BY CERTAIN FIELD
GROUPING_ID ( E.Department, A.EmployeeNumber,A.AttendanceMonth) AS EmployeeNumberGroupedID -- SAME AS GROUPING BUT CAN TAKE MULTIPLE PARAMETERS // SHOWING BINARY RESULT // 1 + 2 + 4
FROM Employee AS E 
INNER JOIN Attendance AS A
ON A.EmployeeNumber = E.EmployeeNumber
--GROUP BY GROUPING SETS((E.Department, A.EmployeeNumber,A.AttendanceMonth),(E.Department)) -- IF WE WANT TO GROUP BY DEPARTME
--GROUP BY GROUPING SETS((E.Department, A.EmployeeNumber,A.AttendanceMonth),(E.Department),()) -- DEPARTMENT AND GRAND TOTAL
GROUP BY GROUPING SETS((E.Department, A.EmployeeNumber,A.AttendanceMonth),(E.Department),()) -- DEPARTMENT AND GRAND TOTAL
ORDER BY /*CASE WHEN E.Department IS NULL THEN 1 ELSE 0 END*/ -- IF WE WANT TO ORDER BY WITH CASE WHEN, OTHERWISE WE CAN USE COALISE OR COALESCE OR DESC
E.Department, A.EmployeeNumber,A.AttendanceMonth 