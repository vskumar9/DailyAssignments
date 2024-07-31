-- Create a new database 
CREATE DATABASE SCM;

drop database SCM;

-- Use new created database
USE SCM;

-- Create supplier table
CREATE TABLE supplier(
supplierId varchar(25) PRIMARY KEY,
supplierName varchar(50) NOT NULL,
contactPerson varchar(50),
email varchar(50) UNIQUE,
phone bigint UNIQUE
);

-- Create industrial_goods table
CREATE TABLE industrial_goods(
industryId varchar(25) PRIMARY KEY,
industry varchar(50) UNIQUE,
industry_description varchar(255) 
);

-- Create consumer_goods table
CREATE TABLE consumer_goods(
consumerId varchar(25) PRIMARY KEY,
consumerGoods varchar(50) UNIQUE,
consumer_description varchar(255) 
);

-- Create products table
CREATE TABLE products(
productId varchar(25) PRIMARY KEY, 
productName varchar(50) NOT NULL, 
productDescription varchar(255), 
unitPrice FLOAT DEFAULT 0
);


-- Create product information
CREATE TABLE products_information(
productInfoId varchar(25) PRIMARY KEY,
productId varchar(25),
supplierId varchar(25),
industryId varchar(25),
consumerId varchar(25),
CONSTRAINT FK_productId FOREIGN KEY (productId) REFERENCES products(productId) ON DELETE CASCADE,
CONSTRAINT FK_supplier FOREIGN KEY (supplierId) REFERENCES supplier(supplierId) ON DELETE CASCADE,
CONSTRAINT FK_industrialGoods FOREIGN KEY (industryId) REFERENCES industrial_goods(industryId) ON DELETE CASCADE,
CONSTRAINT FK_consumerGoods FOREIGN KEY (consumerId) REFERENCES consumer_goods(consumerId)ON DELETE CASCADE
);


-- Create Inventory table
CREATE TABLE inventory(
inventoryId varchar(25) PRIMARY KEY,
productId varchar(25),
quntityInStock bigint DEFAULT 0,
lastStockUpdate datetime DEFAULT GETDATE(),
CONSTRAINT Fk_inventory_productId FOREIGN KEY (productId) REFERENCES products(productId) ON DELETE CASCADE
);

-- Create warehouse table
CREATE TABLE warehouse(
warehouseId varchar(25) PRIMARY KEY,
warehouseName varchar(30),
location varchar(100),
capacity bigint,
currentCapacity bigint
);

-- Create warehouse_storage table
CREATE TABLE warehouse_storage(
warehouseId varchar(25),
inventoryId varchar(25),
CONSTRAINT Fk_warehouseId FOREIGN KEY (warehouseId) REFERENCES warehouse(warehouseId) ON DELETE CASCADE,
CONSTRAINT Fk_inventoryId FOREIGN KEY (inventoryId) REFERENCES inventory(inventoryId) ON DELETE CASCADE
);

-- Create customer table
CREATE TABLE customer (
customerID VARCHAR(25) PRIMARY KEY,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone BIGINT UNIQUE NOT NULL,
address VARCHAR(255),
city VARCHAR(50),
state VARCHAR(50),
zipCode VARCHAR(20)
);


-- Create orders table
CREATE TABLE orders(
orderId VARCHAR(25) PRIMARY KEY,
customerId VARCHAR(25),
orderDate  datetime DEFAULT GETDATE(),
totalAmount BIGINT DEFAULT 0,
orderStatus VARCHAR(25),
CONSTRAINT Fk_customerId FOREIGN KEY (customerId) REFERENCES customer(customerId) ON DELETE CASCADE
);

-- Create order_details table
CREATE TABLE order_details(
orderId VARCHAR(25),
productId VARCHAR(25),
quantity INT,
CONSTRAINT Fk_orderId FOREIGN KEY (orderId) REFERENCES orders(orderId) ON DELETE CASCADE,
CONSTRAINT Fk_order_productId FOREIGN KEY (productId) REFERENCES products(productId) ON DELETE CASCADE
);

-- Create carriers table
CREATE TABLE carriers (
carrierID VARCHAR(25) PRIMARY KEY,
carrierName VARCHAR(255) NOT NULL,
contactPerson VARCHAR(100),
contactEmail VARCHAR(100) UNIQUE,
contactPhone VARCHAR(20) UNIQUE
);

CREATE TABLE transport (
shipmentId VARCHAR(25) PRIMARY KEY,
carrierID VARCHAR(25),
shipmentStatus VARCHAR(15),
CONSTRAINT Fk_carriedId FOREIGN KEY (carrierID) REFERENCES carriers(carrierID) ON DELETE CASCADE
);

CREATE TABLE shipment (
shipmentId VARCHAR(25),
orderId VARCHAR(25),
CONSTRAINT Fk_shipmentId FOREIGN KEY (shipmentId) REFERENCES transport(shipmentId) ON DELETE CASCADE,
CONSTRAINT Fk_shipment_orderId FOREIGN KEY (orderId) REFERENCES orders(orderId) ON DELETE CASCADE
);


-- Show tables in database
SELECT * FROM sys.tables;


select * from products_information;
select * from products;
select * from supplier;
select * from industrial_goods;
select * from consumer_goods;
select * from inventory;
select * from warehouse;
select * from warehouse_storage;
select * from customer;
select * from orders;
select * from order_details;
select * from carriers;
select * from transport;
select * from shipment;

------------------------------------------------------- Suppllier module -----------------------------------------------------------------------
-- Inserting values into the supplier table
INSERT INTO supplier (supplierId, supplierName, contactPerson, email, phone) VALUES
('SUP1234567890', 'Acme Supplies', 'Alice Johnson', 'alice.johnson@acmesupplies.com', 9876543210),
('SUP1234567891', 'Global Corp', 'Bob Smith', 'bob.smith@globalcorp.com', 9876543211),
('SUP1234567892', 'Tech Gadgets Inc.', 'Charlie Brown', 'charlie.brown@techgadgets.com', 9876543212);

-- Deleting a supplier using supplierId
DELETE FROM supplier
WHERE supplierId = 'SUP1234567890';

-- Updating supplier details
UPDATE supplier
SET 
    supplierName = 'Sanjeev pvt',
    contactPerson = 'Jay',
    email = 'sanjeev@gmail.com',
    phone = 1234567890
WHERE supplierId = 'SUP1234567890';

-- Select all details for all suppliers
SELECT * FROM supplier;


-- Select details for a specific supplier
SELECT * FROM supplier WHERE supplierId = 'SUP1234567890';

SELECT * FROM supplier WHERE supplierName LIKE '%a%';




-- Select details for suppliers with a specific contact person
SELECT * FROM supplier
WHERE LOWER(contactPerson) = LOWER('JAY');

-- Select details for suppliers with a specific domain in email
SELECT * FROM supplier
WHERE email LIKE '%@gmail.com';

-- Select all suppliers sorted by supplierName
SELECT * FROM supplier
ORDER BY supplierName ASC;

-- Select unique supplier names
SELECT DISTINCT supplierName FROM supplier;


------------------------------------------------------- Product Module ---------------------------------------------------------------------------
-- Insert a new product into the products table
INSERT INTO products (productId, productName, productDescription, unitPrice)
VALUES ('PROD1234567891', 'Standard Widget', 'Affordable widget for everyday use', 29.99),
('PROD1234567890', 'Advanced Widget', 'High-tech widget for advanced applications', 99.99),
('PROD1234567892', 'Basic Gadget', 'Simple gadget for basic tasks', 19.99),
('PROD1234567893', 'Premium Widget', 'High-end widget with advanced features', 199.99),
('PROD1234567894', 'Eco-Friendly Widget', 'Environmentally friendly widget with sustainable materials', 89.99),
('PROD1234567895', 'Smart Gadget', 'Gadget with smart technology and connectivity', 149.99),
('PROD1234567896', 'Compact Widget', 'Compact and portable widget for easy transport', 39.99),
('PROD1234567897', 'Industrial Strength Widget', 'Durable widget designed for industrial applications', 299.99),
('PROD1234567898', 'Mini Gadget', 'Small-sized gadget with essential features', 9.99),
('PROD1234567899', 'Deluxe Widget', 'Luxury widget with premium finish', 399.99),
('PROD1234567800', 'Advanced Gadget', 'Next-generation gadget with cutting-edge technology', 249.99);

