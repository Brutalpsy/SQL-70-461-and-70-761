
--UPDATE tblEmployee SET EmployeeNumber = 122 WHERE EmployeeNumber = 123

-- NESTED TRAN
SELECT * FROM tblEmployee
BEGIN TRAN
	BEGIN TRAN
	UPDATE tblEmployee SET EmployeeNumber = 123 WHERE EmployeeNumber = 122
	COMMIT TRAN -- DOESN'T ACTUALLY COMMIT IT SINCE ITS INSIDE NESTED TRAN
ROLLBACK TRAN

SELECT * FROM tblEmployee


-- ERROR
-- Msg 3902, Level 16, State 1, Line 20
-- The COMMIT TRANSACTION request has no corresponding BEGIN TRANSACTION.
SELECT * FROM tblEmployee
BEGIN TRAN
	BEGIN TRAN
	UPDATE tblEmployee SET EmployeeNumber = 123 WHERE EmployeeNumber = 122
	ROLLBACK TRAN -- THIS WILL ROLLBACK EVERY TRANSACTION AND THERE IS NO COMMIT TRAN ACTUALLY HAPPENING
COMMIT TRAN

SELECT * FROM tblEmployee

----------------------------------------------
-- @@TRANCOUNT TELLS YOU WHERE YOU ARE IN TRANSACTIONS, IF YOU ARE NESTING TRANSCATIONS
SELECT * FROM tblEmployee
SELECT @@TRANCOUNT
BEGIN TRAN -- ADDS ONE
	SELECT @@TRANCOUNT
	BEGIN TRAN
	UPDATE tblEmployee SET EmployeeNumber = 123 WHERE EmployeeNumber = 122
	SELECT @@TRANCOUNT
	COMMIT TRAN  -- SUBRACTS ONE
COMMIT TRAN
SELECT @@TRANCOUNT
--------------------------------
--WITH ROLLBACK
SELECT * FROM tblEmployee
SELECT @@TRANCOUNT
BEGIN TRAN
	SELECT @@TRANCOUNT
	BEGIN TRAN
	UPDATE tblEmployee SET EmployeeNumber = 123 WHERE EmployeeNumber = 122
	SELECT @@TRANCOUNT
	ROLLBACK TRAN -- GETS TRANCOUNT TO 0
COMMIT TRAN
SELECT @@TRANCOUNT
---------------

SELECT * FROM tblEmployee
SELECT @@TRANCOUNT -- 0
BEGIN TRAN
	SELECT @@TRANCOUNT --1
	BEGIN TRAN
	UPDATE tblEmployee SET EmployeeNumber = 123 WHERE EmployeeNumber = 122
	SELECT @@TRANCOUNT -- 2
	ROLLBACK TRAN 
	SELECT @@TRANCOUNT -- 0
IF @@TRANCOUNT > 0 -- FALSE
	COMMIT TRAN
SELECT @@TRANCOUNT -- 0
------

SELECT * FROM tblEmployee
SELECT @@TRANCOUNT -- 0
BEGIN TRAN
	SELECT @@TRANCOUNT --1
	BEGIN TRAN
	UPDATE tblEmployee SET EmployeeNumber = 123 WHERE EmployeeNumber = 122
	SELECT @@TRANCOUNT -- 2
	COMMIT TRAN 
	SELECT @@TRANCOUNT -- 0
IF @@TRANCOUNT > 0 -- TRUE
	COMMIT TRAN
SELECT @@TRANCOUNT -- 0