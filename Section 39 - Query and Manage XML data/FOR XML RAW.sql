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
--FOR XML RAW ('MyRow'), TYPE  -- ADDS AN ATTRIBUTES TO THE ROWS
FOR XML RAW ('MyRow'), ELEMENTS -- ADDS ELEMENTS TO THE ROWS