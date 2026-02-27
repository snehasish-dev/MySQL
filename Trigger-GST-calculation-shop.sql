CREATE DATABASE IF NOT EXISTS account_transaction;
USE account_transaction;
SHOW TABLES;
DROP TABLE accounts;

CREATE  TABLE computer_store
(id INT AUTO_INCREMENT PRIMARY KEY,product_name VARCHAR(255),product_price FLOAT,GST_18_PERCENT FLOAT);

INSERT INTO computer_store(product_name,product_price)
VALUES
("Monitor",500),
("Intel i5 10th Gne Processor",10800),
("Gaming Mouse",700),
("Keyboard And Mouse combo",1800);

SELECT * FROM computer_store;

DELIMITER $$
CREATE TRIGGER GST_calculation
BEFORE INSERT ON computer_store
FOR EACH ROW 
BEGIN
	SET NEW.GST_18_PERCENT =  NEW.product_price * (18/100);
END $$
DELIMITER ;

    
    
    
    






