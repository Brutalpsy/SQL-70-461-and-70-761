
 SELECT A.EmployeeNumber,
 A.AttendanceMonth,
 A.NumberAttendance,
 SUM(A.NumberAttendance) 
	over(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
		 ORDER BY A.AttendanceMonth
		 ROWS BETWEEN unbounded preceding and current row) as RowsTotal, --rows does not invole ties/duplicates
 SUM(A.NumberAttendance) 
	over(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
		 ORDER BY A.AttendanceMonth
		 RANGE BETWEEN unbounded preceding and  current row) as RangeTotal  -- range include one more record, duplicated record. BUT this is only of importance if the range is not unbounded in both ways. 
 FROM Employee AS E															-- like in this example,where the current row is used	
 INNER JOIN (SELECT * FROM Attendance                                       -- if unbounded is used in both ways it wouldn't matter, result would be the same -> since you are going to the edge either way.
			 UNION ALL  -- CREATE DUPLICATE RECORDS
			 SELECT * FROM Attendance)
  AS A ON E.EmployeeNumber = A.EmployeeNumber  

  -- unbounded precedding and current row
  -- current row and unbounded following
  -- unbounded precedingand unbounded following -  range and rows same.
  -- range is bit slower since it computes ties also
  -- so by default you should use rows and use range only if you have to take care of ties


