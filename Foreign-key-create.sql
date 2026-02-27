-- create a database name if not exists in database
CREATE DATABASE IF NOT EXISTS test1;
USE test1;
-- create a department table and insert minimum five entities
CREATE TABLE dep(id INT PRIMARY KEY,name VARCHAR(50));
INSERT INTO dep(id,name)
VALUES
(101,"Computer Science"),
(102,"Mathematices"),
(103,"Physics"),
(104,"Chemistry"),
(105,"Bilogy");
SELECT * FROM dep;
-- create a theacher table and insert minimum five entities
CREATE TABLE teacher(id INT PRIMARY KEY,name VARCHAR(50),dep_id INT,
FOREIGN KEY (dep_id) references dep(id)); 
INSERT INTO 
teacher(id,name,dep_id)
VALUES
(101,"Admin",101),
(102,"Bod",103),
(103,"Casey",102),
(104,"Donatd",103);
SELECT * FROM teacher;
-- create a city table and insert minimum five entities
SHOW TABLES;
CREATE TABLE city(id INT PRIMARY KEY,city_name VARCHAR(50));
INSERT INTO city(id,city_name) VALUES(1,"Pune"),
(2,"Delhi"),(3,"WestBengal");

CREATE TABLE student(id INT PRIMARY KEY,name VARCHAR(50),city_id INT,
FOREIGN KEY (city_id) references city(id));
INSERT INTO student VALUES
(1,"Snehasish",1);

SELECT * FROM student;

CREATE TABLE student(id INT PRIMARY KEY,
name VARCHAR(50),age INT,constraint age_check CHECK (age > 18)); 
INSERT INTO student(id,name,age)
VALUES(1,"Snehasish",19);

CREATE TABLE student(id INT PRIMARY KEY,name VARCHAR(50),
rollno INT UNIQUE,age INT DEFAULT 18);


SHOW DATABASES;

USE  snehasish;
SHOW TABLES;
SELECT * FROM students;
DROP TABLE students;