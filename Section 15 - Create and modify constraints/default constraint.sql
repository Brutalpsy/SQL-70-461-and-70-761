-- ADD NEW COLUMN - DateOfEntry
ALTER TABLE EmployeeTransaction
ADD DateOfEntry DATETIME

SELECT *
FROM EmployeeTransaction

SELECT GETDATE() 

-- ADD DEFAULT CONSTAINT 
ALTER TABLE EmployeeTransaction
ADD CONSTRAINT EmployeeTransaction_defDateOfEntry DEFAULT GETDATE() FOR DateOfEntry

-- OMITED DateOfEntry - DEFAULT COINSTAINT BEING TRIGGERED AND FILLED IT FOR US
INSERT INTO EmployeeTransaction (Amount,DateOfTransaction,EmployeeNumber) 
VALUES(1, '2015-08-29 00:00:00', 999)

-- DateOfEntry MANUALLY ENTERED 
INSERT INTO EmployeeTransaction (Amount,DateOfTransaction,EmployeeNumber,DateOfEntry)
VALUES(2, '2015-08-29 00:00:00', 999, '2013-01-01')

SELECT *
FROM EmployeeTransaction
WHERE EmployeeNumber = 999


DELETE FROM EmployeeTransaction
WHERE EmployeeNumber = 999

-- ADD DEFAULT CONSTAINT ON THE TABLE CREATION TIME
CREATE TABLE EmployeeTransaction2
(Amount SMALLMONEY NOT NULL,
 DateOfTransaction SMALLDATETIME NOT NULL,
 EmployeeNumber INT NOT NULL,
 DateOfEntry DATETIME NULL CONSTRAINT EmployeeTransaction2_defDateOfEntry DEFAULT GETDATE())

 DROP TABLE  EmployeeTransaction2

 -- THIS WONT WORK, WE NEED TO DROP CONSTAINT FIRST
 -- AND AFTER THAT DROP THE COLUMN
 ALTER TABLE EmployeeTransaction
 DROP COLUMN DateOfEntry

-- DROP CONSTRAINT
 ALTER TABLE EmployeeTransaction
 DROP CONSTRAINT EmployeeTransaction_defDateOfEntry

 SELECT * FROM EmployeeTransaction