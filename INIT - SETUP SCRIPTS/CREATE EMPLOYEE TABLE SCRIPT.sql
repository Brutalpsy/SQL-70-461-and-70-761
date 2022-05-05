IF NOT EXISTS (
        SELECT *
        FROM sys.databases
        WHERE name = '70-461'
        )
BEGIN
    CREATE DATABASE [70-461]
END
GO

USE [70-461]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 5/5/2022 7:38:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[EmployeeNumber] [int] NOT NULL,
	[EmployeeFirstName] [nvarchar](50) NOT NULL,
	[EmployeeMiddleName] [nvarchar](50) NULL,
	[EmployeeLastName] [nvarchar](50) NOT NULL,
	[EmployeeGovermentId] [char](10) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Department] [varchar](20) NULL
) ON [PRIMARY]
GO


