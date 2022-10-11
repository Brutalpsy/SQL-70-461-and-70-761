
-- SHOWCASE OF ROLLUP _> UNIONING GROUP BY FIELDS, FIRST BY ALL THREE FIELDS, THAN BY TWO(E.Department, A.EmployeeNumber),THAN BY ONE AND THAN BY NONE OF THEM
-- WHICH IS CONTINUATION OF 'Adding totals.sql'
-- INSTEAD OF WRITING HUGE UNITON FOR SUMMATION - WE CAN USE ROLLUP
SELECT E.Department, A.EmployeeNumber, A.AttendanceMonth, SUM(A.NumberAttendance),
GROUPING( A.EmployeeNumber) AS EmployeeNumberGroupedBy, -- SHOW IF IT'S GROUPED BY CERTAIN FIELD
GROUPING_ID ( E.Department, A.EmployeeNumber,A.AttendanceMonth) AS EmployeeNumberGroupedID -- SAME AS GROUPING BUT CAN TAKE MULTIPLE PARAMETERS // SHOWING BINARY RESULT // 1 + 2 + 4
FROM Employee AS E 
INNER JOIN Attendance AS A
ON A.EmployeeNumber = E.EmployeeNumber
GROUP BY ROLLUP(E.Department, A.EmployeeNumber,A.AttendanceMonth)
ORDER BY E.Department, A.EmployeeNumber,A.AttendanceMonth