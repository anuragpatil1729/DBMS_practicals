// ==========================================================
// ASSIGNMENT NO: 11
// Aim: JDBC Connectivity using Java
// Problem Statement:
// Develop a Java application to connect to MySQL database
// and perform insert operation.
// ==========================================================


// 1. Create Database
-- CREATE DATABASE is used to create a new database.
CREATE DATABASE testdb;


// 2. Create User
-- CREATE USER is used to create a new database user.
CREATE USER 'testuse@localhost' IDENTIFIED BY 'password';


// 3. Grant Privileges
-- GRANT statement is used to assign permissions.
GRANT ALL PRIVILEGES ON testdb.* TO 'testuse@localhost';


// 4. Apply Changes
FLUSH PRIVILEGES;


// 5. Create Table
USE testdb;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INT,
    email VARCHAR(100)
);
