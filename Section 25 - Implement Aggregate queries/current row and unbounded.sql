 SELECT A.EmployeeNumber,
 A.AttendanceMonth,
 A.NumberAttendance,
 SUM(A.NumberAttendance) 
	over(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
		 ORDER BY A.AttendanceMonth
		 ROWS BETWEEN current row and  unbounded following) as RunningTotal -- current ->  0 
 FROM Employee AS E															-- unbounded -> 999999 		
 INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber  


 SELECT A.EmployeeNumber,
 A.AttendanceMonth,
 A.NumberAttendance,
 SUM(A.NumberAttendance) 
	over(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
		 ORDER BY A.AttendanceMonth
		 ROWS BETWEEN unbounded preceding and  unbounded following) as RunningTotal 
 FROM Employee AS E																
 INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber  