WITH TableWithRanking AS
(SELECT D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
	RANK() OVER(PARTITION BY D.Department order by E.EmployeeNumber) AS TheRank FROM Department AS D INNER JOIN Employee AS E ON D.Department = E.Department),
Transactions2014 AS 
(SELECT * FROM EmployeeTransaction
	WHERE YEAR(DateOfTransaction) = '2014')


SELECT * FROM TableWithRanking as R 
LEFT JOIN Transactions2014 AS T ON T.EmployeeNumber = R.EmployeeNumber
WHERE TheRank <=5
ORDER BY Department, R.EmployeeNumber
