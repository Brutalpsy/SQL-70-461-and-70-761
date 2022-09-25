  -- Get number of attendace in the preceding and a following month of each employee month,
  -- but in a specific year- since we are partitioning it with EmployeeNumber and YEAR
 SELECT A.EmployeeNumber,
 A.AttendanceMonth,
 A.NumberAttendance,
 SUM(A.NumberAttendance) 
	over(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
		 ORDER BY A.AttendanceMonth
		 ROWS BETWEEN 1 preceding and 1 following) as RunningTotal	-- we dont have to use 1 in the preceding and following,we can use 0			 						 
 FROM Employee AS E																		
 INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber  