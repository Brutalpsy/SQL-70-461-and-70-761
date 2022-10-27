-- CREATION OF SYNONYM FOR EXISTING TABLE
CREATE SYNONYM EmployeeTable
FOR Employee
GO
SELECT * FROM EmployeeTable


--CREATION OF SYNONYM FOR NON EXISTING TABLE
CREATE SYNONYM Something
FOR TableDate

-- SYNONYM 'Something' refers to an invalid object.
SELECT * FROM Something

-- Creation of synonym for remote table 
CREATE SYNONYM RemoteTable
FOR server_name.database_name.schema_name.object_name --OVERTHERE.70-461REMOTE.DBO.tblRemote

