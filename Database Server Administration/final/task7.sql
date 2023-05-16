-- task 7: Write a procedure in T-SQL for creating and restoring a this database backup.

CREATE PROCEDURE CreateAndRestoreDatabaseBackup
    @databaseName NVARCHAR(100),
    @backupPath NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    -- Variables
    DECLARE @backupFileName NVARCHAR(500);
    DECLARE @restoreFileName NVARCHAR(500);

    -- Create backup
    SET @backupFileName = @backupPath + @databaseName + '_backup.bak';
    BACKUP DATABASE @databaseName TO DISK = @backupFileName WITH FORMAT, COMPRESSION;
    PRINT 'Database backup created successfully.';

    -- Restore backup
    SET @restoreFileName = @backupPath + @databaseName + '_restore.bak';
    RESTORE DATABASE @databaseName FROM DISK = @restoreFileName WITH REPLACE;
    PRINT 'Database restore completed successfully.';
END;


-- To execute the procedure, you can use the following statement:

EXEC CreateAndRestoreDatabaseBackup @databaseName = 'EN52493_final_project', @backupPath = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\Backup\EN52493_final_project';
