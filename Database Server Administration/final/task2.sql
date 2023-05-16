-- Task 2: Create Transaction Log Backups of this database

-- Backup the transaction log of EN52493_final_project to the specified file path with compression
BACKUP LOG EN52493_final_project
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\Backup\EN52493_final_project_log_1.trn' --path
WITH INIT, COMPRESSION;

BACKUP LOG EN52493_final_project
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\Backup\EN52493_final_project_log_2.trn' --path
WITH INIT, COMPRESSION;
