-- LAG lags one preceding row
-- LEAD leads one following row
-- Both of those when next/previous value is not existant -> returns NULL
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
LAG(A.NumberAttendance) OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS LAG,
LEAD (A.NumberAttendance) OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth ) AS LEAD
FROM Employee AS E INNER JOIN Attendance AS A  
ON E.EmployeeNumber = A.EmployeeNumber


-- BUT YOU CAN SET OFFSET FOR LEAD/LAG, WHICH IS THE SECOND PARAMETER
-- DEFAULT IS 1
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
LAG(A.NumberAttendance, 3) OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS LAG,
LEAD (A.NumberAttendance, 3) OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth ) AS LEAD
FROM Employee AS E INNER JOIN Attendance AS A  
ON E.EmployeeNumber = A.EmployeeNumber


-- THIRD PARAMETER IS DEFAULT VALUE TO SHOW INSTEAD OF NULLS

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
LAG(A.NumberAttendance, 3, 0) OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS LAG,
LEAD (A.NumberAttendance, 3, 0) OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth ) AS LEAD
FROM Employee AS E INNER JOIN Attendance AS A  
ON E.EmployeeNumber = A.EmployeeNumber


-- PRACTICAL EXAMPLE FOR LAG AND LEAD
-- SHOWING THE DIFFERENCE BETWEEN CURRENT AND PREVIOUS MONTH

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
LAG(A.NumberAttendance, 1) OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS LAG,
LEAD (A.NumberAttendance, 1) OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth ) AS LEAD,
A.NumberAttendance - LAG(A.NumberAttendance, 1) OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS 'LAST MONTH DIFFERENCE'
FROM Employee AS E INNER JOIN Attendance AS A  
ON E.EmployeeNumber = A.EmployeeNumber