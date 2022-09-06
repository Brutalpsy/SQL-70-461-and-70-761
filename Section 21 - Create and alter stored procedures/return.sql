 --CREATE SIMPLE PROCEDURE
--IF EXISTS(SELECT * FROM sys.procedures WHERE NAME= 'NameEmployees')
IF (SELECT OBJECT_ID('NameEmployees','P')) IS NOT NULL
DROP PROC NameEmployees
GO
CREATE PROCEDURE NameEmployees(@employeeNumberFrom INT, @employeeNumberTo INT, @numberOfRows INT OUTPUT) AS -- you can use OUT instead of OUTPUT
BEGIN
    IF EXISTS(SELECT * FROM Employee WHERE EmployeeNumber between @employeeNumberFrom and @employeeNumberTo)
	BEGIN -- ISN'T REQUIRED SINCE ONLY THE FIRST STATETMENT AFTER EXIST WILL RUN,BUT ITS MORE READABLE AND YOU CAN NOW PLACE SOME MORE STATEMENTS
		SELECT EmployeeFirstName,EmployeeLastName, EmployeeNumber 
		FROM Employee
		WHERE EmployeeNumber between @employeeNumberFrom and @employeeNumberTo
		SET @numberOfRows = @@ROWCOUNT
		RETURN 0
	END
	ELSE 
		BEGIN
			SET @numberOfRows = 0;
			RETURN 1
		END
END

DECLARE @numRows INT, @ReturnStatus INT -- 0 indicates success, 1 or anything other - failure
EXEC @ReturnStatus = NameEmployees 4, 6, @numRows OUTPUT
select @numRows AS 'my row count',@ReturnStatus as 'Return Status'
GO
DECLARE @numRows INT, @ReturnStatus INT  -- 0 indicates success, 1 or anything other - failure
EXECUTE @ReturnStatus = NameEmployees 223, 227, @numRows OUTPUT
select @numRows AS 'my row count',@ReturnStatus as 'Return Status'
GO
DECLARE @numRows INT, @ReturnStatus INT  -- 0 indicates success, 1 or anything other - failure
EXEC @ReturnStatus = NameEmployees @employeeNumberFrom=323, @employeeNumberTo=327, @numberOfRows= @numRows OUTPUT
select @numRows AS 'my row count',@ReturnStatus as 'Return Status'



