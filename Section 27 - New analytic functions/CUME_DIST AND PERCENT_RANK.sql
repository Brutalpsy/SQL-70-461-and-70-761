-- FROM 0 TO ONE DEVIDED BY THE NUMBER OF COLUMNS -> CUME_DIST
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
CUME_DIST() OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS CUMEDIST, -- STARTS FROM FIRST ONE
PERCENT_RANK () OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth ) AS PERCENTRANK -- SHIFTS SO IT SKIPS FIRST ONE AND LAST ONE
FROM Employee AS E INNER JOIN Attendance AS A  
ON E.EmployeeNumber = A.EmployeeNumber

-- WITH NumberAttendance
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
CUME_DIST() OVER (PARTITION BY E.EmployeeNumber ORDER BY A.NumberAttendance) /* *22 */  AS CUMEDIST,  -- TAKES HIHER PART 
PERCENT_RANK () OVER (PARTITION BY E.EmployeeNumber ORDER BY A.NumberAttendance )/* *21 */ AS PERCENTRANK -- TAKES LOWER PART 
FROM Employee AS E INNER JOIN Attendance AS A  
ON E.EmployeeNumber = A.EmployeeNumber