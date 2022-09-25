
SELECT A.EmployeeNumber,
 A.AttendanceMonth,
 A.NumberAttendance,													 
 SUM(A.NumberAttendance) over() as TotalAttendance												
 FROM Employee AS E
INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber

select SUM(NumberAttendance) from Attendance --35409

-- this is the default that over() uses
-- range between unbounded preceding and unbounded following -- DEFAULT WHERE THERE IS NO ORDER BY 

SELECT A.EmployeeNumber,
 A.AttendanceMonth,
 A.NumberAttendance,												 
 SUM(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber, YEAR(A.AttendanceMonth)
							  ORDER BY A.AttendanceMonth) as SumAttendance												
 FROM Employee AS E
INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber

-- range between unbounded preceding and current row  -- DEFAULT WHERE THERE IS ORDER BY