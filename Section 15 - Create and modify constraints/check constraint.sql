ALTER TABLE EmployeeTransaction
ADD CONSTRAINT chkAmount check (Amount > -1000 AND Amount <1000)

INSERT INTO EmployeeTransaction
OUTPUT inserted.*
VALUES (NULL, '20140101',1)

-- NOT CHECKING EXISTING ROWS
-- ADD CONSTRAINT NOT TO ALLOW DOTS IN THE MIDDLE NAME, BUT IT ALLOWS THE MIDDLE NAME TO BE NULL
ALTER TABLE Employee WITH NOCHECK
ADD CONSTRAINT chkMiddleName check
(REPLACE(EmployeeMiddleName, '.','') = EmployeeMiddleName OR EmployeeMiddleName IS NULL)
-- R = R
-- R.-> R = R => TRUE
-- V.-> V = V. => FALSE

ALTER TABLE Employee
DROP CONSTRAINT chkMiddleName


BEGIN TRAN
	INSERT INTO Employee
	OUTPUT inserted.*
	VALUES (2003,'A','B.','C','D','20140101','Accounts')

	INSERT INTO Employee
	OUTPUT inserted.*
	VALUES (2004,'A',NULL,'C','DA','20140101','Accounts')
ROLLBACK TRAN


ALTER TABLE Employee WITH NOCHECK
ADD CONSTRAINT chkDateOfBirth CHECK (DateOfBirth between '19000101' AND GETDATE())


-- TRY TO INSERT A DATE INTO A FUTURE
BEGIN TRAN
	INSERT INTO Employee
	OUTPUT inserted.*
	VALUES (2005,'A','B','C','D','20230101','Accounts')
ROLLBACK TRAN

-- CREATE A CHECK WITH A NEW TABLE
CREATE TABLE Employee2
(EmployeeMiddleName VARCHAR(50) NULL, CONSTRAINT CK_EmployeeMiddleName CHECK
(REPLACE(EmployeeMiddleName, '.','') = EmployeeMiddleName OR EmployeeMiddleName IS NULL))


--DROP EVERYTHING
DROP TABLE Employee2

ALTER TABLE Employee
DROP chkMiddleName

ALTER TABLE Employee
DROP chkDateOfBirth

ALTER TABLE EmployeeTransaction
DROP chkAmount