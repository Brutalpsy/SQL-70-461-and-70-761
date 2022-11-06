BEGIN TRANSACTION myTransaction WITH MARK 'myTransaction'-- we can name the transaction and mark it for administrative purposes (it marks it internally)

SELECT * FROM tblEmployee


UPDATE tblEmployee 
SET EmployeeNumber = 123
WHERE EmployeeNumber = 122


ROLLBACK TRANSACTION myTransaction


