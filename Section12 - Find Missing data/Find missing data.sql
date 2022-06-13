-- #1 Get all employees without any transaction
SELECT E.EmployeeNumber as ENumber, E.EmployeeFirstName,
	   E.EmployeeLastName, ET.EmployeeNumber AS ETNumber,
	   SUM(ET.Amount) as TotalAmount
FROM Employee as E
LEFT JOIN EmployeeTransaction AS ET
ON e.EmployeeNumber = ET.EmployeeNumber
WHERE ET.EmployeeNumber IS NULL
GROUP BY E.EmployeeNumber, E.EmployeeFirstName,
	   E.EmployeeLastName, ET.EmployeeNumber
ORDER BY E.EmployeeNumber, ET.EmployeeNumber, E.EmployeeFirstName,
	   E.EmployeeLastName

-- Derived table out of #1 query
SELECT  ENumber, EmployeeFirstName, EmployeeLastName
FROM
(SELECT E.EmployeeNumber as ENumber, E.EmployeeFirstName,
	   E.EmployeeLastName, ET.EmployeeNumber AS ETNumber,
	   SUM(ET.Amount) as TotalAmount
FROM Employee as E
LEFT JOIN EmployeeTransaction AS ET
ON e.EmployeeNumber = ET.EmployeeNumber
GROUP BY E.EmployeeNumber, E.EmployeeFirstName,
	   E.EmployeeLastName, ET.EmployeeNumber
) AS derived
WHERE ETNumber IS NULL
ORDER BY ENumber, ETNumber, EmployeeFirstName,
	   EmployeeLastName

-- RIGHT JOIN
-- Get all "ghost/fantom" transactions - that are without a employee
SELECT  *
FROM
(SELECT E.EmployeeNumber as ENumber, E.EmployeeFirstName,
	   E.EmployeeLastName, ET.EmployeeNumber AS ETNumber,
	   SUM(ET.Amount) as TotalAmount
FROM Employee as E
RIGHT JOIN EmployeeTransaction AS ET
ON e.EmployeeNumber = ET.EmployeeNumber
GROUP BY E.EmployeeNumber, E.EmployeeFirstName,
	   E.EmployeeLastName, ET.EmployeeNumber
) AS derived
WHERE ENumber IS NULL
ORDER BY ENumber, ETNumber, EmployeeFirstName,
	   EmployeeLastName