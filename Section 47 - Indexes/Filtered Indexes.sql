SELECT EmployeeLastName
FROM tblEmployee
WHERE Department = 'HR' --scan -> clustered index from PK

-- THIS IS CALLED FILTERED INDEX
-- CAN INCREASE QUERY PERFORMANCE
-- REDUCES MEINTANCE COST, SINCE IT'S NOT INCLUDING  WHOLE TABLE (if you insert another person that is not part of HR, than this index wont need to update at all)
-- REDUCES STORAGE COST, since only partial data is stored
CREATE NONCLUSTERED INDEX idx_LastNameForHR ON tblEmployee(EmployeeLastName)
WHERE Department = 'HR'


-- After adding NONCLUSTERED INDEX idx_LastNameForHR  
SELECT EmployeeLastName
FROM tblEmployee
WHERE Department = 'HR' -- index scan from idx_LastNameForHR