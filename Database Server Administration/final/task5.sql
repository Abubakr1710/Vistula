-- Task 5: Write a T-SQL procedure to delete unused databases. The input to the procedure is a date.

CREATE PROCEDURE DeleteUnusedDatabases
    @unusedDate DATE
AS
BEGIN
    -- Declare variables
    DECLARE @databaseName NVARCHAR(128);
    DECLARE @sql NVARCHAR(MAX);

    -- Cursor to loop through databases
    DECLARE dbCursor CURSOR FOR
        SELECT name
        FROM sys.databases
        WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb'); -- Exclude system databases

    OPEN dbCursor;
    FETCH NEXT FROM dbCursor INTO @databaseName;

    -- Loop through databases
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Construct dynamic SQL to check database activity
        SET @sql = N'
            USE ' + QUOTENAME(@databaseName) + ';
            IF NOT EXISTS (
                SELECT 1
                FROM sys.dm_db_index_usage_stats
                WHERE database_id = DB_ID()
            ) AND create_date <= @unusedDate
            BEGIN
                -- Database is unused and meets the unused date criteria, so it can be deleted
                EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = ''' + @databaseName + ''';
                EXEC msdb.dbo.sp_delete_database @database_name = ''' + @databaseName + ''';
            END
        ';

        -- Execute dynamic SQL
        EXEC sp_executesql @sql, N'@unusedDate DATE', @unusedDate;

        FETCH NEXT FROM dbCursor INTO @databaseName;
    END;

    CLOSE dbCursor;
    DEALLOCATE dbCursor;
END;
