-- ASSOCIATING EMPLOYEES WITH RIGHT TRANSACTIONS 
-- IN A COMPLICATED WAY

SELECT  1 as Tag, NULL AS Parent,
		E.EmployeeFirstName AS [Elements!1!EmployeeFirstName],
	    E.EmployeeLastName AS [Elements!1!EmployeeLastName],
	    E.EmployeeNumber [Elements!1!EmployeeNumber],
        E.DateOfBirth [Elements!1!DateOfBirth],
	    NULL AS [Elements!2!Amount],
	    NULL AS [Elements!2!DateOfTransaction]
FROM  Employee AS E
WHERE E.EmployeeNumber BETWEEN 200 AND 202
UNION ALL 
SELECT 2 AS TAG, 1 AS PARENT,
       NULL AS [EmployeeFirstName],
	   NULL AS [EmployeeLastName],
	   T.EmployeeNumber,
	   NULL AS [DateOfBirth],
	   T.Amount,
	   T.DateOfTransaction
FROM EmployeeTransaction AS T
WHERE T.EmployeeNumber BETWEEN 200 AND 202
ORDER BY EmployeeNumber, [Elements!2!Amount]
FOR XML EXPLICIT