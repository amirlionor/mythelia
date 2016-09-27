IF COL_LENGTH('table_name', 'column_name') IS NULL
BEGIN
    ALTER TABLE table_name
    ADD [column_name] INT
END