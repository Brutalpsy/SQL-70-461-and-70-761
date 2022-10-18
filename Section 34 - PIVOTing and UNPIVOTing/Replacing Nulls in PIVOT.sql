-- PIVOTING WITH DERIVED TABLE INSTEAD OF WITH
SELECT * FROM (SELECT YEAR(DateOfTransaction) AS TheYear, MONTH(DateOfTransaction) AS TheMonth, Amount FROM EmployeeTransaction) AS MyTable 
PIVOT (SUM(Amount) FOR TheMonth IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS myPivot
ORDER BY TheYear

GO
---------------------------------------------------------------------------------------------------------------------------
-- HANDLING NULLS IN PIVOT TABLE
WITH MyTable AS 
(SELECT YEAR(DateOfTransaction) AS TheYear, MONTH(DateOfTransaction) AS TheMonth, SUM(Amount) AS Amount FROM EmployeeTransaction GROUP BY  YEAR(DateOfTransaction), MONTH(DateOfTransaction) -- ONLY HAVE THE DATA NEEDED -> THREE COLUMNS, OTHERWISE THERE COULD BE PRBOLEMS
) -- UNION SELECT 2016,2,0    -- WE CAN MANUALLY INSERT DATA WITH UNION


SELECT TheYear, 
	   ISNULL([1],0) AS [1],
	   ISNULL([2],0) AS [2],
	   ISNULL([3],0) AS [3],
	   ISNULL([4],0) AS [4],
	   ISNULL([5],0) AS [5],
	   ISNULL([6],0) AS [6],
	   ISNULL([7],0) AS [7],
	   ISNULL([8],0) AS [8],
	   ISNULL([9],0) AS [9],
	   ISNULL([10],0) AS [10],
	   ISNULL([11],0) AS [11],
	   ISNULL([12],0) AS [12] 
FROM MyTable 
PIVOT (SUM(Amount) FOR TheMonth IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS myPivot
ORDER BY TheYear

