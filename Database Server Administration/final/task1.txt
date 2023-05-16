--1. Create Full Backups Using T-SQL.
-- Create a new database named EN52493_final_project
CREATE DATABASE EN52493_final_project;

-- Backup the EN52493_final_project database to a specific file path
BACKUP DATABASE EN52493_final_project --initiates a backup operation for the "EN52493_final_project" database.
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\Backup\EN52493_final_project_full.bak' -- Path
WITH FORMAT, COMPRESSION; --The WITH FORMAT option indicates that a new media set will be created and any existing backup sets will be overwritten.
--The COMPRESSION option specifies that the backup should be compressed to reduce the backup file size and save storage space.