-- Question 1
USE salesdb;

-- Delete Products column from Orders table
ALTER TABLE Orders 
DROP COLUMN Products;

-- Create a new table, OrderProducts, for individual products
CREATE TABLE OrderProducts (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

--Inserting data into OrderProducts table
INSERT INTO OrderProducts (OrderID, Product)
VALUES 
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Tablet'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Phone');

-- Question 2

USE salesdb; 

-- Delete   Product, Quanity columns from  table
ALTER TABLE Orders
DROP COLUMN Product, 
DROP COLUMN Quantity;

-- Create a table for OrderItems for columns to depend on primary key
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


-- Inserting data into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);


