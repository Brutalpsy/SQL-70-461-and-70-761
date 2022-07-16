-- "SET NOCOUNT ON" DISABLES -> ROWS AFFECTED MESSAGE
SET NOCOUNT ON 
SELECT * FROM Department
SET NOCOUNT OFF 

-- CREATION OF A TRINGGER
GO
CREATE TRIGGER tr_EmployeeTransaction
    ON EmployeeTransaction
    AFTER DELETE, INSERT, UPDATE
    AS
    BEGIN
	SET NOCOUNT ON
	SELECT * FROM inserted
	SELECT * FROM deleted
	SET NOCOUNT OFF
    END
GO

BEGIN TRAN
INSERT INTO EmployeeTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES(123,'20220101',123)
ROLLBACK TRAN

	