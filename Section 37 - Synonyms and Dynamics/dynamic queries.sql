-- Fixed statement
SELECT * FROM Employee WHERE EmployeeNumber = 129
GO

-- Dynamic Statements
DECLARE @COMMAND AS VARCHAR(255)
SET @COMMAND = 'SELECT * FROM Employee WHERE EmployeeNumber = 129;'
EXECUTE (@COMMAND)

GO

-- Select multiple select statements
DECLARE @COMMAND AS VARCHAR(255)
SET @COMMAND = 'SELECT * FROM Employee WHERE EmployeeNumber = 129; SELECT * FROM EmployeeTransaction WHERE EmployeeNumber = 129'
EXECUTE (@COMMAND)

GO

DECLARE @COMMAND AS VARCHAR(255), @PARAM AS VARCHAR(50);
SET @COMMAND = 'SELECT * FROM Employee WHERE EmployeeNumber = '
SET @PARAM = '129'          -- SET @PARAM = '129 OR 1=1'
EXECUTE (@COMMAND + @PARAM) -- SQL INJECTION => don't do this with parameters

GO
-- Way safer to counter SQL INJECTION then upper one
-- Varibales needs to be NVARCHAR as opposed to VARCHAR
DECLARE @COMMAND AS NVARCHAR(255), @PARAM AS NVARCHAR(50);
SET @COMMAND = N'SELECT * FROM Employee WHERE EmployeeNumber = @ProductId'
SET @PARAM = N'129'         -- SET @PARAM = N'129 OR 1=1'
							-- Error converting data type nvarchar to int
							-- SQL INJECTION WONT WORK
EXECUTE sys.sp_executesql @statement = @COMMAND, @params = N'@ProductId INT', @ProductId = @PARAM;
