-- Get top 5 of all various categories
SELECT * FROM (SELECT D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
	RANK() OVER (PARTITION BY D.Department ORDER BY E.EmployeeNumber) AS TheRank
FROM Department AS D
INNER JOIN Employee AS E ON D.Department = E.Department
) AS MyTable
WHERE TheRank <=5
ORDER BY Department, EmployeeNumber -- WE CAN ALSO USE ORDER BY IN INNER QUERY BY USING TOP 100 PERCENT, BUT THIS WAY IS A "BETTER PRACTICE" TO DO SO