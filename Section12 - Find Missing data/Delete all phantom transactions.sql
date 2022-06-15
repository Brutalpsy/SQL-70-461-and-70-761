
-- DELETE ALL PHANTOM TRANSACTIONS #1
BEGIN TRAN
SELECT COUNT(*) FROM EmployeeTransaction

DELETE FROM EmployeeTransaction
WHERE EmployeeNumber IN(
SELECT  ETNumber
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
)

	   SELECT COUNT(*) FROM EmployeeTransaction
ROLLBACK TRAN


-- DELETE ALL PHANTOM TRANSACTIONS #1 - SIMPLIFIED
BEGIN TRANSACTION

SELECT COUNT(*) FROM EmployeeTransaction

DELETE EmployeeTransaction
FROM Employee AS E
RIGHT JOIN EmployeeTransaction AS ET
ON e.EmployeeNumber = ET.EmployeeNumber
WHERE E.EmployeeNumber IS NULL

SELECT COUNT(*) FROM EmployeeTransaction

ROLLBACK TRANSACTION
