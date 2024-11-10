------------------------------------------------------------------------------------------------------------------- TASK - 1
-- Create the TechShop database
CREATE DATABASE TechShop;

-- Use the TechShop database
USE TechShop;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY, -- Unique identifier for each customer
    FirstName VARCHAR(50) NOT NULL, -- First name of the customer
    LastName VARCHAR(50) NOT NULL, -- Last name of the customer
    Email VARCHAR(100) UNIQUE NOT NULL, -- Unique email address
    Phone VARCHAR(15), -- Phone number of the customer
    Address VARCHAR(255) -- Address of the customer
);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY, -- Unique identifier for each product
    ProductName VARCHAR(100) NOT NULL, -- Name of the product
    Description TEXT, -- Detailed description of the product
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0) -- Price of the product (must be non-negative)
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY, -- Unique identifier for each order
    CustomerID INT, -- ID of the customer who placed the order
    OrderDate DATETIME NOT NULL, -- Date when the order was placed
    TotalAmount DECIMAL(10, 2) NOT NULL CHECK (TotalAmount >= 0), -- Total cost of the order (must be non-negative)
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- Foreign key linking to the Customers table
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY, -- Unique identifier for each order detail
    OrderID INT, -- ID of the related order
    ProductID INT, -- ID of the product being ordered
    Quantity INT NOT NULL CHECK (Quantity > 0), -- Quantity of the product ordered (must be greater than 0)
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), -- Foreign key linking to the Orders table
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) -- Foreign key linking to the Products table
);

-- Create the Inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY, -- Unique identifier for each inventory record
    ProductID INT, -- ID of the product in inventory
    QuantityInStock INT NOT NULL CHECK (QuantityInStock >= 0), -- Quantity of the product in stock (must be non-negative)
    LastStockUpdate DATETIME NOT NULL, -- Date of the last stock update
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) -- Foreign key linking to the Products table
);


-- Insert sample records into the Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '987-654-3210', '123 Elm Street, Springfield, IL'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak Avenue, Austin, TX'),
(3, 'Michael', 'Brown', 'michael.brown@example.com', '345-678-9012', '789 Pine Road, Miami, FL'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '456-789-0123', '321 Maple Lane, Denver, CO'),
(5, 'Chris', 'Wilson', 'chris.wilson@example.com', '567-890-1234', '654 Birch Blvd, Seattle, WA'),
(6, 'Sarah', 'Miller', 'sarah.miller@example.com', '678-901-2345', '987 Cedar Street, Boston, MA'),
(7, 'David', 'Garcia', 'david.garcia@example.com', '789-012-3456', '111 Willow Way, Phoenix, AZ'),
(8, 'Anna', 'Martinez', 'anna.martinez@example.com', '890-123-4567', '222 Cypress Court, Las Vegas, NV'),
(9, 'James', 'Anderson', 'james.anderson@example.com', '901-234-5678', '333 Poplar Place, Chicago, IL'),
(10, 'Laura', 'Lee', 'laura.lee@example.com', '012-345-6789', '444 Redwood Road, San Diego, CA');

-- Insert sample records into the Products table
INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1, 'iPhone 15', 'Latest model smartphone with 256GB storage and dual cameras', 999.99),
(2, 'Samsung Galaxy S24', 'High-performance smartphone with 512GB storage', 899.99),
(3, 'Dell XPS 13', 'Lightweight laptop with Intel i7, 16GB RAM, and 512GB SSD', 1299.99),
(4, 'Apple MacBook Air', 'M2 chip, 8GB RAM, 256GB SSD, 13.3-inch Retina display', 1099.99),
(5, 'Sony WH-1000XM5', 'Wireless noise-cancelling headphones', 349.99),
(6, 'Amazon Echo Dot', 'Smart speaker with Alexa voice control', 49.99),
(7, 'GoPro Hero 12', 'Waterproof action camera with 4K recording', 399.99),
(8, 'Fitbit Charge 6', 'Fitness tracker with heart rate monitoring and GPS', 149.99),
(9, 'Canon EOS R8', 'Mirrorless camera with 24.2MP sensor and 4K video', 1499.99),
(10, 'JBL Flip 6', 'Portable Bluetooth speaker with powerful sound', 129.99);

-- Insert sample records into the Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-02-01', 1049.98),
(2, 2, '2024-02-03', 1299.99),
(3, 3, '2024-02-05', 1999.98),
(4, 4, '2024-02-07', 399.99),
(5, 5, '2024-02-10', 149.99),
(6, 6, '2024-02-12', 999.99),
(7, 7, '2024-02-15', 349.99),
(8, 8, '2024-02-18', 49.99),
(9, 9, '2024-02-20', 1499.99),
(10, 10, '2024-02-22', 129.99);

-- Insert sample records into the OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1), -- Order 1: 1 unit of Product 1
(2, 1, 5, 1), -- Order 1: 1 unit of Product 5
(3, 2, 3, 1), -- Order 2: 1 unit of Product 3
(4, 3, 4, 2), -- Order 3: 2 units of Product 4
(5, 3, 6, 1), -- Order 3: 1 unit of Product 6
(6, 4, 7, 1), -- Order 4: 1 unit of Product 7
(7, 5, 8, 1), -- Order 5: 1 unit of Product 8
(8, 6, 1, 1), -- Order 6: 1 unit of Product 1
(9, 7, 5, 1), -- Order 7: 1 unit of Product 5
(10, 8, 6, 1), -- Order 8: 1 unit of Product 6
(11, 9, 9, 1), -- Order 9: 1 unit of Product 9
(12, 10, 10, 1); -- Order 10: 1 unit of Product 10

-- Insert sample records into the Inventory table
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 25, '2024-01-25'), -- Product 1: 25 units in stock, last updated on January 25, 2024
(2, 2, 30, '2024-01-26'), -- Product 2: 30 units in stock, last updated on January 26, 2024
(3, 3, 15, '2024-01-27'), -- Product 3: 15 units in stock, last updated on January 27, 2024
(4, 4, 20, '2024-01-28'), -- Product 4: 20 units in stock, last updated on January 28, 2024
(5, 5, 40, '2024-01-29'), -- Product 5: 40 units in stock, last updated on January 29, 2024
(6, 6, 50, '2024-01-30'), -- Product 6: 50 units in stock, last updated on January 30, 2024
(7, 7, 10, '2024-01-31'), -- Product 7: 10 units in stock, last updated on January 31, 2024
(8, 8, 35, '2024-02-01'), -- Product 8: 35 units in stock, last updated on February 1, 2024
(9, 9, 5, '2024-02-02'), -- Product 9: 5 units in stock, last updated on February 2, 2024
(10, 10, 45, '2024-02-03'); -- Product 10: 45 units in stock, last updated on February 3, 2024


------------------------------------------------------------------------------------------------------------------- TASK - 2

/* 1. Write an SQL query to retrieve the names and emails of all customers*/

SELECT FirstName, LastName, Email 
FROM Customers;

/* 2. Write an SQL query to list all orders with their order dates and corresponding customer names.*/

SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName
FROM Orders O
JOIN Customers C
ON O.CustomerID = C.CustomerID;

/* 3. Write an SQL query to insert a new customer record into the "Customers" table. 
Include customer information such as name, email, and address.*/

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (11, 'Alex', 'Johnson', 'alex.johnson@example.com', '123-456-7890', '555 Elm Street, Orlando, FL');

/* 4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table 
by increasing them by 10%.*/

UPDATE Products
SET Price = Price * 1.10;

/* 5. Write an SQL query to delete a specific order and its associated order details from the "Orders" 
and "OrderDetails" tables. Allow users to input the order ID as a parameter.*/

ALTER TABLE OrderDetails
DROP CONSTRAINT FK_OrderDetails_OrderID;

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_OrderID
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
ON DELETE CASCADE;

DELETE FROM Orders WHERE OrderID = 8 and OrderID = 9;


/* 6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, 
order date, and any other necessary information.*/

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (11, 5, '2024-03-01', 250.00);

/* 7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer
in the "Customers" table. Allow users to input the customer ID and new contact information.*/

UPDATE Customers
SET Email = 'anna.martinez22@example.com', Address = '123 Cypress Court, Las Vegas, NV'
WHERE CustomerID = 8;


/* 8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table
based on the prices and quantities in the "OrderDetails" table.*/

UPDATE Orders
SET TotalAmount = (
    SELECT SUM(P.Price * OD.Quantity)
    FROM OrderDetails od
    JOIN Products P
	ON OD.ProductID = P.ProductID
    WHERE OD.OrderID = Orders.OrderID
);

SELECT * 
FROM Customers;

/* 9. Write an SQL query to delete all orders and their associated order details for a specific customer
from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.*/

ALTER TABLE OrderDetails
DROP CONSTRAINT FK_OrderDetails_OrderID;

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_OrderID
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
ON DELETE CASCADE;

DELETE FROM Orders
WHERE CustomerID = 8;

SELECT * 
FROM Orders;

SELECT * 
FROM OrderDetails;


