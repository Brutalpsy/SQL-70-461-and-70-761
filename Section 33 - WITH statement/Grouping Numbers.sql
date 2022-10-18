-- GET ALL EMPLOYEES THAT DIDN'T MAKE ANY TRANSACTION IN 2014
WITH RowNumbers AS 
(SELECT TOP(SELECT MAX(EmployeeNumber) FROM EmployeeTransaction )  ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) as RowNumber FROM EmployeeTransaction),
Transactions2014 AS 
(SELECT * FROM EmployeeTransaction WHERE YEAR(DateOfTransaction) = '2014')

SELECT RowNumber FROM RowNumbers AS U
LEFT JOIN Transactions2014 AS T ON T.EmployeeNumber = U.RowNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY RowNumber

GO

-- GET ME A GROUING OF THOSE NUMBERS, like from 172-177, 180-181, 183-183, 193-196
WITH RowNumbers AS 
(SELECT TOP(SELECT MAX(EmployeeNumber) FROM EmployeeTransaction )  ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) as RowNumber FROM EmployeeTransaction),
Transactions2014 AS 
(SELECT * FROM EmployeeTransaction WHERE YEAR(DateOfTransaction) = '2014'),
GapTable AS
(SELECT RowNumber, 
	   RowNumber - LAG(RowNumber) OVER (ORDER BY RowNumber) AS PREVIOUSNUMBER,
	   LEAD(RowNumber) OVER (ORDER BY RowNumber) - RowNumber AS NEXTROWNUMBER,
	   CASE WHEN RowNumber - LAG(RowNumber) OVER (ORDER BY RowNumber) = 1 THEN 0 ELSE 1 END AS GROUPGAP
	   
	   FROM RowNumbers AS U
LEFT JOIN Transactions2014 AS T ON T.EmployeeNumber = U.RowNumber
WHERE T.EmployeeNumber IS NULL),
GroupTable AS 
(SELECT *, sum(GROUPGAP) OVER (ORDER BY RowNumber) AS THEGROUP from GapTable)

SELECT MIN(RowNumber) AS StaringEmployeeNumber, 
       MAX(RowNumber) AS EndingEmployeeNumber,
	   (MAX(RowNumber) - MIN(RowNumber) + 1) as NumberOfEmployees  FROM GroupTable
GROUP BY THEGROUP
ORDER BY THEGROUP
