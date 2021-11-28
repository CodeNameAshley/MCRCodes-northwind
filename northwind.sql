USE northwind;

SELECT * FROM employees;

-- creating a simple table called countries
CREATE TABLE countries (
country_id INT,
country_name VARCHAR(100),
region_id INT
);

-- inserting a record into country table
INSERT INTO countries (country_id, country_name, region_id) VALUES
(001, 'Australia', 1);

-- confirming record exists
SELECT * FROM countries; 

-- dropping table of countries
DROP TABLE countries;

-- creating a table where none of the fields are null
CREATE TABLE countries (
country_id INT NOT NULL,
country_name VARCHAR(100) NOT NULL,
region_id INT NOT NULL
);

-- inserting a record into country table where 1 column is null
-- error code: 1136
INSERT INTO countries (country_id, country_name, region_id) VALUES
(001, 1 );

-- removing countries table again
DROP TABLE countries;

-- creating table where countries Italy, India, and China are valid entries
CREATE TABLE countries (
country_id INT NOT NULL,
country_name VARCHAR(100) NOT NULL,
region_id INT NOT NULL,
CHECK (country_name = 'Italy' OR 'India' OR 'China')
);

-- checking if country_name constraint works
-- Error Code: 3819 (Check constraint countries check 1 is violated)
INSERT INTO countries (country_id, country_name, region_id) VALUES
(001, 'Australia', 1 );

-- Inserting value to countries where constraint is satisfied
-- 1 row(s) affected
INSERT INTO countries (country_id, country_name, region_id) VALUES
(001, 'Italy', 1 );

-- checking if insertion works
-- 1 row(s) returned
SELECT * FROM countries;

-- DELETING and RECREATING table
DROP TABLE countries;

-- No duplicate data against column country_id will be allowed at time of insertion
-- unique ensures that id is unique each time value is inserted
CREATE TABLE countries (
country_id INT NOT NULL UNIQUE,
country_name VARCHAR(100) NOT NULL,
region_id INT NOT NULL
);

-- inserting unique ID
INSERT INTO countries (country_id, country_name, region_id) VALUES
(001, 'Italy', 1 ),
(002, 'India', 2),
(003, 'China', 3);

-- checking if insertion works
-- 3 row(s) returned
SELECT * FROM countries;

-- inserting duplicate country_id value for error
-- error code: 1062 (duplicate entry 1 for key country_id)
INSERT INTO countries (country_id, country_name, region_id) VALUES
(001, 'Japan', 4);

-- DELETING and RECREATING table
DROP TABLE countries;

-- Adding key in country_id
CREATE TABLE countries (
country_id INT NOT NULL UNIQUE KEY,
country_name VARCHAR(100) NOT NULL,
region_id INT NOT NULL,
PRIMARY KEY (country_id)
);

-- DELETING and RECREATING table
DROP TABLE countries;

-- Making country_id a PRIMARY KEY field, preventing duplicate data
-- AUTO INCREMENT ensures unique data is automatically inserted 
-- KEY dropped for PK
-- lessens human error
CREATE TABLE countries (
country_id INT NOT NULL AUTO_INCREMENT,
country_name VARCHAR(100) NOT NULL,
region_id INT NOT NULL,
PRIMARY KEY (country_id)
);

-- not including country_id column as this is automatically inserted by MySQL
INSERT INTO countries (country_name, region_id) VALUES
('Italy', 1 ),
('India', 2),
('China', 3),
('Japan', 4),
('Philippines', 5),
('Spain', 6);

-- checking auto increment works, table should show all 3 columns
-- 6 row(s) returned
SELECT * FROM countries;

-- END OF COUNTRIES TABLE ---

-- START OF JOBS TABLE --

-- creating table jobs, salary cannot exceed 25000
CREATE TABLE jobs (
job_id INT NOT NULL AUTO_INCREMENT KEY, 
job_title VARCHAR(250) NOT NULL, 
min_salary INT NOT NULL, 
max_salary INT NOT NULL,
CHECK (max_salary <= 25000 )
);

-- checking if jobs table exist
-- 0 row(s) returned
SELECT * FROM jobs;

-- inserting values into jobs where salary is below or equal 25000, job_id auto increments
-- 2 row(s) affected duplicates:0 warnings: 0
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES
('Admin', 20000, 25000),
('Trainee', 19000, 23000);

-- checking auto increment works, and constraint of <= 25000 works
-- 2 row(s) returned 
SELECT * FROM jobs;

-- inserting value into jobs where salary value violates constraint
-- Error code: 3819. check constraint jobs check 1 is violated.
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES
('Software Engineer', 35000, 50000);