/* 10. Write an SQL query to insert a new electronic gadget product into the "Products" table, 
including product name, category, price, and any other relevant details.*/

INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES (11, 'Smartwatch Series X', 'Waterproof smartwatch with health monitoring features', 299.99);

/* 11. Write an SQL query to update the status of a specific order in the "Orders" table 
(e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.*/

UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderID;

ALTER TABLE Orders
ADD Status VARCHAR(20) DEFAULT 'Pending';

UPDATE Orders SET Status = 'Pending' WHERE OrderID = 1;
UPDATE Orders SET Status = 'Shipped' WHERE OrderID = 2;
UPDATE Orders SET Status = 'Pending' WHERE OrderID = 3;
UPDATE Orders SET Status = 'Delivered' WHERE OrderID = 4;
UPDATE Orders SET Status = 'Shipped' WHERE OrderID = 5;
UPDATE Orders SET Status = 'Pending' WHERE OrderID = 6;
UPDATE Orders SET Status = 'Canceled' WHERE OrderID = 7;
UPDATE Orders SET Status = 'Pending' WHERE OrderID = 10;
UPDATE Orders SET Status = 'Pending' WHERE OrderID = 11;

UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = 1;

SELECT * 
FROM Orders;

/* 12. Write an SQL query to calculate and update the number of orders placed by each customer in the 
"Customers" table based on the data in the "Orders" table.*/

ALTER TABLE Customers
ADD NumberOfOrders INT DEFAULT 0;

UPDATE Customers
SET NumberOfOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);

SELECT * 
FROM Customers;

------------------------------------------------------------------------------------------------------------------- TASK - 3

-- 1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.

SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName, O.TotalAmount
FROM Orders O
JOIN Customers C
ON o.CustomerID = c.CustomerID;

-- 2. Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.

SELECT p.ProductName, SUM(p.Price * od.Quantity) AS TotalRevenue
FROM OrderDetails od
JOIN Products p 
ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

-- 3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.

SELECT c.FirstName, c.LastName, c.Email, c.Phone, c.Address
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone, c.Address;

/* 4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered.
Include the product name and the total quantity ordered. */

SELECT TOP 1 p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails AS od
JOIN Products AS p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;

-- 5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
); -- I dont have Categories so, i am creating a new table

ALTER TABLE Products
ADD CategoryID INT;

ALTER TABLE Products
ADD CONSTRAINT FK_Products_CategoryID
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
ON DELETE SET NULL;

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Smartphones'),
(2, 'Laptops'),
(3, 'Headphones'),
(4, 'Smart Home Devices'),
(5, 'Cameras'),
(6, 'Wearables'),
(7, 'Speakers');

UPDATE Products SET CategoryID = 1 WHERE ProductID = 1; -- iPhone 15
UPDATE Products SET CategoryID = 1 WHERE ProductID = 2; -- Samsung Galaxy S24
UPDATE Products SET CategoryID = 2 WHERE ProductID = 3; -- Dell XPS 13
UPDATE Products SET CategoryID = 2 WHERE ProductID = 4; -- Apple MacBook Air
UPDATE Products SET CategoryID = 3 WHERE ProductID = 5; -- Sony WH-1000XM5
UPDATE Products SET CategoryID = 4 WHERE ProductID = 6; -- Amazon Echo Dot
UPDATE Products SET CategoryID = 5 WHERE ProductID = 7; -- GoPro Hero 12
UPDATE Products SET CategoryID = 6 WHERE ProductID = 8; -- Fitbit Charge 6
UPDATE Products SET CategoryID = 5 WHERE ProductID = 9; -- Canon EOS R8
UPDATE Products SET CategoryID = 7 WHERE ProductID = 10; -- JBL Flip 6


SELECT P.ProductName, C.CategoryName
FROM Products P
JOIN Categories C 
ON P.CategoryID = C.CategoryID;

SELECT *
FROM Products;

SELECT *
FROM Categories;

-- 6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.

SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AvgOrderValue
FROM Orders o
JOIN Customers c 
ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- 7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.

SELECT TOP 1 o.OrderID, c.FirstName, c.LastName, o.TotalAmount AS TotalRevenue
FROM Orders o
JOIN Customers c 
ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

SELECT *
FROM Customers, Orders;

-- 8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.

SELECT p.ProductName, COUNT(od.OrderDetailID) AS TimesOrdered
FROM OrderDetails od
JOIN Products p 
ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

/* 9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product 
name as a parameter.*/

SELECT c.FirstName, c.LastName, c.Email, p.ProductName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

