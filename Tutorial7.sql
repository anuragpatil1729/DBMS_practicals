-- ==========================================================
-- ASSIGNMENT NO: 7
-- Aim: Database Trigger
-- Problem Statement:
-- Create triggers on Library table to store old values of
-- updated and deleted records into Library_Audit table.
-- ==========================================================


-- 1. Create Library Table
CREATE TABLE Library(
    book_id INT NOT NULL PRIMARY KEY,
    title VARCHAR(30),
    author_name VARCHAR(30),
    publish_year INT
);


-- 2. Create Library_Audit Table
CREATE TABLE Library_Audit(
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(20),
    book_id INT,
    title VARCHAR(30),
    author VARCHAR(30),
    publish_year INT,
    action_time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    trigger_type VARCHAR(30)
);


-- 3. Insert Records into Library
INSERT INTO Library VALUES
(201,'Data Structures','Mark Allen',2005),
(202,'Computer Networks','Andrew Tanenbaum',2010),
(203,'Operating System','Silberschatz',2008),
(204,'Machine Learning','Tom Mitchell',2015);


-- 4. BEFORE UPDATE Trigger
DELIMITER $$

CREATE TRIGGER before_update
BEFORE UPDATE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit
    (action_type, book_id, title, author, publish_year, trigger_type)
    VALUES
    ('UPDATE', OLD.book_id, OLD.title, OLD.author_name, OLD.publish_year, 'BEFORE_UPDATE');
END $$

DELIMITER ;


-- 5. AFTER UPDATE Trigger
DELIMITER $$

CREATE TRIGGER after_update
AFTER UPDATE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit
    (action_type, book_id, title, author, publish_year, trigger_type)
    VALUES
    ('UPDATE', OLD.book_id, OLD.title, OLD.author_name, OLD.publish_year, 'AFTER_UPDATE');
END $$

DELIMITER ;


-- 6. BEFORE DELETE Trigger
DELIMITER $$

CREATE TRIGGER before_delete_library
BEFORE DELETE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit
    (action_type, book_id, title, author, publish_year, trigger_type)
    VALUES
    ('DELETE', OLD.book_id, OLD.title, OLD.author_name, OLD.publish_year, 'BEFORE_DELETE');
END $$

DELIMITER ;


-- 7. AFTER DELETE Trigger
DELIMITER $$

CREATE TRIGGER after_delete_library
AFTER DELETE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit
    (action_type, book_id, title, author, publish_year, trigger_type)
    VALUES
    ('DELETE', OLD.book_id, OLD.title, OLD.author_name, OLD.publish_year, 'AFTER_DELETE');
END $$

DELIMITER ;


-- 8. Perform UPDATE Operation
UPDATE Library
SET title = 'Advanced Operating Systems'
WHERE book_id = 202;


-- 9. Perform DELETE Operation
DELETE FROM Library
WHERE book_id = 202;


-- 10. Display Tables
SELECT * FROM Library;
SELECT * FROM Library_Audit;
