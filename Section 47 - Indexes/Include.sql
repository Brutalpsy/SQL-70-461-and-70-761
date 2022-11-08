DROP INDEX [pk_tblEmployee] ON tblEmployee

CREATE NONCLUSTERED INDEX inx_EmployeeNumber ON tblEmployee(EmployeeNumber)
INCLUDE(EmployeeFirstName, EmployeeMiddleName, EmployeeLastName)

SELECT EmployeeLastName --USING SEEK TO RETREIVE DATA
FROM tblEmployee
WHERE EmployeeNumber BETWEEN 140 AND 150 

-- ALWAYS USE CLUSTERED INDEX
-- THEY PHYSICALLY CHANGE THE TABLE, NONCLUSTERED DON'T
CREATE CLUSTERED INDEX inx_EmployeeNumber ON tblEmployee(EmployeeNumber)
------------------------------------------------------------------------------------------
-- Another example of INCLUDEs

CREATE NONCLUSTERED INDEX inx_DateOfBirthWithIcludes ON tblEmployee(DateOfBirth)
INCLUDE(EmployeeFirstName, EmployeeMiddleName, EmployeeLastName)

-- uses index seek on DateOfBirth and than it returns also
-- at the leaf level additional fields that we are inluding
SELECT EmployeeFirstName, EmployeeMiddleName, EmployeeLastName 
FROM tblEmployee
WHERE DateOfBirth BETWEEN '19890101' AND '19900101' 


