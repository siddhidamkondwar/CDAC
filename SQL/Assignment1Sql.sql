CREATE DATABASE data_type;
USE data_type;

#SECTION A: BEGINNER LEVEL

#1) Create a table students_basic with the following columns:
#id (integer)
#name (varchar 50)
#age (integer)


CREATE TABLE student_basic(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 age INT
);


#2) Insert 5 records into students_basic.

INSERT INTO student_basic
(id, name, age)
VALUES
(1,'Siddhi',22),
(2,'Shreyas',19),
(3,'Sneha',29),
(4,'Sangeeta',49),
(5,'Laxmikant',67);

#3) Select all records from the table.

SELECT * FROM student_basic;

#4) Create a table products_basic with:
#product_id (int)
#product_name (varchar 100)
#price (decimal 8,2)

CREATE TABLE products_basics(
 product_id INT,
 product_name VARCHAR(100),
 price DECIMAL(8,2)
);


#5) Insert 3 products and display them.

INSERT INTO products_basics
(product_id, product_name, price)
VALUES
(1,'Notebook',40),
(2,'pencil',40.4),
(1,'pens',10.7);

SELECT * FROM products_basics;

#6) Create a table employees_basic with:
#emp_id (int)
#emp_name (varchar 50)
#joining_date (date)


CREATE TABLE employees_basics(
 emp_id INT,
 emp_name VARCHAR(50),
 joining_date DATE 
);

#7) Insert at least 4 employees and display only names and joining dates.

INSERT INTO employees_basics
(emp_name, joining_date)
VALUES
("Siddhi", "2025-05-15"),
("Sneha", "2025-10-10"),
("Shreyas", "2025-10-16"),
("Ved", "2025-12-08");

SELECT * FROM employees_basics;

#8) Create a table using CHAR and VARCHAR and insert values to observe differences.

CREATE TABLE char_varchar(
 id INT,
 name VARCHAR(50),
 product_name CHAR(50)
);

INSERT INTO char_varchar
(id, name, product_name)
VALUES
(1, "Siddhi", "Samsung"),
(2, "Sneha", "Apple"),
(3, "Shreyas", "MI"),
(4, "Ved", "Xioami"),
(5, "   Swarada  ", "     Apple     ");

SELECT LENGTH(name), LENGTH(product_name) FROM char_varchar;

#9) Create table flags with a BOOLEAN column. Insert TRUE/FALSE values and display results.





#10) Create a table numbers_test using TINYINT, SMALLINT, and BIGINT. Insert sample values.

CREATE TABLE numbers_test(
 s_id TINYINT,
 t_id SMALLINT,
 id BIGINT
);

INSERT INTO numbers_test
(s_id, t_id, id)
VALUES
(100, 10000, 10000000);

SELECT * FROM numbers_test;

###############################################################################

#SECTION B: INTERMEDIATE LEVEL

# 11) Create a table students with:
#id (int primary key)
#name (varchar 100 not null)
#marks (float)
#grade (char 2)

CREATE TABLE students(
 id INT PRIMARY KEY,
 name VARCHAR(100),
 marks FLOAT,
 grade CHAR(2)
);

INSERT INTO students
(id, name, marks, grade)
VALUES
(1, "Siddhi", 98, "A"),
(2, "Shreyas", 77, "C"),
(3, "Sneha", 79, "C"),
(4, "Ved", 99, "A"),
(5, "Artha", 77, "C"),
(6, "Anaya", 88, "B");

SELECT * FROM students WHERE marks > 75;

# 14) Create a table orders with:
#order_id (int)
#order_date (datetime)
#amount (decimal 10,2)

CREATE TABLE orders(
 order_id INT,
 order_date DATETIME,
 amount DECIMAL(10,2)
);

# 15) Insert records with different timestamps and query only date part.

INSERT INTO orders
(order_id, order_date, amount)
VALUES
(101, "2026-04-05 13:49:23", 10),
(102, "2026-04-04 14:56:12", 18);

SELECT order_date FROM orders;

# 16) Create a table users with ENUM for roles ("admin", "user", "guest"). Insert records.

CREATE TABLE users(
 id INT,
 email VARCHAR(50),
 role_declare ENUM("admin", "user", "guest")
);

INSERT INTO users
(id, email, role_declare)
VALUES
(1, "ved@gmail.com", "admin" ),
(2, "Siddhi07@gmail.com", "user"),
(3, "shreyas123@gmail.com", "guest");

SELECT * FROM users;

