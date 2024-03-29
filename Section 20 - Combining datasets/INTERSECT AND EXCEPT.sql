SELECT *, ROW_NUMBER() OVER (ORDER BY(SELECT NULL)) % 3 AS ShouldIDelete
INTO EmployeeTransactionsNew
From EmployeeTransaction

SELECT * FROM EmployeeTransactionsNew


DELETE FROM EmployeeTransactionsNew
WHERE ShouldIDelete = 1

UPDATE EmployeeTransactionsNew
SET DateOfTransaction = DATEADD(DAY,1,DateOfTransaction)
WHERE ShouldIDelete = 2


ALTER TABLE EmployeeTransactionsNew
DROP COLUMN ShouldIDelete 


SELECT * FROM EmployeeTransaction -- 2496 ROWS
--UNION  ALL --GETS ALL DATA(INCLUDING DUPLICATES, DOES NOT MERGE) -> 4160 ROWS
--UNION -- MERGES SAME ROW VALUES(GETS RID OF DUPLICATES) -> 3326 ROWS
--EXCEPT -- TABLE POSSITON MATTERS, GETS ALL OF ONE TABLE WHICH DOESN'T EXIST IN ANOTHER -> 1662 ROWS
INTERSECT -- GETS ONLY THE DUPLICATE VALUES -> 832 ROWS
SELECT * FROM  EmployeeTransactionsNew --> 1664 ROWS, 832 CHANAGED ROWS
ORDER BY EmployeeNumber -- ORDER BY CAN ONLY GO AT THE END