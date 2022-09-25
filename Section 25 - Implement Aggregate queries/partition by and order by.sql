-- GET THE PERCENTAGE OF ATTENDANCE BY EACH MONTH OF ALL EMPLOYEES
SELECT A.EmployeeNumber,
 A.AttendanceMonth,
 A.NumberAttendance,
  CONVERT(DECIMAL(18,7),A.NumberAttendance) / SUM(A.NumberAttendance) over(PARTITION BY A.EmployeeNumber) * 100 AS Percentage, --OVER() TAKES RANGE OF ROWS AND IT DOES THE CALCULATION - IN THIS CASE "SUM" BASED ON NUMBER OF ATTENDANCE																				 
 SUM(A.NumberAttendance) over(PARTITION BY A.EmployeeNumber) as TotalAttendance			-- 	PARTITION BY - REFINES THE RANGE OF ROWS THAT WE ARE GOING TO TAKE BASED ON A FIELD		 						 
 FROM Employee AS E																		--  IN THIS CASE - PARTITON BY REDUCES THE NUMBER OF ROWS THAT "SUM" WILL LOOK AT
 INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber                      --  SO WE WILL GET SUM OF THE NUMBER OF ATTENDANCE BY EMPOLOYE NUMBER -- WITHOUT IT IT WAS LOOKING AT ENTIRE TABLE
 WHERE A.AttendanceMonth < '20150101'


 -- THIS WAY WE GET "RUNNING TOTAL" BY DATE, IT'S CUMULATIVELY ADDING A TOTAL OF ATTENDACE OF EACH MONTH, MONTH BY MONTH
 -- SINCE WE USED PARTITION ORDER BY "DATE"
 SELECT A.EmployeeNumber,
 A.AttendanceMonth,
 A.NumberAttendance,
 SUM(A.NumberAttendance) over(PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth) as RunningTotal				 						 
 FROM Employee AS E																		
 INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber                      


  -- WE CAN ALSO PARTIOTION BY MULTIPLE FIELDS
  -- SO IN THIS CASE WE PARTITION BY NUMBER AND YEAR
  -- SO IT "RESTARTS" THE SUM FOR EACH YEAR(WHEN THE YEAR CHANGES) OF EMPLOYEE 
  SELECT A.EmployeeNumber,
 A.AttendanceMonth,
 A.NumberAttendance,
 SUM(A.NumberAttendance) over(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) ORDER BY A.AttendanceMonth) as RunningTotal				 						 
 FROM Employee AS E																		
 INNER JOIN Attendance AS A ON E.EmployeeNumber = A.EmployeeNumber     