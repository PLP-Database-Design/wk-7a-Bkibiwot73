### Question 1 Achieving 1NF (First Normal Form) 🛠️
-- Create the ProductDetail table with normalized structure
CREATE TABLE ProductDetail (
OrderID INT PRIMARY KEY,  -- Unique identifier for each order
CustomerName VARCHAR(100),  -- Name of the customer placing the order
Products VARCHAR(100)  -- Single product per row
);

-- Insert data into ProductDetail table
-- Each row represents a single product for an order
INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'James Smith', 'Tablet'),
(102, 'James Smith', 'Keyboard'),
(102, 'James Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');




-- ### Question 2: Achieving 2NF (Second Normal Form) 🧩
-- Create the Orders table to remove partial dependency of CustomerName on OrderID
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY, -- Unique identifier for each order
    CustomerName VARCHAR(100) -- Name of the customer
);

-- Insert data into Orders table
-- Each OrderID is associated with a single CustomerName
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Create the OrderItems table (OrderID + Product → Quantity)
CREATE TABLE OrderItems (
    OrderID INT, -- Foreign key referencing Orders table
    Product VARCHAR(100), -- Name of the product
    Quantity INT, -- Quantity of the product in the order
    PRIMARY KEY (OrderID, Product), -- Composite primary key to ensure uniqueness
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) -- Enforce referential integrity
);

-- Insert data into OrderItems table
-- Each row represents a product and its quantity for a specific order
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);















