-- ADD UNIQUE KEY
ALTER TABLE Employee
ADD CONSTRAINT unqGovernmentID UNIQUE(EmployeeGovermentId)

--FIND DUPLICATES
SELECT EmployeeGovermentId, COUNT(EmployeeGovermentId) AS MyCount
FROM Employee
GROUP BY EmployeeGovermentId
HAVING COUNT(EmployeeGovermentId) > 1

-- ADD COMBINATION OF UNIQE KEYS
ALTER TABLE EmployeeTransaction
ADD CONSTRAINT unqTransaction UNIQUE(Amount,DateOfTransaction,EmployeeNumber)


SELECT * FROM EmployeeTransaction
WHERE EmployeeNumber = 131

DELETE FROM EmployeeTransaction
WHERE EmployeeNumber = 131


-- TRY TO INSERT DUPLICATE DATA
INSERT INTO EmployeeTransaction
VALUES (1,'2015-01-01',131)
INSERT INTO EmployeeTransaction
VALUES (1,'2015-01-01',131)

-- DROP CONSTAINT
ALTER TABLE EmployeeTransaction
DROP CONSTRAINT unqTransaction


--CREATION OF CONSTRAINT ON THE CREATION OF THE TABLE
CREATE TABLE EmployeeTransaction2
(Amount smallmoney not null,
 DateOfTransaction smalldatetime not null,
 EmployeeNumber int not null,
 CONSTRAINT unqTransactin2 UNIQUE(Amount,DateOfTransaction,EmployeeNumber))

 DROP TABLE EmployeeTransaction2