CREATE DATABASE [db_sql_23_04]
GO

-- Stored procedure displays complete information about all products
CREATE PROCEDURE ShowAllGoods
AS
BEGIN
    SELECT Name, Type, Quantity, ProdCost AS CostPrice, Manufacturer, Price
    FROM Goods;
END;
GO

-- Saved procedure shows the top 3 oldest customers
CREATE PROCEDURE ShowGoodsByType
    @ItemType NVARCHAR(50)
AS
BEGIN
    SELECT Name, Type, Quantity, ProdCost AS CostPrice, Manufacturer, Price
    FROM Goods
    WHERE Type = @ItemType;
END;
GO

-- Saved procedure shows the top 3 oldest customers
CREATE PROCEDURE ShowTop3OldestCustomers
AS
BEGIN
    SELECT TOP 3 Email, Phone AS ContactPhone, Gender, PurchaseHistory AS OrderHistory, DiscountPercentage, SignedForMailing
    FROM Customers
    ORDER BY EmploymentDate ASC;
END;
GO

-- Saved procedure shows information about the most successful seller
CREATE PROCEDURE ShowMostSuccessfulSeller
AS
BEGIN
    SELECT TOP 1 e.FullName AS SellerName, SUM(s.Price * s.Quantity) AS TotalSales
    FROM Sales s
    JOIN Employees e ON s.SellerId = e.EmployeeId
    GROUP BY e.FullName
    ORDER BY TotalSales DESC;
END;
GO

-- The stored procedure checks whether at least one product from the specified manufacturer is in stock
CREATE PROCEDURE CheckIfManufacturerGoodsAvailable
    @Manufacturer NVARCHAR(100)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Goods WHERE Manufacturer = @Manufacturer)
        PRINT 'yes'
    ELSE
        PRINT 'no'
END;
GO

-- The stored procedure displays information about the most popular manufacturer among buyers
CREATE PROCEDURE ShowMostPopularManufacturer
AS
BEGIN
    SELECT TOP 1 g.Manufacturer, SUM(s.Price * s.Quantity) AS TotalSales
    FROM Sales s
    JOIN Goods g ON s.Name = g.Name
    GROUP BY g.Manufacturer
    ORDER BY TotalSales DESC;
END;
GO

-- The saved procedure deletes all customers registered after the specified date
-- and returns the number of deleted records 
CREATE PROCEDURE DeleteCustomersRegisteredAfterDate
    @RegistrationDate DATE
AS
BEGIN
    DECLARE @DeletedCount INT;

    DELETE FROM Customers
    WHERE EmploymentDate > @RegistrationDate;

    SET @DeletedCount = @@ROWCOUNT;
    SELECT @DeletedCount AS DeletedRecordsCount;
END;
GO