-- END OF JOBS TABLE --

-- START OF JOB HISTORY TABLE --

-- end date is not null as people may still be working for the company
CREATE TABLE job_history (
employee_id INT NOT NULL AUTO_INCREMENT KEY,
start_date DATE NOT NULL, 
end_date DATE, 
job_id INT NOT NULL, 
department_id INT NOT NULL
);

-- checking if job_history table exists
SELECT * FROM job_history;

-- END OF JOB HISTORY TABLE --


-- INSERT EXERCISES --

-- recreating following table in database
CREATE TABLE countries2 (
COUNTRY_ID varchar(2),
COUNTRY_NAME varchar(40),
REGION_ID decimal(10,0)
);

-- insert a record with own balue into the table against each column
INSERT INTO countries2 (country_id, country_name, region_id) VALUES
(13, 'Spain', 13.0 );

-- statement to insert 3 rows by a single insert statement
INSERT INTO countries2 (country_id, country_name, region_id) VALUES
(10, 'Italy', 10.0 ),
(11, 'India', 11.0),
(12, 'China', 12.0);

SELECT * FROM countries2;

-- END OF INSERT EXERCISES --


-- START OF SELECT EXERCISES -- 

-- Reading data from products table
-- 45 row(s) returned
SELECT * FROM products;

-- query to get product name and quantity per unit
-- 45 row(s) returned
SELECT product_name, quantity_per_unit FROM products;

-- query to get a list of currently available products
-- 40 row(s) returned
SELECT id, product_name FROM products WHERE discontinued = 0 ORDER BY ID ASC;

-- query to get a list of discontinued products
-- 5 row(s) returned
SELECT id, product_name FROM products WHERE discontinued = 1 ORDER BY id DESC;

-- write a query to get the name and price of the most expensive product
-- this will show the most expensive product at the top
SELECT product_name, list_price, standard_cost FROM products ORDER BY list_price DESC; 

-- write a query to get the name and price of the least expensive product
-- this will list the least expensive product at the top
SELECT product_name, list_price, standard_cost FROM products ORDER BY list_price ASC; 

-- get a list of products that cost less than $20
-- 32 row(s) returned
SELECT product_name FROM products WHERE list_price <= 20;

-- get a list of products that cost between $15 and $25
-- 10 row(s) returned
SELECT product_name FROM products WHERE list_price BETWEEN 15 AND 25;

-- get a list of the ten most expensive products
-- using limit to only show 10 rows
SELECT product_name, list_price, standard_cost FROM products ORDER BY list_price DESC LIMIT 10;

-- count of all the current products
-- 40
SELECT COUNT(product_name) FROM products WHERE discontinued = 0;

-- count of all the discontinued products
-- 5
SELECT COUNT(product_name) FROM products WHERE discontinued = 1;

-- END OF SELECT EXERCISES --


-- START OF UPDATE EXERCISES --

SELECT * FROM employees;

-- statement to change the email of every employee to 'not available'
-- 9 row(s) affected
UPDATE employees SET email_address = 'Not Available';

-- write a statement to change email to 'classified' and first_name to dave
-- 9 row(s) affected
UPDATE employees SET email_address = 'Not Available', first_name = 'Dave';

-- changing email to 'super top secret' and last_name to McSalesman 
-- for employees who's job_title is Sales Representative
-- 6 row(s) affected
UPDATE employees SET email_address = 'Super Top Secret', last_name = 'McSalesman' WHERE job_title = 'Sales Representative';

-- statement to change the webpage of all the employees in Seattle to the Wiki page for seattle
-- 4 row(s) affected
UPDATE employees SET web_page = 'https://en.wikipedia.org/wiki/Seattle' WHERE city = 'Seattle';

SELECT * FROM customers;

-- Change Roland Wacker's last name to Andersen
-- 1 row(s) affected - 1 changed
UPDATE customers SET last_name = 'Andersen' WHERE first_name = 'Roland' AND last_name = 'Wacker';

-- Checking if update went through, Wacker should not appear
-- 0 row(s) returned
SELECT first_name, last_name FROM customers WHERE last_name = 'Wacker';

-- Checking is spelling is correct
-- 2 row(s) returned
SELECT first_name, last_name FROM customers WHERE last_name = 'Andersen';

SELECT * FROM order_details_status;
SELECT * FROM orders;

-- using inner join to see the status of all orders
-- this matches the status_ID from orders and id from order_details_status
SELECT * FROM order_details_status od INNER JOIN orders o on od.id = o.status_id;

