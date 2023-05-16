-- task 4: Write a procedure in T-SQL to delete inactive user accounts. The input to the procedure is a date
CREATE PROCEDURE DeleteInactiveUserAccounts
    @inactiveDate DATE
AS
BEGIN
    -- Delete inactive user accounts
    DELETE FROM UserAccounts
    WHERE LastActivityDate <= @inactiveDate;
END;

-- To execute the procedure, you can use the following statement:
EXEC DeleteInactiveUserAccounts @inactiveDate = '2023-01-01';
