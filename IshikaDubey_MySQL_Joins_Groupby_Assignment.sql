-- ============================================
-- MySQL Assignment — Joins, Grouping & Aggregations
-- Student Name: Ishika Dubey
-- Total Questions: 20
-- ============================================

-- ============================================
-- DATABASE SETUP
-- ============================================

-- Create database
CREATE DATABASE IF NOT EXISTS store_assignment;
USE store_assignment;

-- Create customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create order_items table
CREATE TABLE IF NOT EXISTS order_items (
    item_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Insert sample data into customers
INSERT INTO customers (customer_id, name, city) VALUES
('C001', 'Amit', 'Mumbai'),
('C002', 'Riya', 'Delhi'),
('C003', 'Kabir', 'Chennai'),
('C004', 'Ananya', 'Kolkata'),
('C005', 'John', 'Mumbai');

-- Insert sample data into orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
('O001', 'C001', '2023-06-01', 1500),
('O002', 'C003', '2023-06-02', 900),
('O003', 'C002', '2023-06-05', 1800),
('O004', 'C001', '2023-06-08', 700),
('O005', 'C004', '2023-06-08', 2200);

-- Insert sample data into order_items
INSERT INTO order_items (item_id, order_id, product_name, quantity, price) VALUES
('I001', 'O001', 'Soap', 3, 50),
('I002', 'O001', 'Shampoo', 2, 200),
('I003', 'O002', 'Toothpaste', 1, 120),
('I004', 'O003', 'Soap', 4, 50),
('I005', 'O003', 'Facewash', 1, 180),
('I006', 'O004', 'Shampoo', 1, 200),
('I007', 'O005', 'Cream', 2, 300);


-- ============================================
-- SECTION A — JOINS (10 Questions)
-- ============================================

-- Q1: Retrieve customer names along with their corresponding order IDs
SELECT c.name, o.order_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- Q2: List all customers and their orders, including customers who have not placed any order
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Q3: Display all order IDs and customer names, including orders that have no matching customer record
SELECT o.order_id, c.name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;

-- Q4: Show customer name, order ID and order amount for all orders placed in June 2023
SELECT c.name, o.order_id, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Q5: Retrieve all product names purchased by each customer
SELECT DISTINCT c.name, oi.product_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
ORDER BY c.name, oi.product_name;

-- Q6: Find the names of customers who purchased the product "Soap"
SELECT DISTINCT c.name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.product_name = 'Soap';

-- Q7: Display customer name, city, product name and quantity purchased
SELECT c.name, c.city, oi.product_name, oi.quantity
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
ORDER BY c.name;

-- Q8: Identify orders that contain more than one item
SELECT o.order_id, COUNT(oi.item_id) AS item_count
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING COUNT(oi.item_id) > 1;

-- Q9: Retrieve customers who have never placed any order
SELECT c.customer_id, c.name, c.city
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q10: For each order, show the total number of items included in that order
SELECT o.order_id, COUNT(oi.item_id) AS total_items
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;


-- ============================================
-- SECTION B — GROUPING & AGGREGATION (10 Questions)
-- ============================================

-- Q11: Find the number of orders placed by each customer
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;

-- Q12: Calculate the total revenue generated from each city
SELECT c.city, SUM(o.total_amount) AS total_revenue
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- Q13: Find the average order value for each customer
SELECT c.name, AVG(o.total_amount) AS average_order_value
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY average_order_value DESC;

-- Q14: Count total units sold for each product
SELECT oi.product_name, SUM(oi.quantity) AS total_units_sold
FROM order_items oi
GROUP BY oi.product_name
ORDER BY total_units_sold DESC;

-- Q15: Identify the highest total order amount recorded
SELECT MAX(total_amount) AS highest_order_amount
FROM orders;

-- Q16: Calculate the total revenue generated on each date
SELECT order_date, SUM(total_amount) AS daily_revenue
FROM orders
GROUP BY order_date
ORDER BY order_date;

-- Q17: Create a summary showing: customer_name | total_orders | total_items | total_spent
SELECT 
    c.name AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COALESCE(SUM(oi.quantity), 0) AS total_items,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

-- Q18: Identify the top 2 customers based on total spending
SELECT c.name, SUM(o.total_amount) AS total_spending
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spending DESC
LIMIT 2;

-- Q19: Determine which product generated the highest total revenue
SELECT 
    oi.product_name, 
    SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
GROUP BY oi.product_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Q20: Find the average quantity ordered per order
SELECT AVG(total_quantity) AS average_quantity_per_order
FROM (
    SELECT o.order_id, SUM(oi.quantity) AS total_quantity
    FROM orders o
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_id
) AS order_quantities;


-- ============================================
-- End of Assignment
-- ============================================
