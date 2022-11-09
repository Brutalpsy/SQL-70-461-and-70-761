-- DROPPING ALL INDEXES EXCEPT CLUSTERED
DROP INDEX [idx_LastNameForHR] ON tblEmployee
DROP INDEX [ind_tblEmployee] ON tblEmployee
DROP INDEX [inx_DateOfBirthWithIcludes] ON tblEmployee
DROP INDEX [inx_tblEmployee_DateOfBirth] ON tblEmployee
DROP INDEX [inx_tblEmployee_DateOfBirth_Department] ON tblEmployee
DROP INDEX [inx_EmployeeNumber] ON tblEmployee
---------------------------------------------------------------------------------------------
-- TAKE A LOOK AT EXECUTION PLAN CTRL + M
-- THIS ONE IS HASH MATCH
-- JOINS THE TABLES, SORTS THEM AND CONVERTS THE ROWS TOGETHER
-- LEAST EFFICENT
SELECT  * FROM tblEmployee AS E
LEFT JOIN tblDepartment AS D ON D.Department = E.Department

-- HASH MATCH
SELECT  D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName FROM tblEmployee AS E
LEFT JOIN tblDepartment AS D ON D.Department = E.Department




