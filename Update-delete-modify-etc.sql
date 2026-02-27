CREATE DATABASE IF NOT EXISTS test;
USE test;
CREATE TABLE student(rollno INT PRIMARY KEY,name VARCHAR(50),marks INT);
SELECT * FROM student;
INSERT INTO student(rollno,name,marks) VALUES
(101,"anil",75),
(102,"bhumika",93),
(103,"chetan",85),
(104,"dhruv",96),
(105,"emanuel",92),
(106,"farah",82);

SELECT rollno,name FROM student WHERE (rollno % 2 = 0);
ALTER TABLE student ADD COLUMN city VARCHAR(50);

UPDATE  student SET city = "Pune" WHERE rollno = 101;
UPDATE  student SET city = "Mumbai" WHERE rollno = 102;
UPDATE  student SET city = "Mumbai" WHERE rollno = 103;
UPDATE  student SET city = "Delhi" WHERE rollno = 106;
SELECT * FROM student;

SELECT * FROM student WHERE city = "Delhi";
SELECT max(marks) FROM (SELECT * FROM student WHERE city = "Delhi") AS temp;
SELECT MAX(marks) FROM student WHERE city = "Delhi";

SELECT (SELECT MAX(marks) FROM student),name
FROM student;


CREATE VIEW view1 AS 
SELECT rollno,name FROM student;

SELECT * FROM view1;
