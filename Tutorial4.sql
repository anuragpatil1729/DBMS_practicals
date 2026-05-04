-- ==========================================================
-- ASSIGNMENT NO: 4
-- Aim: JOINs
-- Problem Statement:
-- Design SQL queries using joins, subqueries and set operations.
-- ==========================================================

-- 1. Creating Database
-- The CREATE DATABASE statement is used to create a new SQL database.
CREATE DATABASE Tutorial4;

-- Display databases
SHOW DATABASES;

-- Select database
USE Tutorial4;

-- 2. Creating Customers Table
-- The CREATE TABLE statement is used to create a new table.
CREATE TABLE Customers (
    ID INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    address VARCHAR(100),
    salary DECIMAL(10,2)
);

-- 3. Creating Orders Table
CREATE TABLE Orders (
    O_ID INT PRIMARY KEY,
    o_date DATE,
    customer_id INT,
    amount DECIMAL(10,2)
);

-- 4. Inserting Records into Customers
-- INSERT INTO statement is used to insert records.
INSERT INTO Customers VALUES
(1, 'Anurag', 23, 'Pune', 18000),
(2, 'Rahul', 25, 'Mumbai', 22000),
(3, 'Sneha', 24, 'Pune', 26000),
(4, 'Priya', 27, 'Delhi', 30000),
(5, 'Amit', 22, 'Mumbai', 15000);

-- 5. Inserting Records into Orders
INSERT INTO Orders VALUES
(101, '2025-01-10', 1, 5000),
(102, '2025-01-12', 2, 12000),
(103, '2025-01-15', 3, 8000),
(104, '2025-01-20', 2, 6000),
(105, '2025-01-25', 6, 7000);

-- 6. INNER JOIN
-- INNER JOIN returns rows when there is a match in both tables.
SELECT c.ID, c.name, o.amount, o.o_date
FROM Customers c
INNER JOIN Orders o
ON c.ID = o.customer_id;

-- 7. LEFT JOIN
-- LEFT JOIN returns all rows from left table and matched rows from right table.
SELECT c.ID, c.name, o.amount, o.o_date
FROM Customers c
LEFT JOIN Orders o
ON c.ID = o.customer_id;

-- 8. RIGHT JOIN
-- RIGHT JOIN returns all rows from right table and matched rows from left table.
SELECT c.ID, c.name, o.amount, o.o_date
FROM Customers c
RIGHT JOIN Orders o
ON c.ID = o.customer_id;

-- 9. FULL JOIN using UNION ALL
-- MySQL does not support FULL JOIN, so UNION ALL is used.
SELECT c.ID, c.name, o.amount, o.o_date
FROM Customers c
LEFT JOIN Orders o
ON c.ID = o.customer_id

UNION ALL

SELECT c.ID, c.name, o.amount, o.o_date
FROM Customers c
RIGHT JOIN Orders o
ON c.ID = o.customer_id
WHERE c.ID IS NULL;

-- 10. SELF JOIN
-- SELF JOIN is used to join a table with itself.
SELECT c1.name AS Customer1, c2.name AS Customer2, c1.address
FROM Customers c1
JOIN Customers c2
ON c1.address = c2.address
AND c1.ID < c2.ID;

-- 11. CROSS JOIN
-- CROSS JOIN returns Cartesian product of two tables.
SELECT c.ID, c.name, o.amount, o.o_date
FROM Customers c
CROSS JOIN Orders o;

-- 12. Subquery with SELECT
-- Subquery is a query inside another query.
SELECT *
FROM Customers
WHERE ID IN (
    SELECT ID
    FROM Customers
    WHERE salary > 20000
);

-- 13. Creating Backup Table using Subquery
-- Subquery can be used with INSERT or CREATE.
CREATE TABLE cust_bkp AS
SELECT * FROM Customers;

-- 14. UPDATE using Subquery
-- UPDATE statement modifies existing records using subquery.
UPDATE Customers
SET salary = salary + (salary * 0.10)
WHERE ID IN (
    SELECT ID
    FROM cust_bkp
    WHERE age >= 24
);

-- 15. DELETE using Subquery
-- DELETE removes records based on subquery condition.
DELETE FROM Customers
WHERE ID IN (
    SELECT ID
    FROM cust_bkp
    WHERE age > 26
);
