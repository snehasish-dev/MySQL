-- Grade calculation using trigger 
CREATE DATABASE IF NOT EXISTS test_trigger;
USE test_trigger;
-- create a student table 
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    marks INT,
    grade CHAR(1)
);
-- insert minimum five rows 
INSERT INTO student 
(name,marks,grade)
VALUES
("Snehasish Deb",80,'A'),
("Himangshu De",85,'A'),
("Raj Ghosh",70,'B'),
("Avijit Roy",50,'D'),
("Riya Sarkar",60,'C');

SELECT * FROM student;
TRUNCATE TABLE student; -- remove all data in student table 
-- create a triiger to calculate grade
DELIMITER $$
CREATE TRIGGER before_student_insert
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
    IF NEW.marks >= 90 THEN
        SET NEW.grade = 'A';
    ELSEIF NEW.marks >= 75 THEN
        SET NEW.grade = 'B';
    ELSEIF NEW.marks >= 50 THEN
        SET NEW.grade = 'C';
    ELSE
        SET NEW.grade = 'F';
    END IF;
END$$
DELIMITER ;

INSERT INTO student (name, marks) VALUES ('John', 82);
SELECT * FROM  student;
