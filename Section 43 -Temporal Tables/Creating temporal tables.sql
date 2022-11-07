CREATE TABLE [dbo].[EmployeeTemporal](
	[EmployeeNumber] [int] NOT NULL PRIMARY KEY CLUSTERED,
	[EmployeeFirstName] [nvarchar](50) NOT NULL,
	[EmployeeMiddleName] [nvarchar](50) NULL,
	[EmployeeLastName] [nvarchar](50) NOT NULL,
	[EmployeeGovermentId] [char](10) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Department] [varchar](20) NULL,
	ValidFrom DateTime2(2) GENERATED ALWAYS AS ROW START ,
	ValidTo Datetime2(2) GENERATED ALWAYS AS ROW END,
	PERIOD FOR SYSTEM_TIME (ValidFrom,ValidTo))
	WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.EmployeeHistory)) -- you can name history table was you want



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

SELECT * FROM EmployeeTemporal

UPDATE EmployeeTemporal 
SET EmployeeLastName = 'Smith' WHERE EmployeeNumber = 124
UPDATE EmployeeTemporal 
SET EmployeeLastName = 'Albert' WHERE EmployeeNumber = 124

DROP TABLE EmployeeTemporal