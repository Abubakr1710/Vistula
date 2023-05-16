-- Task 3: Create a Database Maintenance Plan within T-SQL
-- We can create using the SQL Server Agent and T-SQL statements

-- Step 1: Create a SQL Server Agent Job
USE msdb;
GO

EXEC dbo.sp_add_job
     @job_name = N'Database Maintenance Plan',
     @enabled = 1,
     @description = N'Database Maintenance Plan';

-- Step 2: Create a Job Step for Full Database Backup
EXEC sp_add_jobstep
     @job_name = N'Database Maintenance Plan',
     @step_name = N'Full Database Backup',
     @subsystem = N'TSQL',
     @command = N'BACKUP DATABASE [EN52493_final_project] TO DISK = ''C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\Backup\EN52493_final_project_full.bak'' WITH INIT, COMPRESSION;',
     @on_success_action = 1;

-- Step 3: Create a Job Step for Transaction Log Backup
EXEC sp_add_jobstep
     @job_name = N'Database Maintenance Plan',
     @step_name = N'Transaction Log Backup',
     @subsystem = N'TSQL',
     @command = N'BACKUP LOG [EN52493_final_project] TO DISK = ''C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\Backup\EN52493_final_project_log.trn'' WITH INIT, COMPRESSION;',
     @on_success_action = 1;

-- Step 4: Create a Job Step for Database Integrity Check
EXEC sp_add_jobstep
     @job_name = N'Database Maintenance Plan',
     @step_name = N'Database Integrity Check',
     @subsystem = N'TSQL',
     @command = N'DBCC CHECKDB ([EN52493_final_project]) WITH NO_INFOMSGS;',
     @on_success_action = 1;

-- Step 5: Create a Job Step for Index Maintenance
EXEC sp_add_jobstep
     @job_name = N'Database Maintenance Plan',
     @step_name = N'Index Maintenance',
     @subsystem = N'TSQL',
     @command = N'ALTER INDEX ALL ON [EN52493_final_project] REBUILD;',
     @on_success_action = 1;

-- Step 6: Schedule the Job to Run Daily
USE msdb;
GO

EXEC dbo.sp_add_schedule
     @schedule_name = N'Daily Maintenance',
     @freq_type = 4, -- Daily
     @freq_interval = 1, -- Occurs every 1 day
     @active_start_time = 010000; -- Start time in HHMMSS format

EXEC dbo.sp_attach_schedule
     @job_name = N'Database Maintenance Plan',
     @schedule_name = N'Daily Maintenance';

-- Step 7: Associate the Job with SQL Server Agent
EXEC dbo.sp_add_jobserver
     @job_name = N'Database Maintenance Plan',
     @server_name = N'(local)'; -- Replace with your server name


