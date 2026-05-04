-- ==========================================================
-- ASSIGNMENT NO: 3
-- Aim: SQL DML
-- Problem Statement:
-- Design SQL queries using DML statements such as
-- INSERT, SELECT, UPDATE, DELETE with operators,
-- functions and set operators.
-- ==========================================================

-- 1. Creating Database
-- The CREATE DATABASE statement is used to create a new SQL database.
CREATE DATABASE Tutorial3;

-- Display databases
SHOW DATABASES;

-- Selecting Database
-- The USE statement is used to select an existing database.
USE Tutorial3;

-- 2. Creating Table Student
-- The CREATE TABLE statement is used to create a table in a database.
CREATE TABLE Student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    division VARCHAR(10),
    branch VARCHAR(30),
    city VARCHAR(30),
    marks INT
);

-- 3. Inserting Records
-- The INSERT INTO statement is used to add new rows of data to a table.
INSERT INTO Student VALUES
(1, 'Sahil', 'SE', 'Computer', 'Pune', 78),
(2, 'Rohan', 'SE', 'IT', 'Mumbai', 65),
(3, 'Sneha', 'TE', 'Computer', 'Pune', 82),
(4, 'Amit', 'BE', 'ENTC', 'Nashik', 55),
(5, 'Sonal', 'TE', 'Computer', 'Pune', 59),
(6, 'Neha', 'SE', 'IT', 'Pune', 48),
(7, 'Sumit', 'BE', 'Mechanical', 'Delhi', 72),
(8, 'Priya', 'TE', 'Computer', 'Mumbai', 90),
(9, 'Suresh', 'SE', 'Computer', 'Pune', 68),
(10, 'Anita', 'BE', 'Civil', 'Pune', 76);

-- 4. SELECT Statement
-- The SELECT statement is used to retrieve data from one or more tables.
SELECT name, city FROM Student;

-- 5. DISTINCT Clause
-- DISTINCT is used to return unique values from a column.
SELECT DISTINCT name FROM Student;

-- 6. Selecting all records
SELECT * FROM Student;

-- 7. Using Comparison Operator
-- '>' operator is used to compare values.
SELECT * FROM Student
WHERE marks > 75;

-- 8. Pattern Matching using LIKE
-- LIKE operator is used for pattern matching.
SELECT * FROM Student
WHERE name LIKE 'S%';

-- 9. Range Condition using BETWEEN
-- BETWEEN is used to select values within a range.
SELECT * FROM Student
WHERE marks BETWEEN 50 AND 60;

-- 10. Logical Operators
-- AND operator is used to combine multiple conditions.
SELECT * FROM Student
WHERE branch = 'Computer' AND city = 'Pune';

-- 11. UPDATE Statement
-- UPDATE command is used to modify existing records.
UPDATE Student
SET branch = 'IT'
WHERE roll_no = 9;

-- 12. DELETE Statement
-- DELETE command is used to remove records from a table.
DELETE FROM Student
WHERE division = 'BE';

-- 13. Creating Table TE_Students
CREATE TABLE TE_Students (
    roll_no INT,
    name VARCHAR(50)
);

-- 14. Inserting Records into TE_Students
INSERT INTO TE_Students VALUES
(1, 'Sahil'),
(2, 'Rohan'),
(3, 'Sneha'),
(4, 'Amit'),
(5, 'Sonal'),
(6, 'Neha'),
(7, 'Sumit'),
(8, 'Priya'),
(9, 'Suresh'),
(10, 'Anita');

-- 15. SET Operator (UNION)
-- UNION operator is used to combine the result of two SELECT statements.
SELECT roll_no FROM Student
UNION
SELECT roll_no FROM TE_Students;
