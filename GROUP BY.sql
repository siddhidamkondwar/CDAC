use cdac;
-- =========================
-- DROP TABLES (optional reset)
-- =========================
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS salesman;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

-- =========================
-- CREATE TABLES
-- =========================

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5,2)
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    company_id INT
);

CREATE TABLE dept (
    dept_code INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50),
    allotment_amt DECIMAL(10,2)
);

CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_code INT,
    salary DECIMAL(10,2),
    job_title VARCHAR(50),
    location VARCHAR(50)
);

-- =========================
-- INSERT DATA
-- =========================

-- Customers
INSERT INTO customer VALUES
(3001, 'John', 'New York', 100, 5001),
(3002, 'Alice', 'London', 200, 5002),
(3003, 'Bob', 'Paris', NULL, 5003),
(3004, 'David', 'Rome', 300, 5002),
(3005, 'Eva', 'Berlin', 200, 5001);

-- Salesman
INSERT INTO salesman VALUES
(5001, 'James', 'New York', 0.15),
(5002, 'Nina', 'London', 0.12),
(5003, 'Paul', 'Paris', 0.10),
(5004, 'Mark', 'Rome', 0.13);

-- Orders
INSERT INTO orders VALUES
(7001, 1500, '2012-08-17', 3001, 5001),
(7002, 2500, '2012-08-17', 3002, 5002),
(7003, 3500, '2012-08-18', 3003, 5003),
(7004, 4500, '2012-08-18', 3004, 5002),
(7005, 5500, '2012-08-19', 3005, 5001),
(7006, 6500, '2012-08-19', 3002, 5002);

-- Product
INSERT INTO product VALUES
(1, 'Laptop', 800, 101),
(2, 'Phone', 500, 102),
(3, 'Tablet', 300, 101),
(4, 'Monitor', 400, 103),
(5, 'Keyboard', 100, 102);

-- Department
INSERT INTO dept VALUES
(10, 'IT', 'New York', 50000),
(20, 'HR', 'London', 30000),
(30, 'Finance', 'Paris', 40000);

-- Employee
INSERT INTO emp VALUES
(1, 'Amit', 10, 50000, 'Manager', 'New York'),
(2, 'Sara', 10, 40000, 'Developer', 'New York'),
(3, 'John', 20, 30000, 'HR', 'London'),
(4, 'Mike', 30, 60000, 'Analyst', 'Paris'),
(5, 'Anna', 30, 70000, 'Manager', 'Paris');

-- =========================
-- TEST QUERIES (OPTIONAL)
-- =========================

-- Total purchase
SELECT SUM(purch_amt) AS total_purchase FROM orders;

-- Average purchase
SELECT AVG(purch_amt) AS avg_purchase FROM orders;

-- Max purchase per customer
SELECT customer_id, MAX(purch_amt)
FROM orders
GROUP BY customer_id;

-- Employees per department
SELECT dept_code, COUNT(*)
FROM emp
GROUP BY dept_code;

#.write a SQL query to calculate the total purchase amount of all orders. Return total purchase amount.
SELECT SUM(purch_amt) AS total_purchase
FROM orders;

#2.write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount. 
SELECT avg(purch_amt) as total_purchase
from orders;
 #3.write a SQL query that counts the number of unique salespeople. Return number of salespeople.  

#4.write a SQL query to count the number of customers. Return number of customers.  
#5.write a SQL query to determine the number of customers who received at least one grade for their activity.  

#6.write a SQL query to find the maximum purchase amount.

#7.write a SQL query to find the minimum purchase amount

#8.write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.  

#9.write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. 

#10.write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount.

#11.write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. Return salesperson ID, purchase amount 

#12.write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.
#13.write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date. Return customer id, order date and maximum purchase amount.

#14.write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount.

#write a SQL query to determine the maximum order amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount.

#write a SQL query to find the maximum order (purchase) amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount.

#write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). Return salesperson id and maximum purchase amount.

#write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.

#write a SQL query to count the number of salespeople in a city. Return number of salespeople.

#write a SQL query to count the number of orders based on the combination of each order date and salesperson. Return order date, salesperson id.

#write a SQL query to calculate the average product price. Return average product price.

#write a SQL query to count the number of products whose price are higher than or equal to 350. Return number of products.

#write a SQL query to compute the average price for unique companies. Return average price and company id.

#write a SQL query to compute the sum of the allotment amount of all departments. Return sum of the allotment amount.

#write a SQL query to count the number of employees in each department. Return department code and number of employees.

Find the average salary for each job title in the company.

List the number of employees in each department.

Determine the total salary expenditure by each department.

Compute the maximum salary in each location.

Calculate the total number of employees in each location

Display the job titles of employees who work in the same department.

Determine the number of employees in each job title

Compute the average salary for employees in each department.

Find the department names and locations with more than five employees.

Calculate the total salary for each department and location.
