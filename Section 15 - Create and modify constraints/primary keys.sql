-- ADD PRIMARY KEY TO AN EXISTING TABLE
ALTER TABLE Employee
ADD CONSTRAINT pk_Employee PRIMARY KEY (EmployeeNumber)

SELECT *
FROM Employee

-- INSERT TWO TIMES THE SAME EmployeeNumber value
INSERT INTO Employee VALUES(2,'DA','DA','DA',1,'20110101','HR')
INSERT INTO Employee VALUES(2,'DA','DA','DA',2,'20110101','HR')

ALTER TABLE Employee
DROP CONSTRAINT pk_Employee

DELETE 
FROM Employee
WHERE EmployeeNumber = 2

--CREATE NEW TABLE WITH PRIMARY KEY WITH AUTO INCREMENT NUMBER
CREATE TABLE Employee2
(EmployeeNumber INT CONSTRAINT pk_Employee2 PRIMARY KEY IDENTITY(1,1), -- START AT 1, INCREASE BY 1
EmployeeName NVARCHAR(50))

SELECT * FROM Employee2

INSERT INTO Employee2 VALUES('MITA'),('STEVA');

-- DELETE THE RECORDS BUT DOESN'T RESET IDENTITY COLUMN 
DELETE FROM Employee2

-- RESETS THE IDENTITY COLUMN 
TRUNCATE TABLE Employee2

-- TRY TO INSERT INTO A TABLE CUSTOM VALUE INTO IDENTITY COLUMN
INSERT INTO Employee2 (EmployeeNumber, EmployeeName)
VALUES (5,'MITA'), (6,'STEVA')

-- THE THING THAT WORKS WITH SETTING SET IDENTITY_INSERT ON
-- SO THE NEXT TIME YOU TRY TO INSERT A NEW ROW, IT WILL CONTINUE FROM THE LAST NUMBER IN THE TABLE
SET IDENTITY_INSERT Employee2 ON
INSERT INTO Employee2 (EmployeeNumber, EmployeeName)
VALUES (5,'MITA'), (6,'STEVA')
SET IDENTITY_INSERT Employee2 OFF

SELECT * FROM Employee2


DROP TABLE Employee2

--FIND THE LAST IDENTITY USED - DOESNT CARE FOR THE TABLE, JUST GIVES THE LAST USED/UPDATED GLOBALLY
SELECT @@IDENTITY
SELECT SCOPE_IDENTITY()
-- LAST USED IDENTITY FOR PARTICULAR TABLE
SELECT IDENT_CURRENT('DBO.Employee2')

