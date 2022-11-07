-- IF WE EXUCETE THIS EXPLICIT TRANSACTION
-- IT WILL LOCK THE ROW WITH ID OF 122
-- AND IF WE OPEN ANOTHER QUERY WINDOW AND EXECUTE -> SELECT * FROM tblEmployee
-- IT WILL NOT GIVES US THE RESULT, QUERY WILL KEEP RUNNING SINCE THE TRANSACTION DIDN'T END
-- WE CAN END IT WITH COMMIT TRANSACTION OR ROLLBACK TRANSACTION
-- AND AFTER WE DO THAT IT WILL SHOW US THE RESULT IN THE OTHER QUERY WINDOW
-------------
BEGIN TRANSACTION

SELECT * FROM tblEmployee


UPDATE tblEmployee 
SET EmployeeNumber = 123
WHERE EmployeeNumber = 122
------------------------------------------
--COMMIT TRANSACTION 
--ROLLBACK TRANSACTION

