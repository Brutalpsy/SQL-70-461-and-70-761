
SELECT E.EmployeeNumber,
	   E.EmployeeFirstName,
	   E.EmployeeLastName,
	   T.Amount,
	   T.DateOfTransaction
FROM Employee AS E
LEFT JOIN EmployeeTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
--FOR XML RAW, XMLDATA   -- WE CAN USE THIS TO SHOW SCHEMA
FOR XML RAW, XMLSCHEMA   -- OR MORE DETAILED XMLSCHEMA