-- Insert data into consumer_goods table
INSERT INTO consumer_goods (consumerId, consumerGoods, consumer_description)
VALUES ('CONSUM1234567890', 'Consumer Product A', 'Description of Consumer Product A');
-- Insert data into industrial_goods table
INSERT INTO industrial_goods (industryId, industry, industry_description)
VALUES ('IND1234567890', 'High-Tech Electronics', 'High-tech electronics for industrial applications.');


-- Insert product information for an industrial good
INSERT INTO products_information (productInfoId, productId, supplierId, industryId, consumerId)
VALUES ('PROINFO1234567890', 'PROD1234567890', 'SUP1234567890', 'IND1234567890', NULL);
-- Insert product information for a consumer good
INSERT INTO products_information (productInfoId, productId, supplierId, industryId, consumerId)
VALUES ('PROINFO1234567891', 'PROD1234567890', 'SUP1234567890', NULL, 'CONSUM1234567890');

-- select all values
select * from products_information;
select * from products;
select * from industrial_goods;
select * from consumer_goods;

-- Create or replace the stored procedure to add product and goods information
GO
CREATE PROCEDURE AddProductAndGoods
    @productInfoId VARCHAR(25),
    @productId VARCHAR(25),
    @productName VARCHAR(50),
    @productDescription VARCHAR(255),
    @unitPrice FLOAT,
    @supplierId VARCHAR(25),
    @industryId VARCHAR(25) = NULL,
    @consumerId VARCHAR(25) = NULL,
    @industryName VARCHAR(50) = NULL,
    @industryDescription VARCHAR(255) = NULL,
    @consumerGoodsName VARCHAR(50) = NULL,
    @consumerDescription VARCHAR(255) = NULL
AS
BEGIN
    -- Declare a variable to capture the message
    DECLARE @message VARCHAR(255);

    -- Start a transaction to ensure data consistency
    BEGIN TRANSACTION;

    -- Check if the supplier exists
    IF NOT EXISTS (SELECT 1 FROM supplier WHERE supplierId = @supplierId)
    BEGIN
        -- Set message and rollback transaction if supplier does not exist
        SET @message = 'Data not added: Supplier does not exist.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- Check if the product already exists
        IF NOT EXISTS (SELECT 1 FROM products WHERE productId = @productId)
        BEGIN
            -- Insert the new product if it doesn't exist
            INSERT INTO products (productId, productName, productDescription, unitPrice)
            VALUES (@productId, @productName, @productDescription, @unitPrice);
        END

        -- Check if the industry goods exist if an industryId is provided
        IF @industryId IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM industrial_goods WHERE industryId = @industryId)
            BEGIN
                -- Insert new industry goods if it doesn't exist
                INSERT INTO industrial_goods (industryId, industry, industry_description)
                VALUES (@industryId, @industryName, @industryDescription);
            END
        END

        -- Check if the consumer goods exist if a consumerId is provided
        IF @consumerId IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM consumer_goods WHERE consumerId = @consumerId)
            BEGIN
                -- Insert new consumer goods if it doesn't exist
                INSERT INTO consumer_goods (consumerId, consumerGoods, consumer_description)
                VALUES (@consumerId, @consumerGoodsName, @consumerDescription);
            END
        END

        -- Insert product information with user-provided productInfoId
        INSERT INTO products_information (productInfoId, productId, supplierId, industryId, consumerId)
        VALUES (@productInfoId, @productId, @supplierId, @industryId, @consumerId);

        -- Set success message and commit the transaction
        SET @message = 'Data successfully added.';
        COMMIT TRANSACTION;
    END

    -- Return the message
    SELECT @message AS ResultMessage;
END;
GO


-- Execute the stored procedure
EXEC AddProductAndGoods
    @productInfoId = 'INFO1234567890',
    @productId = 'PROD1234567870',
    @productName = 'Advanced Widget',
    @productDescription = 'High-tech widget for advanced applications',
    @unitPrice = 99.99,
    @supplierId = 'SUP1234567890',
    @industryId = 'IND1234567890',
    @consumerId = NULL,
    @industryName = 'High-Tech Widgets',
    @industryDescription = 'Advanced widgets for high-tech industries',
    @consumerGoodsName = NULL,
    @consumerDescription = NULL;


-- Delete a specific record by productInfoId
DELETE FROM products_information
WHERE productInfoId = 'PROINFO1234567890';


-- Update a specific record by productInfoId
UPDATE products_information
SET 
    productId = 'PROD1234567870',
    supplierId = 'SUP1234567890',
    industryId = 'IND1234567890',
    consumerId = NULL
WHERE productInfoId = 'INFO1234567890';

-- Update records by productId
UPDATE products_information
SET 
    supplierId = 'SUP1234567890',
    industryId = 'PROD1234567870'
WHERE productId = 'PROD1234567890';

-- Update records based on supplierId and productId
UPDATE products_information
SET 
    industryId = NULL,
    consumerId = 'CONSUM1234567890'
WHERE supplierId = 'SUP1234567890' AND productId = 'PROD1234567890';


-- Update product information for an checking the goods and updating values
GO
CREATE PROCEDURE UpdateProductInformation
    @productInfoId VARCHAR(25),
    @productId VARCHAR(25) = NULL,
    @supplierId VARCHAR(25) = NULL,
    @industryId VARCHAR(25) = NULL,
    @consumerId VARCHAR(25) = NULL
AS
BEGIN
    -- Start a transaction to ensure data consistency
    BEGIN TRANSACTION;

    -- Update product information
    UPDATE products_information
    SET 
        productId = COALESCE(@productId, productId),
        supplierId = COALESCE(@supplierId, supplierId),
        industryId = COALESCE(@industryId, industryId),
        consumerId = COALESCE(@consumerId, consumerId)
    WHERE productInfoId = @productInfoId;

    -- Commit the transaction
    COMMIT TRANSACTION;
END;

-- Call the stored procedure to update product information
EXEC UpdateProductInformation
    @productInfoId = 'PROINFO1234567890',
    @productId = 'PROD1234567870',
    @supplierId = 'SUP1234567891',
    @industryId = NULL, -- No change to industryId
    @consumerId = NULL;

-- View detailed product information
SELECT
    pi.productInfoId,
    p.productId,
    p.productName,
    p.productDescription,
    p.unitPrice,
    s.supplierId,
    s.supplierName,
    i.industryId,
    i.industry AS industryName,
    i.industry_description,
    c.consumerId,
    c.consumerGoods AS consumerGoodsName,
    c.consumer_description
FROM products_information pi
JOIN products p ON pi.productId = p.productId
LEFT JOIN supplier s ON pi.supplierId = s.supplierId
LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId;


-- Search product information by productInfoId
SELECT
    pi.productInfoId,
    p.productId,
    p.productName,
    p.productDescription,
    p.unitPrice,
    s.supplierId,
    s.supplierName,
    i.industryId,
    i.industry AS industryName,
    i.industry_description,
    c.consumerId,
    c.consumerGoods AS consumerGoodsName,
    c.consumer_description
FROM products_information pi
JOIN products p ON pi.productId = p.productId
LEFT JOIN supplier s ON pi.supplierId = s.supplierId
LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId
WHERE pi.productInfoId = 'PROINFO1234567891';

-- Search product information by productInfoId by using stored procedure
GO
CREATE PROCEDURE SearchProductInfoByProductInfoId
    @productInfoId VARCHAR(25)
AS
BEGIN
    -- Query to retrieve product information by productInfoId
    SELECT
        pi.productInfoId,
        p.productId,
        p.productName,
        p.productDescription,
        p.unitPrice,
        s.supplierId,
        s.supplierName,
        i.industryId,
        i.industry AS industryName,
        i.industry_description,
        c.consumerId,
        c.consumerGoods AS consumerGoodsName,
        c.consumer_description
    FROM products_information pi
    JOIN products p ON pi.productId = p.productId
    LEFT JOIN supplier s ON pi.supplierId = s.supplierId
    LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
    LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId
    WHERE pi.productInfoId = @productInfoId;
END;


-- Search product information by productName
SELECT
    pi.productInfoId,
    p.productId,
    p.productName,
    p.productDescription,
    p.unitPrice,
    s.supplierId,
    s.supplierName,
    i.industryId,
    i.industry AS industryName,
    i.industry_description,
    c.consumerId,
    c.consumerGoods AS consumerGoodsName,
    c.consumer_description