# 17) Try inserting a value outside ENUM and observe behavior.

 INSERT INTO users
 (id, email, role_declare)
 VALUES
 (1, "ved@gmail.com", "admin" ),
 (2, "siddhi07@gmail.com", "user"),
 (3, "shreyas123@gmail.com", "manager");
 
 #Error Code: 1265. Data truncated for column 'role_declare' at row 3	0.032 sec
 
 # 18) Create a table binary_test using BLOB and TEXT. Insert sample data.
 
 CREATE TABLE binary_test(
  id INT,
  name VARCHAR(50),
  about TEXT,
  image BLOB
 );
 
 INSERT INTO binary_test
 (id, name, about, image)
 values(101,'siddhi',load_file('"C:\Users\Siddhi\Downloads\WhatsApp Image 2026-03-29 at 11.47.59 PM.jpeg"'));
 
 SELECT * FROM binary_test;
 
# 19) Create a table salary_test using DECIMAL and FLOAT. Insert same values and compare.

CREATE TABLE salary_test(
 id INT,
 salary1 FLOAT,
 salary2 DECIMAL
);

INSERT INTO salary_test
(id, salary1, salary2)
VALUES
(1, 12907.60, 12565.50),
(2, 10000.90, 10000.90);

SELECT * FROM salary_test;

# DECIMAL ROUND FIGURES THE VALUE LIKE 12.70 --> 13

# 20) Write a query to select records where amount is between 1000 and 5000.

CREATE TABLE amount(
 id INT,
 salary INT
);

INSERT INTO amount
(id, salary)
VALUES
(1, 1000),
(2, 2300),
(3, 3400),
(4, 5000),
(5, 1200),
(6, 3000);

SELECT * FROM amount WHERE salary BETWEEN 1000 AND 4000;

#####################################################################

#SECTION C: ADVANCED LEVEL

# 1) Create a table complex_types with:
#id (int)
#json_data (JSON)

CREATE TABLE complex_types(
 id INT,
 json_data JSON
);

# 22) Insert structured JSON data and query specific keys.

INSERT INTO complex_types
(id, json_data)
VALUES
(1, '{"Name":"Siddhi", "age":22, "Skills":["Python", "Java", "SQL"]}');

# 23) Create a table date_test with DATE, TIME, DATETIME, TIMESTAMP. Insert values and compare outputs.

CREATE TABLE date_test(
 id INT,
 d_join DATE,
 t_join TIME,
 dt_join DATETIME,
 ts_join TIMESTAMP
);

INSERT INTO date_test
(id, d_join, t_join, dt_join, ts_join)
VALUES
(1, "2026-04-04", "17:45:12", "2026-04-05 12:34:13", "2026-03-12 14:12:45");

SELECT * FROM date_test;

# 24) Create a table auto_test with AUTO_INCREMENT primary key. Insert records without specifying id.

CREATE TABLE auto_test(
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(50)
);

INSERT INTO auto_test
(name)
VALUES
("Siddhi"),
("Sneha"),
("Shreyas"),
("Ved");

SELECT * FROM auto_test;

# 25) Create a table precision_test and test overflow in DECIMAL.

CREATE TABLE precision_test(
 id INT,
 value1 DECIMAL(2,1)
);

INSERT INTO precision_test
(id, value1)
VALUES
(1, 123.12);

# Error Code: 1264. Out of range value for column 'value1' at row 1	0.000 sec

# 26) Create a table string_test and test max length for VARCHAR.

CREATE TABLE string_test(
 name VARCHAR(65536)
);


#Error Code: 1074. Column length too big for column 'name' (max = 16383); use BLOB or TEXT instead	0.000 sec

# 27) Create a table null_test with NOT NULL constraint. Try inserting NULL values.

CREATE TABLE table_null(
 id INT NOT NULL,
 name VARCHAR(90)
);

INSERT INTO table_null VALUE (NULL, "Mohasin");

# Error Code: 1048. Column 'id' cannot be null	0.000 sec

# 28) Create a table default_test with DEFAULT values and test insert behavior.

CREATE TABLE default_test(
 id INT,
 salary INT DEFAULT 25000
);

INSERT INTO default_test
(id)
VALUES
(1);

SELECT * FROM default_test;

# 29) Create a table mixed_types combining INT, FLOAT, VARCHAR, DATE, and BOOLEAN. Insert and query based on multiple conditions.

CREATE TABLE table_mixed(
 id INT,
 name VARCHAR(50),
 salary FLOAT,
 d_join DATE,
 joining BOOLEAN
);

INSERT INTO table_mixed
(id, name, salary, d_join, joining)
VALUES
(1, "Siddhi", 23569.9, "2026-09-02", false);

SELECT * FROM table_mixed;

# 30) Create a table where incorrect datatype insertion is attempted (e.g., string in INT). Observe and document behavior.

CREATE TABLE checkmix(
 id INT
);

INSERT INTO checkmix VALUE ("hello");

# Error Code: 1366. Incorrect integer value: 'hello' for column 'id' at row 1	0.000 sec