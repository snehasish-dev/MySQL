USE practices;
-- create a city table 
CREATE TABLE city(city_id INT PRIMARY KEY,city_name VARCHAR(255));
INSERT INTO city(city_id,city_name)
VALUES
(1001,"Ranaghata"),
(1002,"Chakdaha"),
(1003,"Mandal Hat");
-- create student table 
CREATE TABLE 
stduent
(roll INT PRIMARY KEY,
name VARCHAR(255),
city_id INT ,FOREIGN KEY(city_id) REFERENCES city(city_id));
-- insert five rows in student table
INSERT INTO stduent(roll,name,city_id)
VALUES
(1,"Snehasish Deb",1001),
(2,"Hiamngshu De",1002),
(3,"RajDep",1003);
-- create a mobile no table in practices database
CREATE TABLE mobile_no
(roll INT NOT NULL,mobile_number INT,FOREIGN KEY(roll) REFERENCES stduent(roll));
INSERT INTO mobile_no(roll,mobile_number)
VALUES 
(1,8878747),
(2,76477547),
(3,66764746),
(1,56335747),
(2,64546464);

SELECT * FROM mobile_no;
-- single line 
ALTER TABLE mobile_no 
ADD COLUMN city_id INT NOT NULL;

UPDATE mobile_no SET city_id = 1001 WHERE roll = 1;	
UPDATE mobile_no SET city_id = 1002 WHERE roll = 2;	
UPDATE mobile_no SET city_id = 1003 WHERE roll = 3;	
UPDATE mobile_no SET city_id = 1001 WHERE roll = 4;	


ALTER TABLE mobile_no
ADD CONSTRAINT 
FOREIGN KEY (city_id) REFERENCES city(city_id);

SHOW TABLES;
SELECT * FROM mobile_no;
    
    
    
CREATE INDEX idx_mobile_number ON mobile_no(mobile_number);
    
-- connected all tables through connect table 
CREATE TABLE connect(sl_no INT PRIMARY KEY AUTO_INCREMENT,city_id INT,FOREIGN KEY(city_id) REFERENCES city(city_id),
roll INT,FOREIGN KEY(roll) REFERENCES stduent(roll),
mobile_number INT,FOREIGN KEY(mobile_number) REFERENCES mobile_no(mobile_number));

