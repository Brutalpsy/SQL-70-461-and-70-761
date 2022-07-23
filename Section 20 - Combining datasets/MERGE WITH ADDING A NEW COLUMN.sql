-- ADDING NEW COLUMN TO EmployeeTransactionNew
INSERT INTO EmployeeTransactionNew ([Amount],[DateOfTransaction],[EmployeeNumber])
VALUES(55,'20220101',2222)


--ADDING ADITIONAL COLUM WITH MERGE
BEGIN TRAN
ALTER TABLE EmployeeTransaction
ADD Comments VARCHAR(50) NULL
GO --DDL
MERGE INTO EmployeeTransaction AS T --DML -- YOU CAN MERGE TOP(5) IF YOU WANT AND NOT A WHOLE TABLE
USING (SELECT EmployeeNumber, DateOfTransaction, SUM(Amount) AS Amount FROM EmployeeTransactionNew
GROUP BY EmployeeNumber,DateOfTransaction) AS S 
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED AND T.Amount + S.Amount > 0 THEN
	UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updated Row'
WHEN MATCHED THEN DELETE 
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([Amount],[DateOfTransaction],[EmployeeNumber],[Comments])
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber,'Inserted Row')
WHEN  NOT MATCHED BY SOURCE THEN
	UPDATE SET Comments = 'Unchanged'
OUTPUT inserted.*,deleted.*,$action;-- TELLS US WHAT ACTUALLY HAPPEND,ONLY AVAILABLE WITH MERGE AND OUTPUT
--SELECT * FROM EmployeeTransaction ORDER BY EmployeeNumber, DateOfTransaction
ROLLBACK TRAN

