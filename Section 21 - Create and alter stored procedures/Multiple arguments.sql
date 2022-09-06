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
				SELECT EmployeeFirstName,EmployeeLastName, EmployeeNumber 
				FROM Employee
				WHERE EmployeeNumber between @employeeNumberFrom and @employeeNumberTo
			END
	END
END

-- THREE WAYS OF EXECUTING A PROCEDURE
EXECUTE NameEmployees 4,5 -- NO RECORDS
EXEC NameEmployees 223, 227 -- LESS THAN 300, WITHOUT DEPARTMENT
GO -- REQUIRED IF WITH ONLY A NAME
--NameEmployees  --you can check arguments of procedure with shift + ctrl + space
NameEmployees  @employeeNumberTo=234, @employeeNumberFrom=223 -- or be expliocit with the arguments and changing their spots