FROM products_information pi
JOIN products p ON pi.productId = p.productId
LEFT JOIN supplier s ON pi.supplierId = s.supplierId
LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId
WHERE p.productName LIKE '%' + 'Advanced' + '%';


-- Search product information by productName by using stored procedure
GO
CREATE PROCEDURE SearchProductInfoByProductName
    @productName VARCHAR(50)
AS
BEGIN
    -- Query to retrieve product information by productName
    SELECT
        pi.productInfoId,
        p.productId,
        p.productName,
        p.productDescription,
        p.unitPrice,
        s.supplierId,
        s.supplierName,
        i.industryId,
        i.industry AS industryName,
        i.industry_description,
        c.consumerId,
        c.consumerGoods AS consumerGoodsName,
        c.consumer_description
    FROM products_information pi
    JOIN products p ON pi.productId = p.productId
    LEFT JOIN supplier s ON pi.supplierId = s.supplierId
    LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
    LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId
    WHERE p.productName LIKE '%' + @productName + '%';
END;

-- Execute the stored procedure to search for a specific productName
EXEC SearchProductInfoByProductName @productName = 'Advanced Circuit Board';


-- Search product information by supplierName
SELECT
    pi.productInfoId,
    p.productId,
    p.productName,
    p.productDescription,
    p.unitPrice,
    s.supplierId,
    s.supplierName,
    i.industryId,
    i.industry AS industryName,
    i.industry_description,
    c.consumerId,
    c.consumerGoods AS consumerGoodsName,
    c.consumer_description
FROM products_information pi
JOIN products p ON pi.productId = p.productId
LEFT JOIN supplier s ON pi.supplierId = s.supplierId
LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId
WHERE s.supplierName LIKE '%' + 'Global Corp' + '%';


-- Search product information by supplierName by using stored procedure
GO
CREATE PROCEDURE SearchProductInfoBySupplierName
    @supplierName VARCHAR(50)
AS
BEGIN
    -- Query to retrieve product information by supplierName
    SELECT
        pi.productInfoId,
        p.productId,
        p.productName,
        p.productDescription,
        p.unitPrice,
        s.supplierId,
        s.supplierName,
        i.industryId,
        i.industry AS industryName,
        i.industry_description,
        c.consumerId,
        c.consumerGoods AS consumerGoodsName,
        c.consumer_description
    FROM products_information pi
    JOIN products p ON pi.productId = p.productId
    LEFT JOIN supplier s ON pi.supplierId = s.supplierId
    LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
    LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId
    WHERE s.supplierName LIKE '%' + @supplierName + '%';
END;

-- Execute the stored procedure to search for a specific supplierName
EXEC SearchProductInfoBySupplierName @supplierName = 'Sanjeev';


-- Search product information by industryName
SELECT
    pi.productInfoId,
    p.productId,
    p.productName,
    p.productDescription,
    p.unitPrice,
    s.supplierId,
    s.supplierName,
    i.industryId,
    i.industry AS industryName,
    i.industry_description,
    c.consumerId,
    c.consumerGoods AS consumerGoodsName,
    c.consumer_description
FROM products_information pi
JOIN products p ON pi.productId = p.productId
LEFT JOIN supplier s ON pi.supplierId = s.supplierId
LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId
WHERE i.industry LIKE '%' + 'High-Tech' + '%';

-- Search product information by industryName by using stored procedure 
GO
CREATE PROCEDURE SearchProductInfoByIndustryName
    @industryName VARCHAR(50)
AS
BEGIN
    -- Query to retrieve product information by industryName
    SELECT
        pi.productInfoId,
        p.productId,
        p.productName,
        p.productDescription,
        p.unitPrice,
        s.supplierId,
        s.supplierName,
        i.industryId,
        i.industry AS industryName,
        i.industry_description,
        c.consumerId,
        c.consumerGoods AS consumerGoodsName,
        c.consumer_description
    FROM products_information pi
    JOIN products p ON pi.productId = p.productId
    LEFT JOIN supplier s ON pi.supplierId = s.supplierId
    LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
    LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId
    WHERE i.industry LIKE '%' + @industryName + '%';
END;

-- Execute the stored procedure to search for a specific industryName
EXEC SearchProductInfoByIndustryName @industryName = 'Electronics';

-- Search product information by consumerGoods
SELECT
    pi.productInfoId,
    p.productId,
    p.productName,
    p.productDescription,
    p.unitPrice,
    s.supplierId,
    s.supplierName,
    i.industryId,
    i.industry AS industryName,
    i.industry_description,
    c.consumerId,
    c.consumerGoods AS consumerGoodsName,
    c.consumer_description
FROM products_information pi
JOIN products p ON pi.productId = p.productId
LEFT JOIN supplier s ON pi.supplierId = s.supplierId
LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId
WHERE c.consumerGoods LIKE '%' + 'Consumer' + '%';


-- Search product information by consumerGoods by using stored procedure
GO
CREATE PROCEDURE SearchProductInfoByConsumerGoods
    @consumerGoods VARCHAR(50)
AS
BEGIN
    -- Query to retrieve product information by consumerGoods
    SELECT
        pi.productInfoId,
        p.productId,
        p.productName,
        p.productDescription,
        p.unitPrice,
        s.supplierId,
        s.supplierName,
        i.industryId,
        i.industry AS industryName,
        i.industry_description,
        c.consumerId,
        c.consumerGoods AS consumerGoodsName,
        c.consumer_description
    FROM products_information pi
    JOIN products p ON pi.productId = p.productId
    LEFT JOIN supplier s ON pi.supplierId = s.supplierId
    LEFT JOIN industrial_goods i ON pi.industryId = i.industryId
    LEFT JOIN consumer_goods c ON pi.consumerId = c.consumerId
    WHERE c.consumerGoods = @consumerGoods;
END;

-- Execute the stored procedure to search for a specific consumerGoods
EXEC SearchProductInfoByConsumerGoods @consumerGoods = 'Household Items';


-- Products Table common operations (SELECT, INSERT, DELETE, and SEARCH BY ID)
SELECT * FROM products;
SELECT * FROM products WHERE productId = 'PROD1234567890';

INSERT INTO products (productId, productName, productDescription, unitPrice)
VALUES ('PROD1234567891', 'Widget', 'High-tech widget for normal applications', 80.00);

DELETE FROM products WHERE productId = 'PROD1234567891';
SELECT * FROM products WHERE productId = 'PROD1234567891';

-- Update product record
UPDATE products
SET productName = 'Noramal Widget',
    productDescription = 'High-tech widget for normal applications',
    unitPrice = 98.01
WHERE productId = 'PROD1234567891';


-- Industrial Goods Table common operations (SELECT, INSERT, DELETE, and SEARCH BY ID)
SELECT * FROM industrial_goods;
SELECT * FROM industrial_goods WHERE industryId = 'IND1234567890';

INSERT INTO industrial_goods (industryId, industry, industry_description)
VALUES ('IND1234567891', 'Bajaj Electronic', 'Bajaj electronics for industrial applications');

DELETE FROM industrial_goods WHERE industryId = 'IND1234567891';
SELECT * FROM industrial_goods WHERE industryId = 'IND1234567891';

-- Update industrial goods record
UPDATE industrial_goods
SET industry = 'Bajaj Electronics pvt',
    industry_description = 'Bajaj electronics for industrial applications'
WHERE industryId = 'IND1234567890';


-- Consumer Goods Table common operations (SELECT, INSERT, DELETE, and SEARCH BY ID)
SELECT * FROM consumer_goods;
SELECT * FROM consumer_goods WHERE consumerId = 'CONSUM1234567890';

INSERT INTO consumer_goods (consumerId, consumerGoods, consumer_description)
VALUES ('CONSUM1234567891', 'Consumer Product B', 'Description of Consumer Product B');

DELETE FROM consumer_goods WHERE consumerId = 'CONSUM1234567891';
SELECT * FROM consumer_goods WHERE consumerId = 'CONSUM1234567891';

-- Update consumer goods record
UPDATE consumer_goods
SET consumerGoods = 'Consumer Product C',
    consumer_description = 'Description of Consumer Product B'
WHERE consumerId = 'CONSUM1234567891';

