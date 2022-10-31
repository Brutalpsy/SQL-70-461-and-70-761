--B-C-P
--BULK COPY PROGRAMME

--EXPORT DATA WITH CMD
--This will export the data from department table into a mydata.out
-- N -> unicode characters
-- T -> trusted connection, windows authentication
--bcp [70-461].dbo.Department out mydata.out -N -T


-- CREATE TABLE TO STORE THE DATA
CREATE TABLE Department2
(Department VARCHAR(19) NULL,
 DepartmentHead VARCHAR(19) NULL)

-- IMPORT DATA 
--bcp [70-461].dbo.Department2 in mydata.out -N -T


SELECT * FROM Department2

