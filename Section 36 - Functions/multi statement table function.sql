-- multi statement
CREATE FUNCTION TransList(@EmployeeNumber INT)
RETURNS @TransListTable TABLE 
(
	Amount smallmoney,
	DateOfTransaction smalldatetime,
	EmployeeNumber int
)
AS
BEGIN
    INSERT @TransListTable(Amount, DateOfTransaction, EmployeeNumber)
    SELECT Amount, DateOfTransaction, EmployeeNumber
	FROM EmployeeTransaction WHERE EmployeeNumber = @EmployeeNumber
    RETURN 
END


SELECT * FROM dbo.TransList(123)

-- way slower
SELECT * FROM [dbo].[TransactionList](123)