SELECT COUNT(*) AS TOTAL_PRODUCTS FROM products_information;


------------------------------------------------- Inventory ----------------------------------------------------

-- Insert inventory data for the products
INSERT INTO inventory (inventoryId, productId, quntityInStock, lastStockUpdate) VALUES
('INV1234567892', 'PROD1234567890', 56, GETDATE()),
('INV1234567890', 'PROD1234567892', 30, GETDATE()),  
('INV1234567891', 'PROD1234567893', 20, GETDATE());  

-- Inventory Table common operations (INSERT, SELECT, DELETE)
SELECT * FROM inventory;


SELECT * FROM inventory WHERE inventoryId = 'INV1234567890';


-- Stored Procedure for Inserting into Inventory
-- Create or replace the stored procedure to insert inventory data only if the product exists
GO
CREATE PROCEDURE AddInventory
    @inventoryId VARCHAR(25),
    @productId VARCHAR(25),
    @quantityInStock BIGINT
AS
BEGIN
    -- Declare a variable to capture the message
    DECLARE @message VARCHAR(255);

    -- Start a transaction to ensure data consistency
    BEGIN TRANSACTION;

    -- Check if the product exists
    IF NOT EXISTS (SELECT 1 FROM products WHERE productId = @productId)
    BEGIN
        -- Set message and rollback transaction if the product does not exist
        SET @message = 'Error: Product does not exist.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- Insert new inventory record
        INSERT INTO inventory (inventoryId, productId, quntityInStock, lastStockUpdate)
        VALUES (@inventoryId, @productId, @quantityInStock, GETDATE());

        -- Set success message and commit the transaction
        SET @message = 'Inventory record successfully added.';
        COMMIT TRANSACTION;
    END

    -- Return the message
    SELECT @message AS ResultMessage;
END;
GO

-- Execute the stored procedure to add an inventory record
EXEC AddInventory
    @inventoryId = 'INV1234567893',
    @productId = 'PROD1234567890',
    @quantityInStock = 100;


DELETE FROM inventory WHERE inventoryId = 'INV1234567892';

SELECT SUM(quntityInStock) FROM inventory;


-- Update inventory record
UPDATE inventory
SET quntityInStock = 39,
    lastStockUpdate = GETDATE()
WHERE inventoryId = 'INV1234567892';

-- Create or replace the stored procedure to update inventory records
GO
CREATE PROCEDURE UpdateInventory
    @inventoryId VARCHAR(25),
    @newQuantityInStock BIGINT
AS
BEGIN
    -- Declare a variable to capture the message
    DECLARE @message VARCHAR(255);

    -- Start a transaction to ensure data consistency
    BEGIN TRANSACTION;

    -- Check if the inventory record exists
    IF NOT EXISTS (SELECT 1 FROM inventory WHERE inventoryId = @inventoryId)
    BEGIN
        -- Set message and rollback transaction if the inventory record does not exist
        SET @message = 'Error: Inventory record does not exist.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- Update the inventory record
        UPDATE inventory
        SET quntityInStock = @newQuantityInStock,
            lastStockUpdate = GETDATE()
        WHERE inventoryId = @inventoryId;

        -- Set success message and commit the transaction
        SET @message = 'Inventory record successfully updated.';
        COMMIT TRANSACTION;
    END

    -- Return the message
    SELECT @message AS ResultMessage;
END;
GO

-- Execute the stored procedure to update an inventory record
EXEC UpdateInventory
    @inventoryId = 'INV1234567890',
    @newQuantityInStock = 150;


-- Search inventory record by inventoryId
SELECT *
FROM inventory
WHERE inventoryId = 'INV1234567890';

-- Create or replace the stored procedure to search for inventory by inventoryId
GO
CREATE PROCEDURE SearchInventoryById
    @inventoryId VARCHAR(25)
AS
BEGIN
    -- Retrieve the inventory record by inventoryId
    SELECT *
    FROM inventory
    WHERE inventoryId = @inventoryId;
END;
GO

-- Execute the stored procedure to search for an inventory record
EXEC SearchInventoryById
    @inventoryId = 'INV1234567890';

-- Search inventory records by productId
SELECT *
FROM inventory
WHERE productId = 'PROD1234567890';

-- Create or replace the stored procedure to search for inventory by productId
GO
CREATE PROCEDURE SearchInventoryByProductId
    @productId VARCHAR(25)
AS
BEGIN
    -- Retrieve inventory records by productId
    SELECT *
    FROM inventory
    WHERE productId = @productId;
END;
GO

-- Execute the stored procedure to search for inventory records
EXEC SearchInventoryByProductId
    @productId = 'PROD1234567890';




------------------------------------------------------- Ware house module ----------------------------------------------------------------
-- Insert a new warehouse record
-- Insert values into the warehouse table
INSERT INTO warehouse (warehouseId, warehouseName, location, capacity, currentCapacity) VALUES
('WH001', 'Central Warehouse', '123 Main St, Coimbatore', 5000, 0),
('WH002', 'Northside Depot', '456 Elm St, Coimbatore', 3000, 0),
('WH003', 'Southside Storage', '789 Oak St, Coimbatore', 7000, 0),
('WH004', 'Eastside Facility', '321 Pine St, Coimbatore', 2000, 0),
('WH005', 'Westside Hub', '654 Maple St, Coimbatore', 4500, 0);



-- Trigger to update currentCapacity in warehouse table after inserting into warehouse_storage
GO
CREATE TRIGGER trg_UpdateCurrentCapacityWareHouseStorage
ON warehouse_storage
AFTER INSERT
AS
BEGIN
    -- Update currentCapacity for the warehouse
    UPDATE w
    SET w.currentCapacity = w.currentCapacity + i.quntityInStock
    FROM warehouse w
    JOIN inserted ins ON w.warehouseId = ins.warehouseId
    JOIN inventory i ON ins.inventoryId = i.inventoryId;
END;
GO

GO
CREATE TRIGGER trg_UpdateCurrentCapacity
ON inventory
AFTER UPDATE
AS
BEGIN
    -- Update currentCapacity in the warehouse based on changes in the inventory
    UPDATE w
    SET w.currentCapacity = w.currentCapacity + deltaQuantity
    FROM warehouse w
    INNER JOIN warehouse_storage ws ON w.warehouseId = ws.warehouseId
    INNER JOIN (
        SELECT i.inventoryId,
               i.quntityInStock - d.quntityInStock AS deltaQuantity
        FROM INSERTED i
        INNER JOIN DELETED d ON i.inventoryId = d.inventoryId
    ) AS changes ON changes.inventoryId = ws.inventoryId
    WHERE w.warehouseId = ws.warehouseId;
END;


-- Delete a warehouse record by warehouseId
DELETE FROM warehouse WHERE warehouseId = 'WH005';


-- Update a warehouse record
UPDATE warehouse
SET --warehouseName = 'Eastside Facility',
    --location = '321 Pine St, Coimbatore',
    currentCapacity = 0
WHERE warehouseId = 'WH004';

-- Search for a warehouse record by warehouseId
SELECT * FROM warehouse WHERE warehouseId = 'WH004';


-- Stored Procedure
-- Create or replace the stored procedure to add a new warehouse
GO
CREATE PROCEDURE AddWarehouse
    @warehouseId VARCHAR(25),
    @warehouseName VARCHAR(30),
    @location VARCHAR(100),
    @capacity BIGINT,
    @currentCapacity BIGINT
AS
BEGIN
    INSERT INTO warehouse (warehouseId, warehouseName, location, capacity, currentCapacity)
    VALUES (@warehouseId, @warehouseName, @location, @capacity, @currentCapacity);
END;
GO

-- Create or replace the stored procedure to delete a warehouse
GO
CREATE PROCEDURE DeleteWarehouse
    @warehouseId VARCHAR(25)
AS
BEGIN
    DELETE FROM warehouse
    WHERE warehouseId = @warehouseId;
END;
GO

-- Create or replace the stored procedure to update a warehouse
GO
CREATE PROCEDURE UpdateWarehouse
    @warehouseId VARCHAR(25),
    @newWarehouseName VARCHAR(30),
    @newLocation VARCHAR(100),
    @newCurrentCapacity BIGINT
AS
BEGIN
    UPDATE warehouse
    SET warehouseName = @newWarehouseName,
        location = @newLocation,
        currentCapacity = @newCurrentCapacity
    WHERE warehouseId = @warehouseId;
