SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 340 AND 349 


-- segment -> windows spool -> stream aggregate -> compute scalar
SELECT EmployeeNumber, DateOfTransaction, Amount, SUM(Amount) OVER (PARTITION BY EmployeeNumber ORDER BY DateOfTransaction) as TotalAmount -- comulative running total
FROM tblTransaction

