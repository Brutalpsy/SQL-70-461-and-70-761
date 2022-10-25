
CREATE FUNCTION TransactionList(@EmployeeNumber INT)
RETURNS TABLE AS RETURN
(
    SELECT * FROM EmployeeTransaction 
	WHERE EmployeeNumber = @EmployeeNumber
)

GO

SELECT * 
FROM dbo.TransactionList(123) -- RETURNS A TABLE SO "FROM" NEEDS TO BE USED

SELECT *
FROM Employee
WHERE EXISTS(select * FROM dbo.TransactionList(EmployeeNumber)) -- FUNCTION IN WHERE EXIST
															    -- SELECT * FROM EMPLOYEE
																-- WHERE THERE IS SOMETHING(AT LEAST ONE ROW) IN TransactionList

--#1 OTHER WAY OF DOING IT 
SELECT DISTINCT E.*
FROM Employee AS E
INNER JOIN EmployeeTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber

--#2 OTHER WAY OF DOING IT 
SELECT * 
FROM Employee AS E
WHERE EXISTS( SELECT EmployeeNumber FROM EmployeeTransaction AS T WHERE E.EmployeeNumber = T.EmployeeNumber)