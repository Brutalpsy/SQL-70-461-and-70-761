-- PROPER WAY OF DELETING
-- WITH HAVING MULTIPLE ROWS IN A SESSION
 
ALTER TRIGGER tr_ViewByDepartment
ON [dbo].[ViewByDepartment]
INSTEAD OF DELETE 
AS 
BEGIN
	SELECT *, 'TO BE DELETED' FROM deleted
	DELETE EmployeeTransaction FROM EmployeeTransaction AS ET
	JOIN DELETED  D
	ON ET.EmployeeNumber = D.EmployeeNumber
	AND ET.DateOfTransaction = D.DateOfTransaction
	AND ET.Amount = D.TotalAmount
END

BEGIN TRAN
SELECT *, 'BEFORE DELETE' FROM ViewByDepartment WHERE EmployeeNumber = 132
DELETE FROM ViewByDepartment
WHERE EmployeeNumber = 132 --AND TotalAmount = 861.16
SELECT *, 'AFTER DELETE' FROM ViewByDepartment WHERE EmployeeNumber = 132
ROLLBACK TRAN




-- THIS COMMENTED CODE DOESNT WORK PROPERLY 
-- SINCE IT ONLY DELETES ONE LAST ROW
-- IT'S FROM PREVIOUS EXAMPLE WITH INSTEAD TRIGGER

--ALTER TRIGGER tr_ViewByDepartment
--ON [dbo].[ViewByDepartment]
--INSTEAD OF DELETE 
--AS 
--BEGIN
--	DECLARE @EmployeeNumber as INT
--	DECLARE @DateOfTransaction as smalldatetime
--	DECLARE @Amount as smallmoney

--	-- SETTING VARIABLES FROM SELECT 
--	SELECT @EmployeeNumber = EmployeeNumber, @DateOfTransaction = DateOfTransaction, @Amount = TotalAmount
--	FROM deleted
	
--	DELETE EmployeeTransaction
--	FROM EmployeeTransaction AS T
--	WHERE T.EmployeeNumber = @EmployeeNumber
--	AND T.DateOfTransaction = @DateOfTransaction
--	AND T.Amount = @Amount
--END
