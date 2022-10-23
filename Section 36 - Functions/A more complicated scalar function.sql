IF EXISTS(SELECT * FROM sys.objects WHERE NAME = 'NumberOfTransactions')
	DROP FUNCTION NumberOfTransactions
GO
CREATE FUNCTION NumberOfTransactions (@EmployeeNumber INT)
RETURNS INT
AS
BEGIN
	DECLARE @NumberOfTransactions INT
	--SET @NumberOfTransactions = (SELECT COUNT(*) FROM EmployeeTransaction WHERE EmployeeNumber = @EmployeeNumber)
	SELECT @NumberOfTransactions = COUNT(*) FROM EmployeeTransaction 
	WHERE EmployeeNumber = @EmployeeNumber

	RETURN @NumberOfTransactions
END

GO

-- Function, FASTEST OF ALL
-- FUNCTIONS IN THE SELECT CLAUSE CAN BE REALLY, REALLY GOOD - PERFORMANCE WISE
SELECT *, dbo.NumberOfTransactions(EmployeeNumber) AS TransNumber
FROM Employee

-- We can do the same with group by correlated sub query
-- correlated sub query
SELECT *, ((SELECT COUNT(EmployeeNumber) FROM EmployeeTransaction WHERE EmployeeNumber = ET.EmployeeNumber)) AS TransNumber
FROM Employee AS ET

-- group by
SELECT E.EmployeeNumber,  E.EmployeeFirstName, E.EmployeeLastName, COUNT(t.EmployeeNumber) AS TransNumber
FROM Employee AS E
LEFT JOIN EmployeeTransaction AS T ON  E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber , E.EmployeeFirstName, E.EmployeeLastName
