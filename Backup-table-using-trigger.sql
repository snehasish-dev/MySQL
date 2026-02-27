-- Create a backup table using trigger 
SHOW DATABASES;
USE test_trigger;
-- create a student table 
CREATE TABLE student_new(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    marks INT,
    grade CHAR(1)
);
-- insert minimum five rows in student_new table 
INSERT INTO student_new
(name,marks,grade)
VALUES
("Snehasish Deb",80,'A'),
("Himangshu De",85,'A'),
("Raj Ghosh",70,'B'),
("Avijit Roy",50,'D'),
("Riya Sarkar",60,'C');
-- create a student_new table backup table
CREATE TABLE student_delete_data(
    id INT,
    name VARCHAR(100),
    marks INT,
    grade CHAR(1),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Create trigger 
DELIMITER $$
CREATE TRIGGER after_delete_student
AFTER DELETE ON student_new
FOR EACH ROW
BEGIN
    INSERT INTO student_delete_data(id, name, marks, grade)
    VALUES (OLD.id, OLD.name, OLD.marks, OLD.grade);
END$$
DELIMITER ;

-- Print full table
SELECT * FROM student_delete_data;
-- Print full table
SELECT * FROM student_new;
-- Delete any data in student_new table 
DELETE FROM student_new WHERE id = 1;