END;
GO

-- Create or replace the stored procedure to search for a warehouse by ID
GO
CREATE PROCEDURE SearchWarehouseById
    @warehouseId VARCHAR(25)
AS
BEGIN
    SELECT *
    FROM warehouse
    WHERE warehouseId = @warehouseId;
END;
GO


-- Execute the stored procedure to add a new warehouse
EXEC AddWarehouse
    @warehouseId = 'WH006',
    @warehouseName = 'Main Warehouse',
    @location = '123 Warehouse St, Thanjavur, TS, 12345',
    @capacity = 0,
    @currentCapacity = 5000;

-- Execute the stored procedure to delete a warehouse
EXEC DeleteWarehouse
    @warehouseId = 'WH006';

-- Execute the stored procedure to update a warehouse
EXEC UpdateWarehouse
    @warehouseId = 'WH005',
    @newWarehouseName = 'Westside Hub',
    @newLocation = '456 New Address, Coimbatore, TS, 67890',
    @newCurrentCapacity = 6000;

-- Execute the stored procedure to search for a warehouse
EXEC SearchWarehouseById
    @warehouseId = 'WH005';

-- Insert values into the warehouse_storage table
INSERT INTO warehouse_storage (warehouseId, inventoryId) VALUES
('WH001', 'INV1234567892'), 
('WH001', 'INV1234567892'),  
('WH002', 'INV1234567892'),  
('WH003', 'INV1234567891'),  
('WH004', 'INV1234567890'); 

select * from inventory;
select * from warehouse;

truncate table warehouse_storage ;


-- Search for records in the warehouse_storage table
SELECT * FROM warehouse_storage

-- Delete a record from the warehouse_storage table
DELETE FROM warehouse_storage
WHERE warehouseId = 'WH004'
  AND inventoryId = 'INV1234567890';

-- Search for records in the warehouse_storage table by warehouseId and inventoryId
SELECT * FROM warehouse_storage WHERE warehouseId = 'WH001' AND inventoryId = 'INV1234567892';


-- Create or replace the stored procedure to add a new record to the warehouse_storage table with existence checks
GO
CREATE PROCEDURE AddWarehouseStorage
    @warehouseId VARCHAR(25),
    @inventoryId VARCHAR(25)
AS
BEGIN
    -- Check if the warehouse exists
    IF NOT EXISTS (SELECT 1 FROM warehouse WHERE warehouseId = @warehouseId)
    BEGIN
        PRINT 'Warehouse does not exist.';
        RETURN; -- Exit the procedure if warehouse does not exist
    END

    -- Check if the inventory exists
    IF NOT EXISTS (SELECT 1 FROM inventory WHERE inventoryId = @inventoryId)
    BEGIN
        PRINT 'Inventory does not exist.';
        RETURN; -- Exit the procedure if inventory does not exist
    END

    -- Insert the new record into the warehouse_storage table if both warehouse and inventory exist
    INSERT INTO warehouse_storage (warehouseId, inventoryId)
    VALUES (@warehouseId, @inventoryId);

    PRINT 'Record added successfully.';
END;
GO

-- Execute the stored procedure to add a new warehouse storage record
EXEC AddWarehouseStorage
    @warehouseId = 'WH002',
    @inventoryId = 'INV1234567890';


-- Create or replace the stored procedure to delete a warehouse storage record with existence check
GO
CREATE PROCEDURE DeleteWarehouseStorage
    @warehouseId VARCHAR(25),
    @inventoryId VARCHAR(25)
AS
BEGIN
    -- Check if the record exists in warehouse_storage
    IF NOT EXISTS (SELECT 1 FROM warehouse_storage WHERE warehouseId = @warehouseId AND inventoryId = @inventoryId)
    BEGIN
        PRINT 'Record does not exist in warehouse_storage.';
        RETURN; -- Exit the procedure if the record does not exist
    END

    -- Delete the record from warehouse_storage table
    DELETE FROM warehouse_storage
    WHERE warehouseId = @warehouseId
      AND inventoryId = @inventoryId;

    PRINT 'Record deleted successfully.';
END;
GO

-- Execute the stored procedure to delete a warehouse storage record
EXEC DeleteWarehouseStorage
    @warehouseId = 'WH001',
    @inventoryId = 'INV1234567890';


-- Create or replace the stored procedure to update a warehouse storage record with existence check
GO
CREATE PROCEDURE UpdateWarehouseStorage
    @oldWarehouseId VARCHAR(25),
    @oldInventoryId VARCHAR(25),
    @newWarehouseId VARCHAR(25),
    @newInventoryId VARCHAR(25)
AS
BEGIN
    -- Check if the old record exists
    IF NOT EXISTS (SELECT 1 FROM warehouse_storage WHERE warehouseId = @oldWarehouseId AND inventoryId = @oldInventoryId)
    BEGIN
        PRINT 'Old record does not exist in warehouse_storage.';
        RETURN; -- Exit the procedure if the old record does not exist
    END

    -- Check if the new warehouse exists
    IF NOT EXISTS (SELECT 1 FROM warehouse WHERE warehouseId = @newWarehouseId)
    BEGIN
        PRINT 'New warehouse does not exist.';
        RETURN; -- Exit the procedure if the new warehouse does not exist
    END

    -- Check if the new inventory exists
    IF NOT EXISTS (SELECT 1 FROM inventory WHERE inventoryId = @newInventoryId)
    BEGIN
        PRINT 'New inventory does not exist.';
        RETURN; -- Exit the procedure if the new inventory does not exist
    END

    -- Delete the old record from warehouse_storage
    DELETE FROM warehouse_storage
    WHERE warehouseId = @oldWarehouseId
      AND inventoryId = @oldInventoryId;

    -- Insert the new record into warehouse_storage
    INSERT INTO warehouse_storage (warehouseId, inventoryId)
    VALUES (@newWarehouseId, @newInventoryId);

    PRINT 'Record updated successfully.';
END;
GO

-- Execute the stored procedure to update a warehouse storage record
EXEC UpdateWarehouseStorage
    @oldWarehouseId = 'WH001',
    @oldInventoryId = 'INV1234567890',
    @newWarehouseId = 'WH002',
    @newInventoryId = 'INV0987654321';




------------------------------------------------------------- Order module -------------------------------------------------------------
/* Customer Table Operations */

-- Insert a new customer into the customer table
-- Sample data for the Customer table
INSERT INTO customer VALUES
('CUST1234567890', 'Alice', 'Johnson', 'alice.johnson@example.com', 9876543210, '321 Elm St', 'Somewhere', 'TX', '78901'),
('CUST1234567891','John', 'Doe', 'john.doe@example.com', 9874586325, '123 Main St', 'Anytown', 'CA', '12345'),
('CUST1234567892','Jane', 'Smith', 'jane.smith@example.com', 9874586328, '456 Oak Ave', 'Somewhere', 'NY', '67890'),
('CUST1234567893','Bob', 'Johnson', 'bob.johnson@example.com', 9874586327, '789 Pine Rd', 'Nowhere', 'TX', '54321');


SELECT * FROM customer;


-- Delete a customer from the customer table after checking if it exists
IF EXISTS (SELECT 1 FROM customer WHERE customerID = 'CUST1234567890')
BEGIN
    DELETE FROM customer
    WHERE customerID = 'CUST1234567890';
    PRINT 'Customer deleted successfully.';
END
ELSE
BEGIN
    PRINT 'Customer does not exist.';
END


-- Update customer details after checking if the customer exists
IF EXISTS (SELECT 1 FROM customer WHERE customerID = 'CUST1234567890')
BEGIN
    UPDATE customer
    SET firstName = 'Alice', lastName = 'Doe', email = 'alice.doe@example.com'
    WHERE customerID = 'CUST1234567890';
    PRINT 'Customer updated successfully.';
END
ELSE
BEGIN
    PRINT 'Customer does not exist.';
END

-- Search for a customer by ID
SELECT *
FROM customer
WHERE customerID = 'CUST1234567890';


-- Create or replace the stored procedure to insert a new customer
GO
CREATE PROCEDURE InsertCustomer
    @customerID VARCHAR(25),
    @firstName VARCHAR(50),
    @lastName VARCHAR(50),
    @email VARCHAR(100),
    @phone BIGINT,
    @address VARCHAR(255),
    @city VARCHAR(50),
    @state VARCHAR(50),
    @zipCode VARCHAR(20)