SELECT c.FirstName, c.LastName, c.Email
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
JOIN OrderDetails od 
ON o.OrderID = od.OrderID
JOIN Products p 
ON od.ProductID = p.ProductID
WHERE p.ProductName = 'iPhone 15';


/* 10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. 
Allow users to input the start and end dates as parameters. */

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN '2020-01-01' AND '2024-12-31';


------------------------------------------------------------------------------------------------------------------- TASK - 4

-- 1. Write an SQL query to find out which customers have not placed any orders.

SELECT FirstName, LastName
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

SELECT * FROM Customers;
SELECT * FROM Orders;

-- 2. Write an SQL query to find the total number of products available for sale.

SELECT
	 (SELECT SUM(QuantityInStock)
	 FROM Inventory) AS TotalProductsAvailable;

-- 3. Write an SQL query to calculate the total revenue generated by TechShop.

SELECT
	 (SELECT SUM(TotalAmount) 
     FROM Orders) AS TotalRevenue;


SELECT * FROM Orders;

/* 4. Write an SQL query to calculate the average quantity ordered for products in a specific category.
Allow users to input the category name as a parameter. */

SELECT AVG(od.Quantity) AS Avg_Quantity_Ordered
FROM OrderDetails AS od
WHERE od.ProductID IN ( SELECT p.ProductID
						FROM Products AS p
						JOIN Categories AS c 
						ON p.CategoryID = c.CategoryID
						WHERE P.ProductName = 'iPhone 15');

SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Products;
SELECT * FROM Categories;

SELECT Quantity
FROM OrderDetails
WHERE ProductID = 1;

-- 5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.

SELECT( SELECT SUM(TotalAmount)
		FROM Orders
		WHERE CustomerID = 2) AS TotalRevenue;

SELECT * FROM Orders;

-- 6. Write an SQL query to find the customers who have placed the most orders and List their names and the number of orders they've placed.

SELECT FirstName, LastName, NumberOfOrders
FROM (
      SELECT FirstName, LastName, NumberOfOrders
      FROM Customers
      WHERE NumberOfOrders IS NOT NULL AND NumberOfOrders > 0) AS CustomerOrders
ORDER BY NumberOfOrders DESC;

SELECT * FROM Customers;

-- 7. Write an SQL query to find the most popular product category. Which is the one with the highest total quantity ordered across all orders.

SELECT p.ProductName, SUM(od.Quantity) AS Total_Quantity_Ordered
FROM Products p
JOIN OrderDetails od 
ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY Total_Quantity_Ordered DESC;

-- 7. Write an SQL query to find the most popular product category.
-- Which is the one with the highest total quantity ordered across all orders.

SELECT ProductName, Total_Quantity_Ordered
FROM (
      SELECT p.ProductName, SUM(od.Quantity) AS Total_Quantity_Ordered
      FROM Products p
      JOIN OrderDetails od 
	  ON p.ProductID = od.ProductID
      GROUP BY p.ProductName) AS CategoryTotals
ORDER BY Total_Quantity_Ordered DESC;

SELECT * FROM OrderDetails;
SELECT * FROM Products;

/* 8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets.
List their name and total spending. */

SELECT TOP 1 c.FirstName, c.LastName, (SELECT SUM(o.TotalAmount)
								 FROM Orders o
							     WHERE o.CustomerID = c.CustomerID) AS Total_Spending
FROM Customers c
ORDER BY Total_Spending DESC;

-- 9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.

SELECT C.CustomerID, C.FirstName, C.LastName, (SUM(O.TotalAmount) / COUNT(O.OrderID)) AS AvgOrderValue
FROM Orders O
JOIN Customers C 
ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;           -- USING JOINS


SELECT CustomerID, FirstName, LastName, Avg_Order_Value
FROM (
      SELECT C.CustomerID, C.FirstName, C.LastName, (SUM(O.TotalAmount) / COUNT(O.OrderID)) AS Avg_Order_Value
      FROM Orders O
      JOIN Customers C 
	  ON O.CustomerID = C.CustomerID
      GROUP BY C.CustomerID, C.FirstName, C.LastName
) AS Customer_Avg_Order_Value;                            -- USING SUB QUERY


SELECT * FROM Orders;
SELECT * FROM Customers;

-- 10. Write an SQL query to find the total number of orders placed by each customer and List their names along with the order count.

SELECT FirstName, LastName, (SELECT COUNT(*)
								 FROM Orders o
								 WHERE o.CustomerID = C.CustomerID) AS Order_Count
FROM Customers C;


-------------------------------------------------------------------------------------------------------------------


