
-- join two tables and group them by sum amount
SELECT Employee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, SUM(Amount) AS SumOfAmount
FROM Employee
INNER JOIN EmployeeTransaction
ON Employee.EmployeeNumber  = EmployeeTransaction.EmployeeNumber
GROUP BY Employee.EmployeeNumber,EmployeeFirstName,EmployeeLastName
ORDER BY EmployeeNumber

-- LEFT JOIN - take everything from the left
SELECT Employee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, SUM(Amount) AS SumOfAmount
FROM Employee
LEFT JOIN EmployeeTransaction
ON Employee.EmployeeNumber  = EmployeeTransaction.EmployeeNumber
GROUP BY Employee.EmployeeNumber,EmployeeFirstName,EmployeeLastName
ORDER BY EmployeeNumber

-- RIGHT JOIN - take everything from the right

SELECT Employee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, SUM(Amount) AS SumOfAmount
FROM Employee
LEFT JOIN EmployeeTransaction
ON Employee.EmployeeNumber  = EmployeeTransaction.EmployeeNumber
GROUP BY Employee.EmployeeNumber,EmployeeFirstName,EmployeeLastName
ORDER BY EmployeeNumber

select *
from Employee
where EmployeeNumber = 1046

select *
from EmployeeTransaction
where EmployeeNumber = 1046