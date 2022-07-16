CREATE TRIGGER tr_ViewByDepartment
ON [dbo].[ViewByDepartment]
INSTEAD OF DELETE
AS 
BEGIN
	SELECT *, 'ViewByDepartment' FROM deleted
END

BEGIN TRAN
-- SHOW DATA TO DELETE
SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND EmployeeNumber = 132

-- TRY TO DELETE
DELETE FROM ViewByDepartment
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132

-- CHECK IF DELETED
SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND EmployeeNumber = 132
ROLLBACK TRAN


-- CREATION OF REAL INSTEAD OF TRIGGER
ALTER TRIGGER tr_ViewByDepartment
ON [dbo].[ViewByDepartment]
INSTEAD OF DELETE 
AS 
BEGIN
	DECLARE @EmployeeNumber as INT
	DECLARE @DateOfTransaction as smalldatetime
	DECLARE @Amount as smallmoney

	-- SETTING VARIABLES FROM SELECT 
	SELECT @EmployeeNumber = EmployeeNumber, @DateOfTransaction = DateOfTransaction, @Amount = TotalAmount
	FROM deleted

	DELETE EmployeeTransaction
	FROM EmployeeTransaction AS T
	WHERE T.EmployeeNumber = @EmployeeNumber
	AND T.DateOfTransaction = @DateOfTransaction
	AND T.Amount = @Amount
END

BEGIN TRAN
-- SHOW DATA TO DELETE
SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND EmployeeNumber = 132

-- DELETE A RECORD
DELETE FROM ViewByDepartment
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132

-- CHECK IF DELETED
SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND EmployeeNumber = 132
ROLLBACK TRAN