# 📊 SQL Basics - Complete MySQL Assignments


> A comprehensive collection of SQL queries demonstrating fundamental and advanced database operations including SELECT statements, WHERE clauses, filtering, sorting, JOINs, grouping, and aggregation functions.

** Two Complete Assignments:**
- **Assignment 1:** Database Basics, SELECT, WHERE, Filtering & Sorting (25 queries)
- **Assignment 2:** Joins, Grouping & Aggregations (20 queries)

---

##  Table of Contents

- [Overview](#overview)
- [Database Schema](#database-schema)
- [Topics Covered](#topics-covered)
- [Assignment Sections](#assignment-sections)
- [How to Use](#how-to-use)
- [Sample Queries](#sample-queries)
- [Key Learnings](#key-learnings)
- [Author](#author)

---

## 🎯 Overview

This repository contains **two complete MySQL assignments** covering **45 SQL queries** that demonstrate proficiency in:

### **Assignment 1: Database Basics (25 Queries)**
- Basic SELECT operations
- WHERE clause and logical conditions
- Pattern matching with LIKE
- Sorting with ORDER BY
- Advanced filtering techniques
- Query optimization with LIMIT and OFFSET

### **Assignment 2: Joins & Aggregations (20 Queries)**
- INNER JOIN, LEFT JOIN operations
- Multiple table relationships
- GROUP BY and aggregate functions (COUNT, SUM, AVG, MAX)
- HAVING clause for filtered aggregations
- Complex multi-table queries
- Subqueries and derived tables

**Total Queries:** 45  
**Databases:** `store_db`, `store_assignment`

---

## 🗄️ Database Schema

### Table: `products`

| Column Name    | Data Type | Description                    |
|----------------|-----------|--------------------------------|
| `product_id`   | INT       | Primary key, unique identifier |
| `product_name` | VARCHAR   | Name of the product            |
| `category`     | VARCHAR   | Product category               |
| `price`        | DECIMAL   | Product price in INR           |
| `stock`        | INT       | Available stock quantity       |

### Sample Data

| product_id | product_name | category    | price | stock |
|------------|--------------|-------------|-------|-------|
| 1          | Laptop       | Electronics | 55000 | 12    |
| 2          | Mouse        | Electronics | 700   | 150   |
| 3          | Keyboard     | Electronics | 1200  | 90    |
| 4          | T-Shirt      | Fashion     | 500   | 40    |
| 5          | Jeans        | Fashion     | 1500  | 25    |
| 6          | Coffee       | Grocery     | 200   | 80    |
| 7          | Tea          | Grocery     | 150   | 120   |
| 8          | Smartwatch   | Electronics | 4000  | 20    |
| 9          | Shoes        | Fashion     | 2000  | 15    |
| 10         | Rice Bag     | Grocery     | 900   | 60    |

---

## 📚 Topics Covered

### ✅ Assignment 1: Core SQL Concepts

- **SELECT Statements** - Retrieving data from tables
- **WHERE Clause** - Filtering records based on conditions
- **Logical Operators** - AND, OR, NOT
- **Comparison Operators** - =, <, >, <=, >=, BETWEEN
- **Pattern Matching** - LIKE operator with wildcards (%, _)
- **Sorting** - ORDER BY (ASC, DESC)
- **Limiting Results** - LIMIT and OFFSET
- **String Functions** - LENGTH()
- **Arithmetic Operations** - Modulo (%)

### ✅ Assignment 2: Advanced SQL Concepts

- **INNER JOIN** - Combining rows from multiple tables
- **LEFT JOIN** - Including unmatched rows from left table
- **Multi-table Joins** - Joining 3+ tables
- **Aggregate Functions** - COUNT(), SUM(), AVG(), MAX(), MIN()
- **GROUP BY** - Grouping rows for aggregation
- **HAVING** - Filtering grouped results
- **Subqueries** - Nested SELECT statements
- **DISTINCT** - Removing duplicate rows
- **COALESCE** - Handling NULL values

---

## 📂 Assignment Sections

### **Section A: Basic SQL Queries (SELECT)**
- Retrieving all data
- Selecting specific columns
- Basic filtering with WHERE

### **Section B: WHERE Clause & Logical Conditions**
- Using OR and AND operators
- BETWEEN operator
- NOT operator
- Complex conditions

### **Section C: Filtering with LIKE**
- Pattern matching
- Wildcards (%, _)
- String searching

### **Section D: Sorting (ORDER BY)**
- Ascending and descending order
- Sorting with conditions

### **Section E: Combined Filtering + Sorting**
- Multiple WHERE conditions with ORDER BY
- LIMIT for top results

### **Section F: Challenge Questions**
- Advanced filtering
- OFFSET for pagination
- String functions
- Mathematical operations

---

## 🚀 How to Use

### Prerequisites
- MySQL Server installed
- MySQL Workbench or any SQL client

### Setup Instructions

1. **Clone this repository**
   ```bash
   git clone https://github.com/ishikadubey1105/SQL-BASICS.git
   cd SQL-BASICS
   ```

2. **Create the database**
   ```sql
   CREATE DATABASE store_db;
   USE store_db;
   ```

3. **Create and populate the table**
   ```sql
   CREATE TABLE products (
       product_id INT PRIMARY KEY,
       product_name VARCHAR(100),
       category VARCHAR(50),
       price DECIMAL(10, 2),
       stock INT
   );

   INSERT INTO products VALUES
   (1, 'Laptop', 'Electronics', 55000, 12),
   (2, 'Mouse', 'Electronics', 700, 150),
   (3, 'Keyboard', 'Electronics', 1200, 90),
   (4, 'T-Shirt', 'Fashion', 500, 40),
   (5, 'Jeans', 'Fashion', 1500, 25),
   (6, 'Coffee', 'Grocery', 200, 80),
   (7, 'Tea', 'Grocery', 150, 120),
   (8, 'Smartwatch', 'Electronics', 4000, 20),
   (9, 'Shoes', 'Fashion', 2000, 15),
   (10, 'Rice Bag', 'Grocery', 900, 60);
   ```

4. **Run the queries**
   ```bash
   mysql -u your_username -p store_db < "Ishika Dubey sql assignment.sql"
   ```

---

## 💡 Sample Queries

### Example 1: Get Electronics Products
```sql
-- Retrieve all electronics products
SELECT * FROM products WHERE category = 'Electronics';
```

### Example 2: Find Products by Price Range
```sql
-- Products priced between 500 and 5000
SELECT * FROM products WHERE price BETWEEN 500 AND 5000;
```

### Example 3: Pattern Matching
```sql
-- Products whose name contains 'oo'
SELECT * FROM products WHERE product_name LIKE '%oo%';
```

### Example 4: Top 5 Most Expensive Products
```sql
-- Get the 5 most expensive items
SELECT * FROM products ORDER BY price DESC LIMIT 5;
```

### Example 5: Advanced Filtering
```sql
-- Electronics with stock < 50 and price > 3000
SELECT * FROM products 
WHERE category = 'Electronics' 
  AND stock < 50 
  AND price > 3000 
ORDER BY product_name ASC;
```

---

## 🎓 Key Learnings

Through these assignments, I have demonstrated proficiency in:

✅ Writing clean, well-commented SQL queries  
✅ Understanding database filtering and sorting mechanisms  
✅ Using logical operators for complex conditions  
✅ Implementing pattern matching for text searches  
✅ Optimizing queries with LIMIT and OFFSET  
✅ Applying string and mathematical functions  
✅ Performing INNER and LEFT JOINs across multiple tables  
✅ Using aggregate functions (COUNT, SUM, AVG, MAX, MIN)  
✅ Grouping data with GROUP BY and filtering with HAVING  
✅ Writing subqueries and derived tables  
✅ Handling NULL values with COALESCE  
✅ Following SQL best practices and naming conventions  

---

## 📁 Repository Structure

```
SQL-BASICS/
│
├── README.md                                    # This file
├── IshikaDubey_MySQL_Assignment.sql             # Assignment 1: Basics (25 queries)
├── IshikaDubey_MySQL_Joins_Groupby_Assignment.sql  # Assignment 2: Joins & Aggregations (20 queries)
└── LICENSE                                      # MIT License
```

---

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Tools:** MySQL Workbench, VS Code

---

## 📈 Future Enhancements

- [x] ~~Add JOIN operations with multiple tables~~ ✅ Completed in Assignment 2
- [x] ~~Implement aggregate functions (COUNT, SUM, AVG)~~ ✅ Completed in Assignment 2
- [ ] Create stored procedures and functions
- [ ] Add database normalization examples
- [ ] Include transaction management queries
- [ ] Implement views and indexes
- [ ] Add window functions (ROW_NUMBER, RANK, PARTITION BY)

---

## 👤 Author

**Ishika Dubey**

- GitHub: [@ishikadubey1105](https://github.com/ishikadubey1105)
- Repository: [SQL-BASICS](https://github.com/ishikadubey1105/SQL-BASICS)

---

## 🌟 Acknowledgments

- Assignment designed to cover fundamental SQL concepts
- Sample database structure for educational purposes
- Queries optimized for MySQL 8.0+

---

<div align="center">

### ⭐ If you found this helpful, please give it a star!

**Made with ❤️ by Ishika Dubey**

</div>
