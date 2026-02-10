-- ============================================
-- MySQL Assignment - Database Basics, SELECT, WHERE, Filtering & Sorting
-- Student Name: Ishika Dubey
-- Database: store_db
-- Table: products
-- ============================================

-- ============================================
-- SECTION A: Basic SQL Queries (SELECT)
-- ============================================

-- Q1: Show all data from the products table
SELECT * FROM products;

-- Q2: Display only product_name and price of all products
SELECT product_name, price FROM products;

-- Q3: Retrieve products where the category is 'Electronics'
SELECT * FROM products WHERE category = 'Electronics';

-- Q4: Show products priced below 1000
SELECT * FROM products WHERE price < 1000;

-- Q5: Retrieve products whose stock is greater than or equal to 50
SELECT * FROM products WHERE stock >= 50;


-- ============================================
-- SECTION B: WHERE Clause & Logical Conditions
-- ============================================

-- Q6: Get all products that belong to Fashion OR Grocery
SELECT * FROM products WHERE category = 'Fashion' OR category = 'Grocery';

-- Q7: Show all products with price between 500 and 5000
SELECT * FROM products WHERE price BETWEEN 500 AND 5000;

-- Q8: Retrieve all products NOT in the Electronics category
SELECT * FROM products WHERE NOT category = 'Electronics';

-- Q9: Find products where category = Electronics AND price > 3000
SELECT * FROM products WHERE category = 'Electronics' AND price > 3000;

-- Q10: Show groceries priced less than 300 OR stock greater than 100
SELECT * FROM products WHERE category = 'Grocery' AND (price < 300 OR stock > 100);


-- ============================================
-- SECTION C: Filtering with LIKE
-- ============================================

-- Q11: Get products whose name starts with 'S'
SELECT * FROM products WHERE product_name LIKE 'S%';

-- Q12: Get products whose name contains 'oo'
SELECT * FROM products WHERE product_name LIKE '%oo%';

-- Q13: Get products whose name ends with 't'
SELECT * FROM products WHERE product_name LIKE '%t';


-- ============================================
-- SECTION D: Sorting (ORDER BY)
-- ============================================

-- Q14: Show all products sorted by price in ascending order
SELECT * FROM products ORDER BY price ASC;

-- Q15: Show all products sorted by stock in descending order
SELECT * FROM products ORDER BY stock DESC;

-- Q16: Show products in Electronics category, ordered by price descending
SELECT * FROM products WHERE category = 'Electronics' ORDER BY price DESC;


-- ============================================
-- SECTION E: Combined Filtering + Sorting
-- ============================================

-- Q17: Show Fashion products priced above 1000, sorted by stock ascending
SELECT * FROM products WHERE category = 'Fashion' AND price > 1000 ORDER BY stock ASC;

-- Q18: Find all products with stock between 20–100 and sort by price descending
SELECT * FROM products WHERE stock BETWEEN 20 AND 100 ORDER BY price DESC;

-- Q19: Display products whose name contains 'a', sorted alphabetically (A–Z)
SELECT * FROM products WHERE product_name LIKE '%a%' ORDER BY product_name ASC;

-- Q20: Show the top 5 most expensive products
SELECT * FROM products ORDER BY price DESC LIMIT 5;


-- ============================================
-- SECTION F: Challenge Questions (Advanced Filtering)
-- ============================================

-- Q21: Get the second most expensive product using sorting + LIMIT
SELECT * FROM products ORDER BY price DESC LIMIT 1 OFFSET 1;

-- Q22: Show all products EXCEPT the 3 cheapest ones
SELECT * FROM products ORDER BY price ASC LIMIT 100 OFFSET 3;

-- Q23: Show all products where category = Electronics, stock < 50, price > 3000 (Sort results alphabetically)
SELECT * FROM products 
WHERE category = 'Electronics' 
  AND stock < 50 
  AND price > 3000 
ORDER BY product_name ASC;

-- Q24: Display products where name length is more than 5 characters
SELECT * FROM products WHERE LENGTH(product_name) > 5;

-- Q25: Show all products where price is divisible by 5
SELECT * FROM products WHERE price % 5 = 0;


-- ============================================
-- End of Assignment
-- ============================================
