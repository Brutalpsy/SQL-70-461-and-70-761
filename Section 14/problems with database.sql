select * from Employee 

--PROBLEM #1
select T.EmployeeNumber as TEmployeeNumber,
       E.EmployeeNumber as EEmployeeNumber,
	   sum(Amount) as SumAmount
from EmployeeTransaction AS T
LEFT JOIN Employee AS E
ON T.EmployeeNumber = E.EmployeeNumber
group by T.EmployeeNumber, E.EmployeeNumber
order by EEmployeeNumber

--PROBLEM #2
BEGIN TRAN
UPDATE Employee
SET DateOfBirth = '2101-01-01'
OUTPUT inserted.*,deleted.*
WHERE EmployeeNumber = 537

SELECT * FROM Employee ORDER BY DateOfBirth DESC

ROLLBACK TRAN

--PROBLEM #3
BEGIN TRAN
UPDATE Employee
SET EmployeeGovermentId = 'AAAAAA'
OUTPUT inserted.*, deleted.*
WHERE EmployeeNumber BETWEEN 530 AND 539

SELECT * FROM Employee ORDER BY EmployeeGovermentId ASC

ROLLBACK TRAN

-- TRY OF INSERTING NULL INTO THE FIRST COLUMN - EMPLOYEE NUMBER #1
INSERT INTO Employee
SELECT NULL, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeGovermentId, DateOfBirth, Department
FROM Employee

-- TRY OF INSERTING NULL INTO THE FIRST COLUMN - EMPLOYEE NUMBER #2
INSERT INTO Employee
values (2001, 'FirstName', 'M', 'LastName', 'AB123456C', '1994-01-01', 'Commerical'),
(NULL, 'AnotherFirstName', 'N', 'AnotherLastName', 'AB123457C', '1994-01-02', 'Finance')