AS
BEGIN
    -- Check if the customer already exists
    IF EXISTS (SELECT 1 FROM customer WHERE customerID = @customerID)
    BEGIN
        PRINT 'Customer already exists.';
        RETURN;
    END

    -- Insert the new customer
    INSERT INTO customer (customerID, firstName, lastName, email, phone, address, city, state, zipCode)
    VALUES (@customerID, @firstName, @lastName, @email, @phone, @address, @city, @state, @zipCode);

    PRINT 'Customer added successfully.';
END;
GO


-- Create or replace the stored procedure to delete a customer
GO
CREATE PROCEDURE DeleteCustomer
    @customerID VARCHAR(25)
AS
BEGIN
    -- Check if the customer exists
    IF NOT EXISTS (SELECT 1 FROM customer WHERE customerID = @customerID)
    BEGIN
        PRINT 'Customer does not exist.';
        RETURN;
    END

    -- Delete the customer
    DELETE FROM customer
    WHERE customerID = @customerID;

    PRINT 'Customer deleted successfully.';
END;
GO


-- Create or replace the stored procedure to update customer details
GO
CREATE PROCEDURE UpdateCustomer
    @customerID VARCHAR(25),
    @firstName VARCHAR(50) = NULL,
    @lastName VARCHAR(50) = NULL,
    @email VARCHAR(100) = NULL,
    @phone BIGINT = NULL,
    @address VARCHAR(255) = NULL,
    @city VARCHAR(50) = NULL,
    @state VARCHAR(50) = NULL,
    @zipCode VARCHAR(20) = NULL
AS
BEGIN
    -- Check if the customer exists
    IF NOT EXISTS (SELECT 1 FROM customer WHERE customerID = @customerID)
    BEGIN
        PRINT 'Customer does not exist.';
        RETURN;
    END

    -- Update customer details
    UPDATE customer
    SET firstName = ISNULL(@firstName, firstName),
        lastName = ISNULL(@lastName, lastName),
        email = ISNULL(@email, email),
        phone = ISNULL(@phone, phone),
        address = ISNULL(@address, address),
        city = ISNULL(@city, city),
        state = ISNULL(@state, state),
        zipCode = ISNULL(@zipCode, zipCode)
    WHERE customerID = @customerID;

    PRINT 'Customer updated successfully.';
END;
GO


-- Create or replace the stored procedure to search a customer by ID
GO
CREATE PROCEDURE SearchCustomerByID
    @customerID VARCHAR(25)
AS
BEGIN
    SELECT *
    FROM customer
    WHERE customerID = @customerID;
END;
GO

-- Call InsertCustomer Procedure
EXEC InsertCustomer
    @customerID = 'CUST1234567894',
    @firstName = 'John',
    @lastName = 'Doe',
    @email = 'j.de@example.com',
    @phone = 1234567897,
    @address = '123 Main St',
    @city = 'Anytown',
    @state = 'CA',
    @zipCode = '12345';

SELECT* FROM customer;

-- Call DeleteCustomer Procedure
EXEC DeleteCustomer
    @customerID = 'CUST1234567894';

-- Call UpdateCustomer Procedure
EXEC UpdateCustomer
    @customerID = 'CUST1234567890',
    @firstName = 'John',
    @lastName = 'Smith', 
    @email = NULL, 
    @phone = 9876543211, 
    @address = '456 Elm St', 
    @city = NULL, 
    @state = NULL, 
    @zipCode = '54321'; 

-- Call SearchCustomerByID Procedure
EXEC SearchCustomerByID
    @customerID = 'CUST1234567890';


/* Orders Table Operations */
-- Insert a new order into the orders table after checking if the customer exists
IF EXISTS (SELECT 1 FROM customer WHERE customerID = 'CUST1234567890')
BEGIN
    INSERT INTO orders (orderId, customerId, orderDate, totalAmount, orderStatus)
    VALUES ('ORD1234567890', 'CUST1234567890', GETDATE(), 1500, 'Processing');
    PRINT 'Order added successfully.';
END
ELSE
BEGIN
    PRINT 'Customer does not exist.';
END

-- Delete an order from the orders table after checking if it exists
IF EXISTS (SELECT 1 FROM orders WHERE orderId = 'ORD1234567890')
BEGIN
    DELETE FROM orders
    WHERE orderId = 'ORD1234567890';
    PRINT 'Order deleted successfully.';
END
ELSE
BEGIN
    PRINT 'Order does not exist.';
END

-- Update order details after checking if the order exists
IF EXISTS (SELECT 1 FROM orders WHERE orderId = 'ORD1234567890')
BEGIN
    UPDATE orders
    SET totalAmount = 2000, orderStatus = 'Shipped'
    WHERE orderId = 'ORD1234567890';
    PRINT 'Order updated successfully.';
END
ELSE
BEGIN
    PRINT 'Order does not exist.';
END


-- Search for an order by ID
SELECT *
FROM orders
WHERE orderId = 'ORD1234567890';


-- Create or replace the stored procedure to insert a new order
GO

CREATE PROCEDURE AddOrder
    @orderId VARCHAR(25),
    @customerId VARCHAR(25),
    @totalAmount BIGINT = 0,
    @orderStatus VARCHAR(25)
AS
BEGIN
    -- Check if the customer exists before adding the order
    IF NOT EXISTS (SELECT 1 FROM customer WHERE customerID = @customerId)
    BEGIN
        PRINT 'Customer does not exist.';
        RETURN;
    END
    -- Check if the order already exists
    IF EXISTS (SELECT 1 FROM orders WHERE orderId = @orderId)
    BEGIN
        PRINT 'Order already exists.';
        RETURN;
    END
    -- Insert the new order
    INSERT INTO orders (orderId, customerId, orderDate, totalAmount, orderStatus)
    VALUES (@orderId, @customerId,  GETDATE(), @totalAmount, @orderStatus);

    PRINT 'Order added successfully.';
END;
GO

-- Create or replace the stored procedure to delete an order
GO
CREATE PROCEDURE DeleteOrder
    @orderId VARCHAR(25)
AS
BEGIN
    -- Check if the order exists
    IF NOT EXISTS (SELECT 1 FROM orders WHERE orderId = @orderId)
    BEGIN
        PRINT 'Order does not exist.';
        RETURN;
    END

    -- Delete the order
    DELETE FROM orders
    WHERE orderId = @orderId;

    PRINT 'Order deleted successfully.';
END;
GO

-- Create or replace the stored procedure to update order details
GO
CREATE PROCEDURE UpdateOrder
    @orderId VARCHAR(25),
    @customerId VARCHAR(25) = NULL,
    @orderDate DATETIME = NULL,
    @totalAmount BIGINT = 0,
    @orderStatus VARCHAR(25) = NULL
AS
BEGIN
    -- Check if the order exists
    IF NOT EXISTS (SELECT 1 FROM orders WHERE orderId = @orderId)
    BEGIN
        PRINT 'Order does not exist.';
        RETURN;
    END

    -- Update order details
    UPDATE orders
    SET customerId = ISNULL(@customerId, customerId),
        orderDate = ISNULL(@orderDate, orderDate),
        totalAmount = @totalAmount,
        orderStatus = ISNULL(@orderStatus, orderStatus)
    WHERE orderId = @orderId;

    PRINT 'Order updated successfully.';
END;
GO

-- Create or replace the stored procedure to search for an order by ID
GO
CREATE PROCEDURE SearchOrderByID
    @orderId VARCHAR(25)
AS
BEGIN
    -- Retrieve order details by ID
    SELECT *
    FROM orders
    WHERE orderId = @orderId;
END;
GO


-- Call AddOrder Procedure
EXEC AddOrder
    @orderId = 'ORD1234567890',
    @customerId = 'CUST1234567890',  
    @totalAmount = 1500,
    @orderStatus = 'Processing';

/*
-- Call DeleteOrder Procedure
EXEC DeleteOrder
    @orderId = 'ORD1234567890';
*/


-- Call UpdateOrder Procedure
EXEC UpdateOrder
    @orderId = 'ORD1234567890',
    @customerId = 'CUST1234567891', 
    @orderDate = '2024-08-01',  
    @totalAmount = 2000, 
    @orderStatus = 'Shipped';  

