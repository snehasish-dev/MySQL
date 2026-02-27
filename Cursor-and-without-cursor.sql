-- Calculate student marks , grade , percentage and total using cursor 
SHOW DATABASES; 
-- create database 
CREATE DATABASE cursor_problem;
USE cursor_problem;

-- create a student_details table 
CREATE TABLE student_details(rollno INT PRIMARY KEY AUTO_INCREMENT,
student_name VARCHAR(255),class VARCHAR(50), 
marks_science INT,marks_math INT,marks_eng INT);
-- insert minimum five rows 
INSERT INTO 
student_details(student_name,class,marks_science,marks_math,marks_eng)
VALUES
("Snehasish Deb","5th",85,95,75),
("Sarono Pramanik","5th",25,25,65),
("Omi Khatun","5th",70,50,70),
("Himangshu De","5th",80,90,50),
("Raj Ghosh","5th",65,90,70),
("Piu Mondal","5th",85,95,75);

-- Cursor 
DELIMITER $$
CREATE PROCEDURE student_result_cursor()
BEGIN
    DECLARE done INT DEFAULT 0;

    DECLARE v_rollno INT;
    DECLARE v_student_name VARCHAR(255);
    DECLARE v_marks_science INT;
    DECLARE v_marks_math INT;
    DECLARE v_marks_eng INT;
    DECLARE v_total INT;
    DECLARE v_percentage INT;

    -- Cursor declaration
    DECLARE student_cursor CURSOR FOR
        SELECT rollno, student_name, marks_science, marks_math, marks_eng
        FROM student_details;

    -- Handler to stop loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor 
        INTO v_rollno, v_student_name, v_marks_science, v_marks_math, v_marks_eng;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        SET v_total = v_marks_science + v_marks_math + v_marks_eng;
        SET v_percentage = v_total / 3;

        SELECT 
            v_student_name AS Name,
            v_rollno AS RollNo,
            v_marks_science AS Science,
            v_marks_math AS Math,
            v_marks_eng AS English,
            v_total AS Total,
            v_percentage AS Percentage,
            CASE
                WHEN v_percentage > 80 THEN 'Grade A'
                WHEN v_percentage > 60 THEN 'Grade B'
                ELSE 'Grade C'
            END AS Grade;

    END LOOP;

    CLOSE student_cursor;
END$$
DELIMITER ;

CALL student_result_cursor();


-- --------------Without cursor -------------------------
SELECT *,
       (marks_science + marks_math + marks_eng) AS total,
       (marks_science + marks_math + marks_eng)/3 AS percentage,
       CASE
           WHEN (marks_science + marks_math + marks_eng)/3 > 80 THEN 'Grade A'
           WHEN (marks_science + marks_math + marks_eng)/3 > 60 THEN 'Grade B'
           ELSE 'Grade C'
       END AS grade
FROM student_details;

SELECT * FROM student_details;

