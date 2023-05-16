--Creating Database with my id and date
CREATE DATABASE EN52493_20_04_2023

--Using my database
USE EN52493_20_04_2023

--Creating table
CREATE TABLE CHECKPERFORMANCE (
  keyField INT PRIMARY KEY,
  [date] DATE,
  Name1 VARCHAR(255),
  Name2 VARCHAR(40)
);

--Generating random data
CREATE PROCEDURE GenerateRandomData
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @rowCount INT = 1000000;
  DECLARE @counter INT = 1;

  WHILE @counter <= @rowCount
  BEGIN
    INSERT INTO CHECKPERFORMANCE (keyField, [date], Name1, Name2)
    VALUES (
      @counter,
      DATEADD(DAY, @counter, '2023-01-01'), -- Modify as per your date requirements
      'Name1_' + CAST(@counter AS VARCHAR(10)),
      'Name2_' + CAST(@counter AS VARCHAR(10))
    );
    SET @counter = @counter + 1;
  END
END;

--Checking Search Performance with Index:
CREATE INDEX IX_CHECKPERFORMANCE_Date ON CHECKPERFORMANCE ([date]);

--Checking Search Performance without Index:
DROP INDEX IX_CHECKPERFORMANCE_Date ON CHECKPERFORMANCE;

--Displaying Inserted Data:
SELECT * FROM CHECKPERFORMANCE;

