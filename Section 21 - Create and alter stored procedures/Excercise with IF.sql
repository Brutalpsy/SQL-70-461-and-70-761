 --CREATE SIMPLE PROCEDURE
--IF EXISTS(SELECT * FROM sys.procedures WHERE NAME= 'NameEmployees')
IF (SELECT OBJECT_ID('NameEmployees','P')) IS NOT NULL
DROP PROC NameEmployees
GO
CREATE PROCEDURE NameEmployees(@number int) AS 
BEGIN
    IF EXISTS(SELECT * FROM Employee WHERE EmployeeNumber = @number)
	BEGIN -- ISN'T REQUIRED SINCE ONLY THE FIRST STATETMENT AFTER EXIST WILL RUN,BUT ITS MORE READABLE AND YOU CAN NOW PLACE SOME MORE STATEMENTS
		IF @number < 300
			BEGIN
				SELECT EmployeeFirstName,EmployeeLastName, EmployeeNumber 
				FROM Employee
				WHERE EmployeeNumber = @number
			END
		ELSE
			BEGIN
				SELECT EmployeeFirstName,EmployeeLastName, EmployeeNumber, Department
				FROM Employee
				WHERE EmployeeNumber = @number
				SELECT * FROM EmployeeTransaction WHERE EmployeeNumber = @number
			END
	END
END

-- THREE WAYS OF EXECUTING A PROCEDURE
EXECUTE NameEmployees 4 -- NO RECORDS
EXEC NameEmployees 223 -- LESS THAN 300, WITHOUT DEPARTMENT
GO -- REQUIRED IF WITH ONLY A NAME
NameEmployees 333 -- WITH DEPARTMENT


