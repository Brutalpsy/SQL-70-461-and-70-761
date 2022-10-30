SELECT E.EmployeeNumber,
	   E.EmployeeFirstName,
	   E.EmployeeLastName,
	   E.DateOfBirth,
	   T.Amount,
	   T.DateOfTransaction 
FROM Employee AS E
LEFT JOIN EmployeeTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML AUTO, Type  -- Handles repetition between the elements and the data within it
--FOR XML AUTO, ELEMENTS -- we can also use "type" or "elements" to display data differently
