CREATE DATABASE [db_sql_23_04]
GO

USE [db_sql_23_04]
GO

-- The stored procedure prints "Hello, world!"
CREATE PROCEDURE HelloWorld
AS
BEGIN
    PRINT 'Hello, world!'
END
GO

-- The stored procedure returns information about the current time
CREATE PROCEDURE GetCurrentTime
AS
BEGIN
    SELECT GETDATE() AS CurrentTime
END
GO

-- A stored procedure returns information about the current date
CREATE PROCEDURE GetCurrentDate
AS
BEGIN
    SELECT CONVERT(date, GETDATE()) AS CurrentDate
END
GO

-- The stored procedure takes three numbers and returns their sum
CREATE PROCEDURE CalculateSum
    @Num1 INT,
    @Num2 INT,
    @Num3 INT
AS
BEGIN
    SELECT @Num1 + @Num2 + @Num3 AS Sum
END
GO

-- The stored procedure takes three numbers and returns the arithmetic mean of three numbers
CREATE PROCEDURE CalculateAverage
    @Num1 INT,
    @Num2 INT,
    @Num3 INT
AS
BEGIN
    SELECT CAST((@Num1 + @Num2 + @Num3) AS FLOAT) / 3 AS Average
END
GO

-- The stored procedure takes three numbers and returns the maximum value
CREATE PROCEDURE FindMax
    @Num1 INT,
    @Num2 INT,
    @Num3 INT
AS
BEGIN
    SELECT MAX(val) AS MaxValue
    FROM (VALUES (@Num1), (@Num2), (@Num3)) AS value(val)
END
GO

-- The stored procedure takes three numbers and returns the minimum value
CREATE PROCEDURE FindMin
    @Num1 INT,
    @Num2 INT,
    @Num3 INT
AS
BEGIN
    SELECT MIN(val) AS MinValue
    FROM (VALUES (@Num1), (@Num2), (@Num3)) AS value(val)
END
GO

-- The stored procedure takes a number and a symbol and outputs a line of length equal to the number
CREATE PROCEDURE DrawLine
    @Length INT,
    @Symbol CHAR(1)
AS
BEGIN
    DECLARE @Line VARCHAR(255)
    SET @Line = REPLICATE(@Symbol, @Length)
    PRINT @Line
END
GO

-- The stored procedure takes a number as a parameter and returns its factorial
CREATE PROCEDURE CalculateFactorial
    @Number INT
AS
BEGIN
    DECLARE @Result BIGINT = 1
    DECLARE @Counter INT = 1

    WHILE @Counter <= @Number
    BEGIN
        SET @Result = @Result * @Counter
        SET @Counter = @Counter + 1
    END

    SELECT @Result AS Factorial
END
GO

-- The stored procedure takes two numeric parameters. The first parameter is a number. The second parameter is the degree. The procedure returns a number reduced to a power
CREATE PROCEDURE CalculatePower
    @Base INT,
    @Exponent INT
AS
BEGIN
    DECLARE @Result BIGINT = 1
    DECLARE @Counter INT = 1

    WHILE @Counter <= @Exponent
    BEGIN
        SET @Result = @Result * @Base
        SET @Counter = @Counter + 1
    END

    SELECT @Result AS Result
END
GO
