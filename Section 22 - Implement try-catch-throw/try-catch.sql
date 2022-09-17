IF (SELECT OBJECT_ID('AverageBalance','P')) IS NOT NULL
DROP PROC AverageBalance
GO
CREATE PROCEDURE AverageBalance(@employeeNumberFrom INT, @employeeNumberTo INT, @AverageBalance INT OUTPUT) AS -- you can use OUT instead of OUTPUT
BEGIN
	DECLARE @TotalAmount money;
	DECLARE @NumberOfEmployees int;
	BEGIN TRY
		SELECT @TotalAmount = SUM(AMOUNT) FROM EmployeeTransaction
		WHERE EmployeeNumber BETWEEN @employeeNumberFrom AND @employeeNumberTo

		SELECT @NumberOfEmployees=  COUNT(DISTINCT EmployeeNumber) FROM Employee
		WHERE EmployeeNumber BETWEEN @employeeNumberFrom AND @employeeNumberTo
		SET @AverageBalance= @TotalAmount / @NumberOfEmployees;
		RETURN 0;
	END TRY
	BEGIN CATCH 
		SET @AverageBalance = 0;
		SELECT ERROR_MESSAGE() AS ErrorMessage, -- error message is just output of error number
			   ERROR_LINE() AS ErrorLine,
			   ERROR_NUMBER() AS ErrorNumber, 
			   ERROR_PROCEDURE() AS ErrorProcedure,
			   ERROR_SEVERITY() AS ErrorSeverity, -- 0 - 10 -- information
												  -- 16 default SQL SERVER log / Windows Application log
												  -- 20 - 25 really bad ones - they close the database
			   ERROR_STATE() AS ErrorState
		RETURN 1;
	END CATCH
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


-- TRY -> if it succeeds it outputs the result, otherwise it's NULL
SELECT TRY_CONVERT(INT,'two')
SELECT TRY_CONVERT(INT,'2')
