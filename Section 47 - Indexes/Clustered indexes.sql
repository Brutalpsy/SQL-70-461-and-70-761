--Without index
SELECT * FROM tblEmployee  -- scan, even though it found it, it goes through all of the table
WHERE EmployeeNumber = 239


CREATE CLUSTERED INDEX inx_tblEmployee ON tblEmployee(EmployeeNumber)

SELECT * FROM tblEmployee -- This is scan, going through entire table

SELECT * FROM tblEmployee  -- Seek
WHERE EmployeeNumber = 239

-- SEEK - Few nubmer of rows based on the index
-- SCAN - Going through the entire table


DROP INDEX inx_tblEmployee ON tblEmployee
---------------------------------------
-- Another way to create clustered index is to create primary key
-- since primary key by default creates an clustered index


-- But the difference between the primary key and the clustered index is that primary key has to be unique!
-- clustered index don't need to be unique
ALTER TABLE [dbo].[tblEmployee]
ADD CONSTRAINT pk_tblEmployee PRIMARY KEY (EmployeeNumber)


SELECT * FROM tblEmployee -- Scan

SELECT * FROM tblEmployee  -- Seek
WHERE EmployeeNumber = 239


--------------------------------------------------------------------------------------------------------
-- TABLES WITHOUT PRIMARY KEY/INDEX ARE HEAPS
-- so its's always a scan on queries, goes through each of the rows
-- using clustered index / primary keys you are convering those tables from heaps to balanced trees 
-- There can only be one CLUSTERED INDEX per table, since there can only be one sorting of the table hence one CLUSTERED INDEX per table
--------------------------------------------------------------------------------------------------------