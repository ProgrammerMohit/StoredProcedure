#CREATE DATABASE SalesAnalysis-- 
#USE SalesAnalysis

# COMMODITY TABLES
-- CREATE TABLE Commodity (
--     CommodityID INT PRIMARY KEY AUTO_INCREMENT,
--     Name VARCHAR(100) NOT NULL,
--     Price DECIMAL(10,2) NOT NULL
-- );
# VENDOR TABLES
-- CREATE TABLE Vendor (
--     VendorID INT PRIMARY KEY AUTO_INCREMENT,
--     Name VARCHAR(100) NOT NULL,
--     Location VARCHAR(100) NOT NULL
-- );
# CUSTOMER TABLES
-- CREATE TABLE Customer (
--     CustomerID INT PRIMARY KEY AUTO_INCREMENT,
--     Name VARCHAR(100) NOT NULL,
--     Address VARCHAR(255) -- NULL allowed
-- );
# SALES TABLES
-- CREATE TABLE Sales (
--     SalesID INT PRIMARY KEY AUTO_INCREMENT,
--     VendorID INT,
--     CommodityID INT,
--     Quantity INT NOT NULL,
--     CustomerID INT,
--     FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
--     FOREIGN KEY (CommodityID) REFERENCES Commodity(CommodityID),
--     FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
-- );
-- SHOW TABLES;
INSERT INTO Commodity (Name, Price) VALUES 
('Laptop', 50000), 
('Mobile', 20000), 
('Tablet', 15000);

INSERT INTO Vendor (Name, Location) VALUES 
('Vendor1', 'Mumbai'), 
('Vendor2', 'Delhi'), 
('Vendor3', 'Bangalore');

INSERT INTO Customer (Name, Address) VALUES 
('Pritam', 'Kolkata'), 
('Tanoy', 'Sikkim'), 
('Customer3', NULL);

INSERT INTO Sales (VendorID, CommodityID, Quantity, CustomerID) VALUES 
(1, 1, 5, 1), 
(2, 2, 10, 2), 
(3, 3, 8, 3),
(1, 2, 7, 2), 
(2, 1, 4, 1);
SELECT * FROM Customer;
-- SP for GetMonthlySales
DELIMITER //
CREATE PROCEDURE GetMonthlySales()
BEGIN
    SELECT 
        MONTH(CURDATE()) AS SaleMonth,
        C.Name AS CommodityName,
        SUM(S.Quantity) AS TotalQuantity
    FROM Sales S
    JOIN Commodity C ON S.CommodityID = C.CommodityID
    GROUP BY SaleMonth, C.Name
    ORDER BY TotalQuantity DESC
    LIMIT 2;
END //

DELIMITER ;
CALL GetMonthlySales();

-- SP for GetLocationWiseSales
DELIMITER //

CREATE PROCEDURE GetLocationWiseSales()
BEGIN
    SELECT 
        V.Location,
        SUM(S.Quantity) AS TotalQuantity
    FROM Sales S
    JOIN Vendor V ON S.VendorID = V.VendorID
    GROUP BY V.Location
    ORDER BY TotalQuantity DESC
    LIMIT 2;
END //

DELIMITER ;
-- SP for GetCustomerWiseSales
DELIMITER //

CREATE PROCEDURE GetCustomerWiseSales()
BEGIN
    SELECT 
        C.Name AS CustomerName,
        SUM(S.Quantity) AS TotalQuantity
    FROM Sales S
    JOIN Customer C ON S.CustomerID = C.CustomerID
    GROUP BY C.Name
    ORDER BY TotalQuantity DESC
    LIMIT 2;
END //

DELIMITER ;
CALL GetCustomerWiseSales();
SHOW PROCEDURE STATUS WHERE Db = 'SalesAnalysis';











