ALTER TRIGGER [tr_EmployeeTransaction]
ON [dbo].[EmployeeTransaction]
AFTER  UPDATE
AS
BEGIN
	--IF @@ROWCOUNT > 0
	IF UPDATE(DateOfTransaction)
	BEGIN
		SELECT *, @@NESTLEVEL as NESTLEVEL, 'INSERTED DATA' AS 'TRIGGER -> tr_EmployeeTransaction' FROM inserted
		SELECT *, @@NESTLEVEL as NESTLEVEL, 'DELETED DATA' AS 'TRIGGER -> tr_EmployeeTransaction' FROM deleted
	END
END
GO


UPDATE EmployeeTransaction
SET DateOfTransaction = '20220201'
WHERE AMOUNT = 123 AND DateOfTransaction ='20220201' AND EmployeeNumber = 123

--UPDATE EmployeeTransaction
--SET Amount = 123
--WHERE AMOUNT = 123 AND DateOfTransaction ='20220101' AND EmployeeNumber = 123


DELETE FROM EmployeeTransaction
WHERE AMOUNT = 123 AND DateOfTransaction ='20220101' AND EmployeeNumber = 123

INSERT INTO EmployeeTransaction(Amount,DateOfTransaction,EmployeeNumber)
VALUES (123,'20220101',123)

SELECT * FROM ViewByDepartment
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132


BEGIN TRAN
DELETE FROM ViewByDepartment
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132
ROLLBACK TRAN