-- Question 1
USE salesdb;

-- Step 1: Delete Products column from Orders table 
ALTER TABLE Orders 
DROP COLUMN Products;

-- Step 2: Create a new table, OrderProducts, to hold products for each order
CREATE TABLE OrderProducts (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 3: Insert data into OrderProducts table
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

-- Step 1: Delete Product and Quantity columns from Orders table 
ALTER TABLE Orders
DROP COLUMN Product,
DROP COLUMN Quantity;

-- Step 2: Create OrderItems table with composite primary key
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 3: Insert data into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
