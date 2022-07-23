--CREATE ANOTHER TABLE BASED ON EmployeeTransaction
--SELECT * 
--INTO EmployeeTransactionNew
--FROM EmployeeTransaction

-- KEEP ONLY 50 RECORDS 
-- FROM THE NEW TABLE
WITH CTE AS 
(SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NEWID())) AS ROWNUMBER
FROM EmployeeTransactionNew)
DELETE FROM CTE
WHERE ROWNUMBER > 50


--INSERT
--INTO EmployeeTransactionNew
--SELECT *  FROM EmployeeTransaction
--WHERE EmployeeNumber = 49

-- SET THE SAME DATE TO CREATE DUPLICATES OF EmployeeNumber AND DateOfTransaction
UPDATE EmployeeTransaction
SET DateOfTransaction = '20220101'
WHERE EmployeeNumber = 49

-- SET THE SAME DATE TO CREATE DUPLICATES OF EmployeeNumber AND DateOfTransaction
UPDATE EmployeeTransactionNew
SET DateOfTransaction = '20220101'
WHERE EmployeeNumber = 49

--VIEW IF THERE ARE DUPLICATES WITH EmployeeNumber,DateOfTransaction COMBINATION
--AND SUM THEIR AMOUNT VALUE
SELECT EmployeeNumber, DateOfTransaction, SUM(Amount) AS TOTALAMOUNT FROM EmployeeTransactionNew
GROUP BY EmployeeNumber,DateOfTransaction
HAVING COUNT(*) > 1
ORDER BY TOTALAMOUNT DESC




SELECT * FROM EmployeeTransactionNew

-- ERROR CODE: 
-- The MERGE statement attempted to UPDATE or DELETE the same row more than once.
-- This happens when a target row matches more than one source row.
-- A MERGE statement cannot UPDATE/DELETE the same row of the target table multiple times. 
-- Refine the ON clause to ensure a target row matches at most one source row, or use the GROUP BY clause to group the source rows.
BEGIN TRAN
MERGE INTO EmployeeTransaction AS T
USING EmployeeTransactionNew AS S 
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
	UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([Amount],[DateOfTransaction],[EmployeeNumber])
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber);

SELECT * FROM EmployeeTransaction
ROLLBACK TRAN


--ANOTHER WAY

BEGIN TRAN
MERGE INTO EmployeeTransaction AS T
USING (SELECT EmployeeNumber, DateOfTransaction, SUM(Amount) AS Amount FROM EmployeeTransactionNew
GROUP BY EmployeeNumber,DateOfTransaction) AS S 
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
	UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([Amount],[DateOfTransaction],[EmployeeNumber])
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber)
OUTPUT inserted.*,deleted.*;
ROLLBACK TRAN

-- DISABLE TRIGGER BECAUSE OF THE OUTPUT KEYWORD
DISABLE TRIGGER [tr_EmployeeTransaction] ON [dbo].[EmployeeTransaction]
ENABLE TRIGGER [tr_EmployeeTransaction] ON [dbo].[EmployeeTransaction]
	