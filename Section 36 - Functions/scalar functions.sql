-- Creation of Scalar Function -> gets one value back
CREATE FUNCTION AmountPlusOne(@Amount SMALLMONEY)
RETURNS SMALLMONEY
AS
BEGIN
    RETURN @Amount + 1
END

GO

-- using a custom function in select statement
-- difference between the functions and procedures is that functions can be used in select statment
SELECT DateOfTransaction, EmployeeNumber, Amount,  dbo.AmountPlusOne(Amount)  as AmountAndOne
FROM EmployeeTransaction

-- Manually executing a function, like procedures
DECLARE @num SMALLMONEY

EXEC @num = DBO.AmountPlusOne 56
SELECT @num