-- Call SearchOrderByID Procedure
EXEC SearchOrderByID
    @orderId = 'ORD1234567890';




/* Order Details Table Operations */
-- Insert order details after checking if the order and product exist
IF EXISTS (SELECT 1 FROM orders WHERE orderId = 'ORD1234567890') AND EXISTS (SELECT 1 FROM products WHERE productId = 'PROD1234567890')
BEGIN
    INSERT INTO order_details (orderId, productId, quantity)
    VALUES ('ORD1234567890', 'PROD1234567890', 10);
    PRINT 'Order details added successfully.';
END
ELSE
BEGIN
    PRINT 'Order or Product does not exist.';
END

-- Delete order details after checking if the record exists
IF EXISTS (SELECT 1 FROM order_details WHERE orderId = 'ORD1234567890' AND productId = 'PROD1234567890')
BEGIN
    DELETE FROM order_details
    WHERE orderId = 'ORD1234567890' AND productId = 'PROD1234567890';
    PRINT 'Order details deleted successfully.';
END
ELSE
BEGIN
    PRINT 'Order details record does not exist.';
END

-- Update order details after checking if the record exists
IF EXISTS (SELECT 1 FROM order_details WHERE orderId = 'ORD1234567890' AND productId = 'PROD1234567890')
BEGIN
    UPDATE order_details
    SET quantity = 20
    WHERE orderId = 'ORD1234567890' AND productId = 'PROD1234567890';
    PRINT 'Order details updated successfully.';
END
ELSE
BEGIN
    PRINT 'Order details record does not exist.';
END

-- Search for order details by orderId and productId
SELECT * FROM order_details
WHERE orderId = 'ORD1234567890' AND productId = 'PROD1234567890';

-- Create or replace the stored procedure to insert a new order detail
GO
CREATE PROCEDURE AddOrderDetail
    @orderId VARCHAR(25),
    @productId VARCHAR(25),
    @quantity INT
AS
BEGIN
    -- Check if the order exists
    IF NOT EXISTS (SELECT 1 FROM orders WHERE orderId = @orderId)
    BEGIN
        PRINT 'Order does not exist.';
        RETURN;
    END

    -- Check if the product exists
    IF NOT EXISTS (SELECT 1 FROM products WHERE productId = @productId)
    BEGIN
        PRINT 'Product does not exist.';
        RETURN;
    END

    -- Check if the order detail already exists
    IF EXISTS (SELECT 1 FROM order_details WHERE orderId = @orderId AND productId = @productId)
    BEGIN
        PRINT 'Order detail already exists.';
        RETURN;
    END

    -- Insert the new order detail
    INSERT INTO order_details (orderId, productId, quantity)
    VALUES (@orderId, @productId, @quantity);

    PRINT 'Order detail added successfully.';
END;
GO

-- Create or replace the stored procedure to delete an order detail
GO
CREATE PROCEDURE DeleteOrderDetail
    @orderId VARCHAR(25),
    @productId VARCHAR(25)
AS
BEGIN
    -- Check if the order detail exists
    IF NOT EXISTS (SELECT 1 FROM order_details WHERE orderId = @orderId AND productId = @productId)
    BEGIN
        PRINT 'Order detail does not exist.';
        RETURN;
    END

    -- Delete the order detail
    DELETE FROM order_details
    WHERE orderId = @orderId AND productId = @productId;

    PRINT 'Order detail deleted successfully.';
END;
GO

-- Create or replace the stored procedure to update an order detail
GO
CREATE PROCEDURE UpdateOrderDetail
    @orderId VARCHAR(25),
    @productId VARCHAR(25),
    @quantity INT
AS
BEGIN
    -- Check if the order detail exists
    IF NOT EXISTS (SELECT 1 FROM order_details WHERE orderId = @orderId AND productId = @productId)
    BEGIN
        PRINT 'Order detail does not exist.';
        RETURN;
    END

    -- Update the order detail
    UPDATE order_details
    SET quantity = @quantity
    WHERE orderId = @orderId AND productId = @productId;

    PRINT 'Order detail updated successfully.';
END;
GO

-- Create or replace the stored procedure to search order details by order ID
GO
CREATE PROCEDURE SearchOrderDetailsByOrderID
    @orderId VARCHAR(25)
AS
BEGIN
    -- Retrieve order details by order ID
    SELECT *
    FROM order_details
    WHERE orderId = @orderId;
END;
GO

-- Create or replace the stored procedure to search order details by product ID
GO
CREATE PROCEDURE SearchOrderDetailsByProductID
    @productId VARCHAR(25)
AS
BEGIN
    -- Retrieve order details by product ID
    SELECT *
    FROM order_details
    WHERE productId = @productId;
END;
GO


-- Call AddOrderDetail Procedure
EXEC AddOrderDetail
    @orderId = 'ORD1234567890',
    @productId = 'PROD1234567890',
    @quantity = 10;

-- Call DeleteOrderDetail Procedure
EXEC DeleteOrderDetail
    @orderId = 'ORD1234567890',
    @productId = 'PROD1234567890';

-- Call UpdateOrderDetail Procedure
EXEC UpdateOrderDetail
    @orderId = 'ORD1234567890',
    @productId = 'PROD1234567890',
    @quantity = 20;

-- Call SearchOrderDetailsByOrderID Procedure
EXEC SearchOrderDetailsByOrderID
    @orderId = 'ORD1234567890';

-- Call SearchOrderDetailsByProductID Procedure
EXEC SearchOrderDetailsByProductID
    @productId = 'PROD1234567890';


select * from order_details;



---------------------------------------------------- Transportation module -----------------------------------------------------------

-- Sample data for the carriers table
INSERT INTO carriers VALUES
('CAIR09876567890', 'FedEx', 'John Smith', 'john.smith@fedex.com', '+91 9856475632'),
('CAIR09876567891', 'UPS', 'Jane Doe', 'jane.doe@ups.com', '+91 9856475631'),
('CAIR09876567892', 'DHL', 'Bob Johnson', 'bob.johnson@dhl.com', '+91 9856475633');
 
 SELECT * FROM shipment;

-- Insert a new record into the shipment table
INSERT INTO shipment (shipmentId, orderId)
VALUES ('SH1234567890', 'ORD1234567890');


-- Insert a new record into the transport table
INSERT INTO transport (shipmentId, carrierID, shipmentStatus)
VALUES ('SH1234567890', 'CAIR09876567890', 'In Transit');

-- Insert Values into the carriers Table and Check Existence
GO
CREATE PROCEDURE InsertCarrier
    @carrierID VARCHAR(25),
    @carrierName VARCHAR(255),
    @contactPerson VARCHAR(100) = NULL,
    @contactEmail VARCHAR(100) = NULL,
    @contactPhone VARCHAR(20) = NULL
AS
BEGIN
    -- Check if the carrier already exists
    IF NOT EXISTS (SELECT 1 FROM carriers WHERE carrierID = @carrierID)
    BEGIN
        -- Insert a new record into the carriers table
        INSERT INTO carriers (carrierID, carrierName, contactPerson, contactEmail, contactPhone)
        VALUES (@carrierID, @carrierName, @contactPerson, @contactEmail, @contactPhone);

        SELECT 'Carrier record inserted successfully' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Carrier record already exists' AS Message;
    END
END;

-- Insert Values into the shipment Table and Check if Related Order Exists
GO
CREATE PROCEDURE InsertShipment
    @shipmentId VARCHAR(25),
    @orderId VARCHAR(25)
AS
BEGIN
    -- Check if the related order exists
    IF EXISTS (SELECT 1 FROM orders WHERE orderId = @orderId)
    BEGIN
        -- Check if the shipment already exists
        IF NOT EXISTS (SELECT 1 FROM shipment WHERE shipmentId = @shipmentId)
        BEGIN
            -- Insert a new record into the shipment table
            INSERT INTO shipment (shipmentId, orderId)
            VALUES (@shipmentId, @orderId);

            SELECT 'Shipment record inserted successfully' AS Message;
        END
        ELSE
        BEGIN
            SELECT 'Shipment record already exists' AS Message;
        END
    END
    ELSE
    BEGIN
        SELECT 'Related order does not exist' AS Message;
    END
END;

-- Insert Values into the transport Table and Check if Related Shipment and Carrier Exist
GO
CREATE PROCEDURE InsertTransport
    @shipmentId VARCHAR(25),
    @carrierID VARCHAR(25),
    @shipmentStatus VARCHAR(15)
