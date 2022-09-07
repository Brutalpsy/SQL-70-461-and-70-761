IF (SELECT OBJECT_ID('AverageBalance','P')) IS NOT NULL
DROP PROC AverageBalance
GO
CREATE PROCEDURE AverageBalance(@employeeNumberFrom INT, @employeeNumberTo INT, @AverageBalance INT OUTPUT) AS -- you can use OUT instead of OUTPUT
BEGIN
	DECLARE @TotalAmount money;
	DECLARE @NumberOfEmployees int;

	SELECT @TotalAmount = SUM(AMOUNT) FROM EmployeeTransaction
	WHERE EmployeeNumber BETWEEN @employeeNumberFrom AND @employeeNumberTo

	SELECT @NumberOfEmployees= COUNT(DISTINCT EmployeeNumber) FROM Employee
	WHERE EmployeeNumber BETWEEN @employeeNumberFrom AND @employeeNumberTo

	IF @NumberOfEmployees = 0 -- HANDLE DEVIDE BY ZERO ERROR
		BEGIN
			SET @AverageBalance= 0 
		END
	ELSE
		BEGIN
			SET @AverageBalance= @TotalAmount / @NumberOfEmployees;
		END
END
GO
DECLARE @AverageBalance INT, @ReturnStatus INT
EXEC @ReturnStatus = AverageBalance 4, 6, @AverageBalance OUTPUT
select @AverageBalance AS 'Average_Balance',@ReturnStatus as 'Return Status'
GO
DECLARE @AverageBalance INT, @ReturnStatus INT
EXECUTE @ReturnStatus = AverageBalance 223, 227, @AverageBalance OUTPUT
select @AverageBalance AS 'Average_Balance',@ReturnStatus as 'Return Status'
GO
DECLARE @AverageBalance INT, @ReturnStatus INT 
EXEC @ReturnStatus = AverageBalance @employeeNumberFrom=323, @employeeNumberTo=327, @AverageBalance= @AverageBalance OUTPUT
select @AverageBalance AS 'Average_Balance',@ReturnStatus as 'Return Status'



