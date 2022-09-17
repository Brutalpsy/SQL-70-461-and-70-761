IF (SELECT OBJECT_ID('AverageBalance','P')) IS NOT NULL
DROP PROC AverageBalance
GO
CREATE PROCEDURE AverageBalance(@employeeNumberFrom INT, @employeeNumberTo INT, @AverageBalance INT OUTPUT) AS -- you can use OUT instead of OUTPUT
BEGIN
	DECLARE @TotalAmount DECIMAL(5,2);
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
		IF ERROR_NUMBER() = 8134 
		BEGIN
			SET @AverageBalance = 0;
			RETURN 8134
		END
		ELSE
			--THROW						      -- RETROWS THE ERROR MESSAGE IF NO PARAMETERS ARE USED
			  THROW 55555, 'TOO MANY BANANAS',22 -- OTHERISE WE CAN MODIFY THE PARAMETERS AND THE ERROR MESSAGE
			--RAISERROR (15600, 16,1, 'TOO MANY BANANAS'); -- ANOTHER WAY  TO SEND CUSTOM MESSAGES
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
