-- ==========================================================
-- ASSIGNMENT NO: 5
-- Aim: PL/SQL Stored Procedure and Stored Function
-- Problem Statement:
-- Write a Stored Procedure namely proc_Grade for categorization
-- of students based on marks using control structures and
-- exception handling.
-- ==========================================================

-- 1. Create Table Stud_Marks
-- CREATE TABLE is used to create a table structure.
CREATE TABLE Stud_Marks (
    name VARCHAR(50),
    total_marks INT
);

-- 2. Create Table Result
CREATE TABLE Result (
    Roll INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Class VARCHAR(50)
);

-- 3. Insert Sample Data
-- INSERT INTO is used to add records.
INSERT INTO Stud_Marks VALUES
('Anurag', 1200),
('Rahul', 950),
('Sneha', 870),
('Priya', 1000),
('Amit', 800);

-- 4. Create Stored Procedure proc_Grade
-- Stored Procedure is used to perform operations using control structures.
DELIMITER $$

CREATE PROCEDURE proc_Grade()
BEGIN
    -- Declare variables
    DECLARE done INT DEFAULT 0;
    DECLARE s_name VARCHAR(50);
    DECLARE marks INT;

    -- Cursor to fetch data
    DECLARE cur CURSOR FOR SELECT name, total_marks FROM Stud_Marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open cursor
    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO s_name, marks;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Control Structure using IF condition
        IF marks >= 990 AND marks <= 1500 THEN
            INSERT INTO Result(Name, Class) VALUES (s_name, 'Distinction');

        ELSEIF marks BETWEEN 900 AND 989 THEN
            INSERT INTO Result(Name, Class) VALUES (s_name, 'First Class');

        ELSEIF marks BETWEEN 825 AND 899 THEN
            INSERT INTO Result(Name, Class) VALUES (s_name, 'Higher Second Class');

        ELSE
            INSERT INTO Result(Name, Class) VALUES (s_name, 'Pass Class');
        END IF;

    END LOOP;

    -- Close cursor
    CLOSE cur;

END $$

DELIMITER ;

-- 5. Calling the Procedure
-- CALL statement is used to execute stored procedure.
CALL proc_Grade();

-- 6. Display Result
SELECT * FROM Result;

-- 7. Stored Function (Optional as per Aim)
-- Function returns a value based on marks.

DELIMITER $$

CREATE FUNCTION get_grade(marks INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(50);

    IF marks >= 990 AND marks <= 1500 THEN
        SET grade = 'Distinction';

    ELSEIF marks BETWEEN 900 AND 989 THEN
        SET grade = 'First Class';

    ELSEIF marks BETWEEN 825 AND 899 THEN
        SET grade = 'Higher Second Class';

    ELSE
        SET grade = 'Pass Class';
    END IF;

    RETURN grade;
END $$

DELIMITER ;

-- 8. Using Function
SELECT name, total_marks, get_grade(total_marks) AS Grade
FROM Stud_Marks;
