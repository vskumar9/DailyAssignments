CREATE DATABASE EcommerceDB;

USE EcommerceDB;

CREATE TABLE CustomerDatails (
CustomerID INT PRIMARY KEY IDENTITY(1, 1),
CustomerName NVARCHAR(100),
Location NVARCHAR(100)
);

CREATE TABLE ProductDetails(
ProductID INT PRIMARY KEY IDENTITY(1, 1),
ProductName VARCHAR(100),
Category VARCHAR(100),
Price DECIMAL(10, 2)
);

CREATE TABLE OrderDetails(
OrderID INT PRIMARY KEY IDENTITY(1, 1),
CustomerID INT,
OrderName VARCHAR(100),
OrderDate DATETIME,
FOREIGN KEY (CustomerID) REFERENCES CustomerDatails(CustomerID)
);

INSERT INTO CustomerDatails (CustomerName, Location) VALUES
('SANJEEV', 'PRODDATUR'), ('JHONE', 'AMERICA'), ('KUMAR', 'MUMBAI');

INSERT INTO ProductDetails (ProductName, Category, Price) VALUES
('Iphone', 'Mobile', 999.99),
('Sumsung', 'Mobile', 899.99),
('JBL Speaker', 'Speaker', 199.99),
('Sony HeadPhones', 'Speaker', 149.99);

INSERT INTO OrderDetails (CustomerID, OrderName, OrderDate) VALUES
(1, 'Iphone Order', GETDATE()),
(2, 'Sumsung Order', GETDATE()),
(1, 'JBL Speaker Order', GETDATE());

SELECT C.CustomerName, O.OrderName FROM CustomerDatails C
LEFT JOIN OrderDetails O ON C.CustomerID = O.CustomerID;

SELECT O.OrderName FROM OrderDetails O
JOIN CustomerDatails C ON O.CustomerID = C.CustomerID
WHERE C.Location = 'PRODDATUR';

SELECT MAX(Price) AS MaxPrice FROM ProductDetails
WHERE Category = 'Mobile';

SELECT * FROM ProductDetails
WHERE ProductName LIKE '%Mobile%' OR ProductName LIKE '%Speaker%';

CREATE OR ALTER FUNCTION CalculateGST(@price DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
BEGIN 
	RETURN @price * 0.10;
END
GO

CREATE OR ALTER PROCEDURE InceasePrices
AS
BEGIN
	UPDATE ProductDetails SET Price = Price + 100;
	SELECT ProductID,ProductName, Price FROM ProductDetails;
END;

SELECT DBO.CalculateGST(999.99) AS GST;

EXEC InceasePrices

DROP TABLE CustomerDatails;
DROP TABLE ProductDetails;
DROP TABLE OrderDetails
DROP FUNCTION CalculateGST
DROP PROCEDURE InceasePrices



