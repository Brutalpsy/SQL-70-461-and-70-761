CREATE NONCLUSTERED INDEX inx_tblEmployee_DateOfBirth ON tblEmployee(DateOfBirth)

-- NONCLUSTERED index didn't work
-- it's using CLUSTERED index pk_tblEmployee since it thinks that it will do better for this query
SELECT * FROM tblEmployee
where DateOfBirth >= '19890101' AND DateOfBirth < '19900101'

-- this one is using NONCLUSTERED INDEX inx_tblEmployee_DateOfBirth
SELECT DateOfBirth FROM tblEmployee
where DateOfBirth >= '19890101' AND DateOfBirth < '19900101'

-- using clustered index
SELECT DateOfBirth, Department FROM tblEmployee
where DateOfBirth >= '19890101' AND DateOfBirth < '19900101'


-- But if you need that query to be more performant 
-- you could creatre another non clustered index for those two fields
CREATE NONCLUSTERED INDEX inx_tblEmployee_DateOfBirth_Department ON tblEmployee(DateOfBirth,Department)

-- now it's using the created NONCLUSTERED INDEX inx_tblEmployee_DateOfBirth_Departmen
-- which would lead to way better performance for this query
-- so you can gain perfomance for specific queires by adding non clustered index on those fields
SELECT DateOfBirth, Department FROM tblEmployee
where DateOfBirth >= '19890101' AND DateOfBirth < '19900101'