-- finding how many unshipped orders Roland Wacker has
-- 1 row(s) returned
SELECT * FROM orders WHERE shipper_id = 2 AND ship_name = 'Roland Wacker';

-- finding out what Elizabeth's address is 
SELECT * FROM orders WHERE ship_name = 'Elizabeth Andersen';

-- changing ship_name and ship_address on any orders that have not yet shipped to Roland
-- the ship name should reflect Roland's new last_name, and match Elizabeth's new address
-- 1 row(s) affected
UPDATE orders SET ship_name = 'Roland Andersen', ship_address = '123 8th Street', ship_city = 'Portland', ship_state_province = 'OR' WHERE status_id = 2;

-- checking if details for Roland Wacker has changed
-- 1 row(s) returned
SELECT * FROM orders WHERE ship_name = 'Roland Andersen';

-- checking other entries are unaffected as they have either shipped or unapplicable
-- 3 row(s) returned
SELECT * FROM orders WHERE ship_name = 'Roland Wacker';

-- END OF UPDATE EXERCISES --


-- START OF DELETE EXERCISES --

-- Seeing the orders ID ordered by lowest number first which is 30
SELECT * FROM orders ORDER BY id ASC;

-- checking for PK's DOESNT WORK?!
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
	REFERENCED_TABLE_SCHEMA = 'db_name'
    AND REFERENCED_TABLE_NAME = 'table_name';

-- attempting to delete order id 30
-- cannot delete or update a parent row: a foreign key constraint fails 
-- ('northwind'.'invoices', CONSTRAINT 'fk_invoices_orders1' FOREIGN KEY ('order_id') REFERENCES 'orders'('id'))
DELETE FROM orders WHERE id = 30;

-- *** WARNING DANGEROUS SQL STATEMENTS** --
-- dropping constraint id PK from orders
-- 48 rows affected
ALTER TABLE orders DROP PRIMARY KEY,
DROP FOREIGN KEY 
fk_orders_customers;

-- 0 rows affected
ALTER TABLE orders
DROP FOREIGN KEY 
fk_orders_employees1;

-- 0 rows affected
ALTER TABLE orders
DROP FOREIGN KEY 
fk_orders_orders_status1;

-- 0 rows affected
ALTER TABLE orders
DROP FOREIGN KEY 
fk_orders_orders_tax_status1;

ALTER TABLE orders
DROP FOREIGN KEY 
fk_orders_shippers1;

-- dropping multiple constraints
SELECT concat('ALTER TABLE ', TABLE_NAME, ' DROP FOREIGN KEY ', CONSTRAINT_NAME, ';') 
FROM information_schema.key_column_usage 
WHERE CONSTRAINT_SCHEMA = 'db_name' 
AND referenced_table_name IS NOT NULL;

-- WHEN SCHEMA IS REFRESHED FK IS EMPTY
-- EER diagram shows orders table does not contain PK and FK
-- ***END OF DANGEROUS MOVES*** --

-- TO DISABLE FOREIGN KEY CHECKS --
-- disabling FK checks
SET FOREIGN_KEY_CHECKS = 0;

-- running the statement below should delete order id 30
-- 1 row affected
DELETE FROM orders WHERE id = 30;

-- delete any orders that are shipping to New York
DELETE FROM orders WHERE ship_city = 'New York';

-- delete any discontinued products from the product table
-- need to see column name
SELECT * FROM products;

-- deleting discontinued products
-- 5 row(s) affected
DELETE FROM products WHERE discontinued = 1;

-- select a customer, delete them, any orders they have made, 
-- and any related date in the order_details table

-- finding a random customer
-- chose a Karen
SELECT * FROM customers;
SELECT * FROM order_details;

-- finding more info by JOIN
SELECT * FROM customers c LEFT JOIN order_details od on od.id = c.id ORDER BY c.first_name;

-- finding Karen in orders table
SELECT * FROM orders WHERE customer_id = 27;

-- deleting orders made by Karen
-- 1 row affected
DELETE FROM orders WHERE customer_id = 27;

-- checking 27 is definitely Karen in order_details
SELECT * FROM order_details WHERE purchase_order_id = 96;

-- deleting Karen's order details
DELETE FROM order_details WHERE id = 27;
DELETE FROM order_details WHERE purchase_order_id = 96;

-- ***WARNING DELETING (DROP) WHOLE TABLE AND DATABASE!!*** --

-- dropping whole employees table
-- could use truncate to drop data inside table, but table will still exists
DROP TABLE employees;

-- dropping whole database
-- dropping DB will result in complete loss of all data stored!
DROP DATABASE northwind; 


-- END OF SQL & MYSQL EXERCISES --
