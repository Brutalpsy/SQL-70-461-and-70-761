
-- CHANGE THE TIME IN THE SYSTEM TO PAST, LIKE 1989 OR WHATEVER
-- AND THAN EXECUTE THE TABLE AND ONLY INSERTS
CREATE TABLE [dbo].[EmployeeTemporal](
	[EmployeeNumber] [int] NOT NULL PRIMARY KEY CLUSTERED,
	[EmployeeFirstName] [nvarchar](50) NOT NULL,
	[EmployeeMiddleName] [nvarchar](50) NULL,
	[EmployeeLastName] [nvarchar](50) NOT NULL,
	[EmployeeGovermentId] [char](10) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Department] [varchar](20) NULL,
	ValidFrom DateTime2(2) GENERATED ALWAYS AS ROW START HIDDEN, -- WE CAN HIDE THESE FIELDS FROM THE END USER
	ValidTo Datetime2(2) GENERATED ALWAYS AS ROW END HIDDEN,  -- WE CAN HIDE THESE FIELDS FROM THE END USER
	PERIOD FOR SYSTEM_TIME (ValidFrom,ValidTo))
	WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.EmployeeHistory))



	INSERT INTO [dbo].[EmployeeTemporal]
           ([EmployeeNumber]
           ,[EmployeeFirstName]
           ,[EmployeeMiddleName]
           ,[EmployeeLastName]
           ,[EmployeeGovermentId]
           ,[DateOfBirth]
           ,[Department])
	VALUES
(123,'Jane',NULL,'Zwilling','AB123456G', '1985-01-01','Commercial'),
(124,'Carolyn','Andrea', 'Zimmerman','AB234578H' ,'1975-06-01','Litigation'),
(128,'Jane',NULL,'Zabokritski','JX142740G','1980-03-20','Commercial'),
(125,'Roberto',	NULL,	'Young'	,'VO928631C' 	,'1984-09-22'	,'Commercial')

-- UPDATE THE TIME TO CURRENT TIME AND THAN EXECUTE UPDATES
UPDATE EmployeeTemporal 
SET EmployeeLastName = 'Smith' WHERE EmployeeNumber = 124
UPDATE EmployeeTemporal 
SET EmployeeLastName = 'Albert' WHERE EmployeeNumber = 124


--Querying temporal data between time periods
--SELECT * FROM Employee
--FOR SYSTEM_TIME
--FROM startdatetime TO enddatetime
--BETWEEN startdatetime AND enddatetime
--CONTAINED IN (startdatetime, enddatetime)


-- SHOW HOW "Carolyn" DATA CHANGED OVER TIME
SELECT * FROM EmployeeTemporal
FOR SYSTEM_TIME
FROM '19920101' TO '20230101'
WHERE EmployeeNumber = 124

-- OR WITH DIFFERENT SYNTAX -> SAME RESULT
SELECT * FROM EmployeeTemporal
FOR SYSTEM_TIME
BETWEEN '19920101' AND'20230101'
WHERE EmployeeNumber = 124


SELECT * FROM EmployeeTemporal
FOR SYSTEM_TIME
CONTAINED IN('19920101','20230101') 
WHERE EmployeeNumber = 124

---------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ------------------- ----------- -------------------- --------------------------- ---------------------------
--124,Carolyn,Andrea,Smith,AB234578H,1975-06-01,Litigation,022-11-05 23:29:42.37,9999-12-31 23:59:59.99
--124,Carolyn,Andrea,Zimmerman,AB234578H,1975-06-01,Litigation,1992-11-05 23:25:37.44,2022-11-05 23:25:58.99
--124,Carolyn,Andrea,Smith,AB234578H,1975-06-01,Litigation,2022-11-05 23:25:58.99,2022-11-05 23:29:40.67
--124,Carolyn,Andrea,Albert,AB234578H,1975-06-01,Litigation,2022-11-05 23:29:40.67,2022-11-05 23:29:42.37



