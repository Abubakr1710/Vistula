-- task 6: Write a procedure in T-SQL to attach and detach a database
-- Procedure to attach a database
CREATE PROCEDURE dbo.AttachDatabase
    @DatabaseName NVARCHAR(128),
    @DatabaseFile NVARCHAR(260)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the database already exists
    IF EXISTS (SELECT 1 FROM sys.databases WHERE name = @DatabaseName)
    BEGIN
        RAISERROR('Database already exists.', 16, 1);
        RETURN;
    END

    -- Attach the database
    EXEC sp_attach_db @dbname = @DatabaseName, @filename1 = @DatabaseFile;
    
    PRINT 'Database attached successfully.';
END
GO

-- Procedure to detach a database
CREATE PROCEDURE dbo.DetachDatabase
    @DatabaseName NVARCHAR(128)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the database exists
    IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = @DatabaseName)
    BEGIN
        RAISERROR('Database does not exist.', 16, 1);
        RETURN;
    END

    -- Detach the database
    EXEC sp_detach_db @dbname = @DatabaseName;

    PRINT 'Database detached successfully.';
END
GO

-- Example usage: Attach a database
EXEC dbo.AttachDatabase
    @DatabaseName = 'EN52493_final_project',
    @DatabaseFile = 'C:\Users\Abubakr\Documents\GitHub\Vistula\Database Server Administration\final\DatabaseFile.mdf';

-- Example usage: Detach a database
EXEC dbo.DetachDatabase
    @DatabaseName = 'EN52493_final_project';
