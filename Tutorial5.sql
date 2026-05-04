-- ==========================================================
-- ASSIGNMENT NO: 5
-- Aim: PL/SQL Stored Procedure and Stored Function
-- Problem Statement:
-- Write a Stored Procedure namely proc_Grade for categorization
-- of students based on marks using control structure.
-- ==========================================================

-- 1. Create Student Table
create table student(
    roll_no int not null primary key,
    name varchar(20),
    total int
);

-- 2. Display Table Structure
describe student;

-- 3. Insert Records
insert into student(roll_no,name,total)
values
(1,'Aman',1200),
(2,'Neeraj',980),
(3,'Kiran',910),
(4,'Pooja',870),
(5,'Rohit',800);

-- 4. Display Records
select * from student;

-- 5. Create Result Table
create table result(
    roll_no int,
    name varchar(50),
    grade varchar(50)
);

-- 6. Display Structure
describe result;

-- 7. Create Function to Calculate Grade
DELIMITER ##

CREATE FUNCTION cal_grade(P INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE g VARCHAR(50);

    IF P <= 1500 AND P >= 990 THEN
        SET g = 'Distinction';

    ELSEIF P >= 900 AND P <= 989 THEN
        SET g = 'First Class';

    ELSEIF P >= 825 AND P <= 899 THEN
        SET g = 'Higher Second Class';

    ELSE
        SET g = 'Fail';
    END IF;

    RETURN g;
END ##

-- 8. Create Procedure using Cursor
DELIMITER ##

CREATE PROCEDURE proc_grade()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_roll INT;
    DECLARE v_name VARCHAR(50);
    DECLARE v_total INT;

    -- Cursor Declaration
    DECLARE cur_grade CURSOR FOR
        SELECT roll_no, name, total FROM student;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur_grade;

    get_grade: LOOP
        FETCH cur_grade INTO v_roll, v_name, v_total;

        IF done THEN
            LEAVE get_grade;
        END IF;

        -- Insert calculated grade
        INSERT INTO result(roll_no, name, grade)
        VALUES (v_roll, v_name, cal_grade(v_total));

    END LOOP;

    CLOSE cur_grade;
END ##

DELIMITER ;

-- 9. Execute Procedure
CALL proc_grade();

-- 10. Display Result
SELECT * FROM result;
