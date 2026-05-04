-- ==========================================================
-- ASSIGNMENT NO: 2
-- Aim: SQL DDL
-- Problem Statement:
-- Design and develop SQL DDL statements to demonstrate
-- the use of SQL objects such as Table, View, Index.
-- ==========================================================

-- 1. Creating a Database
-- The CREATE DATABASE statement is used to create a new SQL database.
CREATE DATABASE Tutorial2;

-- Display all available databases
SHOW DATABASES;

-- Selecting the database
-- The USE statement is used to select an existing database.
USE Tutorial2;

-- 2. Creating Table Customers
-- The CREATE TABLE statement is used to create a new table.
CREATE TABLE Customers (
    cust_id INT AUTO_INCREMENT PRIMARY KEY,   -- Primary Key with auto increment
    cust_name VARCHAR(50),                    -- Customer name
    product VARCHAR(50),                      -- Product purchased
    quantity INT,                             -- Quantity of product
    total_price DECIMAL(10,2)                 -- Total price
);

-- 3. Inserting Records into Customers Table
-- INSERT INTO is used to add new rows into the table.
INSERT INTO Customers (cust_name, product, quantity, total_price) VALUES
('Anurag', 'laptop', 1, 55000),
('parth', 'mobile', 2, 30000),
('karan', 'Headphones', 3, 4500),
('rohan', 'keyboard', 3, 3000),
('sahil', 'mouse', 2, 1000);

-- 4. Altering Table
-- ALTER TABLE is used to add a new column to an existing table.
ALTER TABLE Customers
ADD price_per_qty DECIMAL(10,2);

-- 5. Updating Table Data
-- UPDATE statement is used to modify existing records.
UPDATE Customers
SET price_per_qty = total_price / quantity;

-- 6. Creating View
-- A VIEW is a virtual table based on the result-set of a query.
CREATE VIEW Cust_View AS
SELECT cust_id, cust_name
FROM Customers;

-- 7. Updating View Definition
-- CREATE OR REPLACE VIEW modifies an existing view.
CREATE OR REPLACE VIEW Cust_View AS
SELECT cust_id, product, total_price
FROM Customers;

-- 8. Dropping View
-- DROP VIEW is used to delete a view.
DROP VIEW IF EXISTS Cust_View;

-- 9. Creating Index
-- Index is used to retrieve data quickly from the table.
CREATE INDEX Cust_index
ON Customers(cust_name);

-- 10. Dropping Index
-- DROP INDEX removes the index from the table.
DROP INDEX Cust_index ON Customers;

-- 11. Selecting Data
-- SELECT statement is used to retrieve data from the table.
SELECT c.cust_name, c.product
FROM Customers AS c;

-- 12. Renaming Table
-- RENAME TABLE is used to change the table name.
RENAME TABLE Customers TO Cust_Table;

-- 13. Truncating Table
-- TRUNCATE TABLE removes all records from the table.
-- This will give error because table is renamed.
TRUNCATE TABLE Customers;

-- Correct table name after rename
TRUNCATE TABLE Cust_Table;

-- 14. Dropping Table
-- DROP TABLE removes the table from the database.
DROP TABLE IF EXISTS Customers;
