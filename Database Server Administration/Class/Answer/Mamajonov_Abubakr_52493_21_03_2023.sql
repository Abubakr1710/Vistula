-- DATABASE WITH MY ID
--CREATE DATABASE EN52493_21_03_2023 
--I commented out the code inroder to understand correctly please take a look and uncomment every comment with /**/ and run one by one 

--Selecting database and creating table with 5 records in order to see working command later. If you uncomment and run this section you will see records.
/*
USE EN52493_21_03_2023
CREATE TABLE [dbo].[EMPLOYEE](
	[BirthDate] [date] NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
INSERT [dbo].[EMPLOYEE] ([BirthDate], [Gender], [FirstName], [LastName], [JobTitle]) VALUES (CAST(0xE9F70A00 AS Date), N'M', N'Ken', N'Sánchez', N'Chief Executive Officer')
INSERT [dbo].[EMPLOYEE] ([BirthDate], [Gender], [FirstName], [LastName], [JobTitle]) VALUES (CAST(0x7BFB0A00 AS Date), N'F', N'Terri', N'Duffy', N'Vice President of Engineering')
INSERT [dbo].[EMPLOYEE] ([BirthDate], [Gender], [FirstName], [LastName], [JobTitle]) VALUES (CAST(0x2A000B00 AS Date), N'M', N'Roberto', N'Tamburello', N'Engineering Manager')
INSERT [dbo].[EMPLOYEE] ([BirthDate], [Gender], [FirstName], [LastName], [JobTitle]) VALUES (CAST(0x53000B00 AS Date), N'M', N'Rob', N'Walters', N'Senior Tool Designer')
INSERT [dbo].[EMPLOYEE] ([BirthDate], [Gender], [FirstName], [LastName], [JobTitle]) VALUES (CAST(0x99E00A00 AS Date), N'F', N'Gail', N'Erickson', N'Design Engineer')

SELECT * FROM dbo.EMPLOYEE
*/


-- From here procedure for deleting tables starts. Uncomment it and run this section. You will see that affected and previous 5 record will be deleted with table


/*
-- Drop all tables in the database

DECLARE @tableName NVARCHAR(128)
DECLARE @sqlCommand NVARCHAR(500)

DECLARE tableCursor CURSOR FOR
SELECT name FROM SYSOBJECTS WHERE type='U'

OPEN tableCursor

FETCH NEXT FROM tableCursor INTO @tableName

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sqlCommand = 'DROP TABLE ' + @tableName
    EXEC sp_executesql @sqlCommand
    
    FETCH NEXT FROM tableCursor INTO @tableName
END

CLOSE tableCursor
DEALLOCATE tableCursor


*/

--checking if it worked or not. Uncomment it and run this section. If you see error that means it worked successfuly
/*
SELECT * FROM dbo.EMPLOYEE
*/