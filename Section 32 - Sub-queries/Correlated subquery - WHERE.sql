--#1
SELECT * FROM EmployeeTransaction AS ET
WHERE EXISTS( SELECT EmployeeNumber FROM Employee AS E WHERE EmployeeLastName LIKE 'Y%' AND ET.EmployeeNumber = E.EmployeeNumber)
ORDER BY EmployeeNumber
--#2
-- SAME AMOUNT OF TIME IT TAKES TO EXECUTE #1 AND #2
SELECT * FROM EmployeeTransaction AS ET
INNER JOIN Employee AS E ON ET.EmployeeNumber = E.EmployeeNumber AND EmployeeLastName LIKE 'Y%'
ORDER BY E.EmployeeNumber



-- Test with sebquery instead of where clause
SELECT *, (SELECT EmployeeNumber FROM Employee AS E WHERE EmployeeLastName LIKE 'Y%' AND ET.EmployeeNumber = E.EmployeeNumber) as DoesItExists 
FROM EmployeeTransaction AS ET 


