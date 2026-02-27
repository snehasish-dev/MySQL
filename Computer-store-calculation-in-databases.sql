-- Computer Shop GST and Total amount calculation using trigger 
-- create a store database 
CREATE DATABASE store;
USE store;
-- create a computer store table 
CREATE  TABLE computer_store
(id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(255),warranty VARCHAR(255),
quantity INT,per_piece_price FLOAT,total_amount FLOAT,
GST_18_PERCENT FLOAT,warranty_start TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
-- cerate a trigger to calculate GST and Total amount 
DELIMITER $$
CREATE TRIGGER GST_calculation
BEFORE INSERT ON computer_store
FOR EACH ROW 
BEGIN
	SET NEW.total_amount = NEW.quantity * NEW.per_piece_price;
	SET NEW.GST_18_PERCENT =  NEW.total_amount * (18/100);
END $$
DELIMITER ;
-- Insert minimum five rows in computer store table
INSERT INTO computer_store
(product_name,warranty,quantity,per_piece_price)
VALUES 
("Monitor","6-month",2,3500),
("Gaming Mouse","1-year",4,500),
("RGB keyboard","2-year",8,700),
("Intel i5 10th gen Processor","4-year",3,8000);

SELECT * FROM computer_store;