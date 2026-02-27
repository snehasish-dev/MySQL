USE temp;
SHOW TABLES;
DROP TABLE employee;
CREATE TABLE employee(empNo VARCHAR(10) PRIMARY KEY,emp_name VARCHAR(50),
dept VARCHAR(50),salary FLOAT(10),doj DATE,branch VARCHAR(50));

INSERT INTO employee(empNo, emp_name, dept, salary, doj, branch)
VALUES
('E101', 'AMIT', 'Production', 45000, '2000-03-12', 'Bangalore'),
('E102', 'SUMIT', 'HR', 70000, '2002-07-03', 'Bangalore'),
('E103', 'SUNITA', 'Management', 120000, '2001-01-11', 'Mysore'),
('E104', 'SOURABH', 'IT', 67000, '2001-08-01', 'Mysore'),
('E105', 'SUMI', 'Civil', 145000, '2003-09-20', 'Mumbai');

--  Execute the statement shortcut key (ctrl+Enter);
SELECT * FROM employee;

SELECT empNo,salary FROM  employee;

SELECT * FROM employee WHERE salary > 120000;

SELECT  emp_name FROM employee ORDER BY emp_name DESC;

SELECT * FROM employee WHERE emp_name = 'AMIT' AND salary > 50000;