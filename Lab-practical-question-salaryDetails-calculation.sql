CREATE TABLE salaryDetails
(e_name VARCHAR(50),
e_num VARCHAR(50),
dept VARCHAR(50),
branch VARCHAR(50),
basic FLOAT,
HRA VARCHAR(50),
deduction VARCHAR(50),
tax INT,
date_of_join DATE);


INSERT INTO salaryDetails
(e_name,e_num,dept,branch,basic,HRA,deduction,tax,date_of_join)
VALUES
("Snehasish Deb",10,"IT","SDB",75000,20000,27,16,'2020-02-11'),
("Himangshu De",11,"Sales","Marketing",60000,14500,24,16,'2021-11-09'),
("Raj Ghosh",12,"HR","Marketing",70000,30000,43,40,'2025-01-02'),
("Omi khan",13,"IT","security",150000,35000,15,14,'2023-05-06'),
("Jibes Mondal",14,"Full stack","security",80000,10000,12,14,'2023-01-08');
INSERT INTO salaryDetails
(e_name,e_num,dept,branch,basic,HRA,deduction,tax,date_of_join)
VALUES
("Subasisha",15,"IT","FULL STACK",80000,20000,27,16,'2023-02-11');



SELECT * FROM salaryDetails;

--  Find the average of basic pay from the table
SELECT avg(basic) FROM salaryDetails;
--  Determine the max and min of deduction from the above table
SELECT max(deduction) FROM salaryDetails;
SELECT min(deduction) FROM salaryDetails;
--  sort all the records as per their basic pay in ascending order
SELECT * FROM salaryDetails ORDER BY basic ASC;
-- sort all the records as date of join(doj)
SELECT * FROM salaryDetails ORDER BY date_of_join ASC;
-- Display all the records whose e_num starts with "S" and ends with "A" and middle letter is "S"
SELECT e_name FROM salaryDetails WHERE e_name LIKE "S%%%S%%%A";



