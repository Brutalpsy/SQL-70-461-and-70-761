 --CREATE SIMPLE PROCEDURE
--IF EXISTS(SELECT * FROM sys.procedures WHERE NAME= 'NameEmployees')
IF (SELECT OBJECT_ID('NameEmployees','P')) IS NOT NULL
DROP PROC NameEmployees
GO
CREATE PROCEDURE NameEmployees(@employeeNumberFrom int, @employeeNumberTo int) AS 
BEGIN
    IF EXISTS(SELECT * FROM Employee WHERE EmployeeNumber between @employeeNumberFrom and @employeeNumberTo)
	BEGIN -- ISN'T REQUIRED SINCE ONLY THE FIRST STATETMENT AFTER EXIST WILL RUN,BUT ITS MORE READABLE AND YOU CAN NOW PLACE SOME MORE STATEMENTS
			BEGIN
				DECLARE @EmployeeNumber int = @employeeNumberFrom;
				WHILE @EmployeeNumber <= @employeeNumberTo
					BEGIN
						IF EXISTS(SELECT * FROM Employee WHERE EmployeeNumber = @EmployeeNumber)
						BEGIN
							SELECT EmployeeFirstName,EmployeeLastName, EmployeeNumber 
							FROM Employee
							WHERE EmployeeNumber = @EmployeeNumber
						END
						SET @EmployeeNumber =@EmployeeNumber + 1
						--goto Hellow --spaghetti code, do not use it!
					END 
			END
	END
END
--Hellow: 
EXEC NameEmployees 1, 6 