AS
BEGIN
    -- Check if the related shipment exists
    IF EXISTS (SELECT 1 FROM shipment WHERE shipmentId = @shipmentId)
    BEGIN
        -- Check if the related carrier exists
        IF EXISTS (SELECT 1 FROM carriers WHERE carrierID = @carrierID)
        BEGIN
            -- Check if the transport record already exists
            IF NOT EXISTS (SELECT 1 FROM transport WHERE shipmentId = @shipmentId AND carrierID = @carrierID)
            BEGIN
                -- Insert a new record into the transport table
                INSERT INTO transport (shipmentId, carrierID, shipmentStatus)
                VALUES (@shipmentId, @carrierID, @shipmentStatus);

                SELECT 'Transport record inserted successfully' AS Message;
            END
            ELSE
            BEGIN
                SELECT 'Transport record already exists' AS Message;
            END
        END
        ELSE
        BEGIN
            SELECT 'Related carrier does not exist' AS Message;
        END
    END
    ELSE
    BEGIN
        SELECT 'Related shipment does not exist' AS Message;
    END
END;


-- Insert and validate carrier
EXEC InsertCarrier 
    @carrierID = 'CAR001', 
    @carrierName = 'FastShip', 
    @contactPerson = 'John Doe', 
    @contactEmail = 'john@example.com', 
    @contactPhone = '123-456-7890';

-- Insert and validate shipment
EXEC InsertShipment 
    @shipmentId = 'SH123', 
    @orderId = 'ORD001';

-- Insert and validate transport
EXEC InsertTransport 
    @shipmentId = 'SH123', 
    @carrierID = 'CAR001', 
    @shipmentStatus = 'In Transit';



-- Retrieve all transport details along with related carrier and shipment information
SELECT t.shipmentId,
       t.carrierID,
       t.shipmentStatus,
       c.carrierName,
       c.contactPerson,
       c.contactEmail,
       c.contactPhone,
       s.orderId,
       s.shipmentId AS shipmentInShipmentTable,
       o.orderDate,
       o.totalAmount,
       o.orderStatus
FROM transport t
JOIN carriers c ON t.carrierID = c.carrierID
JOIN shipment s ON t.shipmentId = s.shipmentId
JOIN orders o ON s.orderId = o.orderId;

-- Stored procedure, retrieve all details

GO
CREATE PROCEDURE GetTransportationDetails
    @shipmentId VARCHAR(25) = NULL,
    @orderId VARCHAR(25) = NULL
AS
BEGIN
    -- Retrieve transportation details along with related carrier and shipment information
    SELECT t.shipmentId,
           t.carrierID,
           t.shipmentStatus,
           c.carrierName,
           c.contactPerson,
           c.contactEmail,
           c.contactPhone,
           s.orderId,
           o.orderDate,
           o.totalAmount,
           o.orderStatus
    FROM transport t
    LEFT JOIN carriers c ON t.carrierID = c.carrierID
    LEFT JOIN shipment s ON t.shipmentId = s.shipmentId
    LEFT JOIN orders o ON s.orderId = o.orderId
    WHERE (@shipmentId IS NULL OR t.shipmentId = @shipmentId)
      AND (@orderId IS NULL OR s.orderId = @orderId);
END;

-- Get transportation details for a specific shipmentId
EXEC GetTransportationDetails @shipmentId = 'SH1234567890';

-- Get transportation details for a specific orderId
EXEC GetTransportationDetails @orderId = 'ORD001';

-- Get transportation details with both shipmentId and orderId
EXEC GetTransportationDetails @shipmentId = 'SH123', @orderId = 'ORD001';

-- Get all transportation details (no filter)
EXEC GetTransportationDetails;



-- Update the shipmentStatus in the transport table based on orderId
UPDATE t
SET t.shipmentStatus = 'NEW_STATUS'
FROM transport t
JOIN shipment s ON t.shipmentId = s.shipmentId
WHERE s.orderId = 'YOUR_ORDER_ID';

-- Update shipmentStatus based on multiple conditions
UPDATE t
SET t.shipmentStatus = 'UPDATED_STATUS'
FROM transport t
JOIN shipment s ON t.shipmentId = s.shipmentId
JOIN orders o ON s.orderId = o.orderId
WHERE o.orderStatus = 'Shipped'
  AND t.shipmentStatus = 'Pending';

GO
-- Manage transportation details
CREATE PROCEDURE ManageTransportationDetails
    @shipmentId VARCHAR(25) = NULL,
    @orderId VARCHAR(25) = NULL,
    @newShipmentStatus VARCHAR(15) = NULL,
    @newCarrierID VARCHAR(25) = NULL
AS
BEGIN
    -- Retrieve transportation details if parameters are provided
    IF @shipmentId IS NOT NULL OR @orderId IS NOT NULL
    BEGIN
        SELECT t.shipmentId,
               t.carrierID,
               t.shipmentStatus,
               c.carrierName,
               c.contactPerson,
               c.contactEmail,
               c.contactPhone,
               s.orderId,
               o.orderDate,
               o.totalAmount,
               o.orderStatus
        FROM transport t
        LEFT JOIN carriers c ON t.carrierID = c.carrierID
        LEFT JOIN shipment s ON t.shipmentId = s.shipmentId
        LEFT JOIN orders o ON s.orderId = o.orderId
        WHERE (@shipmentId IS NULL OR t.shipmentId = @shipmentId)
          AND (@orderId IS NULL OR s.orderId = @orderId);
    END
END;

drop procedure ManageTransportationDetails;
select * from order_details;
select * from transport
select * from carriers;
-- Retrieve details for a specific shipmentId
EXEC ManageTransportationDetails @shipmentId = 'SH1234567890';

-- Update shipmentStatus and carrierID for a specific shipmentId
EXEC ManageTransportationDetails 
    @shipmentId = 'SH1234567890',
	@orderId = 'ORD1234567890',
    @newShipmentStatus = 'Delivered',
    @newCarrierID = 'CAIR09876567890';

-- Retrieve and update based on orderId
EXEC ManageTransportationDetails 
    @orderId = 'ORD1234567890',
    @newShipmentStatus = 'In Transit';

GO
CREATE PROCEDURE ManageTransportationDetailsCase
    @shipmentId VARCHAR(25) = NULL,
    @orderId VARCHAR(25) = NULL,
    @newShipmentStatus VARCHAR(15) = NULL,
    @newCarrierID VARCHAR(25) = NULL
AS
BEGIN
    -- Retrieve transportation details if parameters are provided
    IF @shipmentId IS NOT NULL OR @orderId IS NOT NULL
    BEGIN
        SELECT t.shipmentId,
               t.carrierID,
               t.shipmentStatus,
               c.carrierName,
               c.contactPerson,
               c.contactEmail,
               c.contactPhone,
               s.orderId,
               o.orderDate,
               o.totalAmount,
               o.orderStatus
        FROM transport t
        LEFT JOIN carriers c ON t.carrierID = c.carrierID
        LEFT JOIN shipment s ON t.shipmentId = s.shipmentId
        LEFT JOIN orders o ON s.orderId = o.orderId
        WHERE (@shipmentId IS NULL OR t.shipmentId = @shipmentId)
          AND (@orderId IS NULL OR s.orderId = @orderId);
    END

    -- Update transportation details if new values are provided
    IF @newShipmentStatus IS NOT NULL OR @newCarrierID IS NOT NULL
    BEGIN
        UPDATE t
        SET t.shipmentStatus = 
            CASE 
                WHEN @newShipmentStatus IS NOT NULL THEN @newShipmentStatus 
                ELSE t.shipmentStatus 
            END,
            t.carrierID = 
            CASE 
                WHEN @newCarrierID IS NOT NULL THEN @newCarrierID 
                ELSE t.carrierID 
            END
        FROM transport t
        INNER JOIN shipment s ON t.shipmentId = s.shipmentId
        WHERE (@shipmentId IS NOT NULL AND t.shipmentId = @shipmentId)
          AND (@orderId IS NOT NULL AND s.orderId = @orderId);
    END
END;


EXEC ManageTransportationDetailsCase
    @shipmentId = 'SH1234567890',
	@orderId = 'ORD1234567890',
    @newShipmentStatus = 'Delivered',
    @newCarrierID = 'CAIR09876567890';