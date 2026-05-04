-- ==========================================================
-- ASSIGNMENT NO: 6
-- Aim: Cursors (Parameterized Cursor)
-- Problem Statement:
-- Write a PL/SQL block using parameterized cursor to merge
-- data from N_RollCall into O_RollCall. If data already exists,
-- it should be skipped.
-- ==========================================================

-- 1. Create N_RollCall (New Table)
CREATE TABLE N_RollCall (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(20),
    Subject VARCHAR(30)
);

-- 2. Create O_RollCall (Old Table)
CREATE TABLE O_RollCall (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(20),
    Subject VARCHAR(30)
);

-- 3. Insert Data into N_RollCall
INSERT INTO N_RollCall VALUES
(1, 'Riya', 'DBMS'),
(2, 'Kunal', 'OS'),
(3, 'Megha', 'Java'),
(4, 'Arjun', 'Python'),
(5, 'Sakshi', 'AI'),
(6, 'Vivek', 'Web Technology');

-- 4. Insert Data into O_RollCall
INSERT INTO O_RollCall VALUES
(1, 'Riya', 'DBMS'),
(2, 'Kunal', 'OS'),
(3, 'Megha', 'Java'),
(7, 'Rohit', 'Cyber Security'),
(8, 'Neha', 'Cloud Computing');

-- 5. Display Initial Data
SELECT * FROM N_RollCall;
SELECT * FROM O_RollCall;

-- 6. Create Procedure using Parameterized Cursor
DELIMITER $$

CREATE PROCEDURE Merge_RollCall(IN P_Subject VARCHAR(50))
BEGIN
    -- Declare variables
    DECLARE V_Roll_No INT;
    DECLARE V_Name VARCHAR(50);
    DECLARE V_Subject VARCHAR(50);
    DECLARE V_Count INT;
    DECLARE Done INT DEFAULT 0;

    -- Declare Cursor
    DECLARE my_cur CURSOR FOR
        SELECT RollNo, Name, Subject 
        FROM N_RollCall 
        WHERE Subject = P_Subject;

    -- Handler for end of cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET Done = 1;

    -- Open Cursor
    OPEN my_cur;

    read_loop: LOOP
        FETCH my_cur INTO V_Roll_No, V_Name, V_Subject;

        IF Done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- Check for duplicate in O_RollCall
        SELECT COUNT(*) INTO V_Count 
        FROM O_RollCall 
        WHERE RollNo = V_Roll_No;

        IF V_Count = 0 THEN
            -- Insert if not present
            INSERT INTO O_RollCall(RollNo, Name, Subject) 
            VALUES (V_Roll_No, V_Name, V_Subject);

            SELECT CONCAT('Inserted: ', V_Roll_No, ', ', V_Name) AS Result;

        ELSE
            -- Skip duplicate
            SELECT CONCAT('Duplicate skipped for Roll No: ', V_Roll_No) AS Result;
        END IF;

    END LOOP;

    -- Close Cursor
    CLOSE my_cur;

END $$

DELIMITER ;

-- 7. Execute Procedure with Different Subjects
CALL Merge_RollCall('OS');
CALL Merge_RollCall('Python');
CALL Merge_RollCall('AI');
CALL Merge_RollCall('Web Technology');
CALL Merge_RollCall('Java');

-- 8. Display Final Table
SELECT * FROM O_RollCall;
