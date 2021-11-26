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
-- Error Code: 3819 (Check constrains countries check 1 is violated)
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

-- inserting duplicate country_id date for error
-- error code: 1062 (duplicate entry 1 for key country_id)
INSERT INTO countries (country_id, country_name, region_id) VALUES
(001, 'Japan', 4);

-- DELETING and RECREATING table
DROP TABLE countries;

-- Making country_id a PRIMARY KEY field, preventing duplicate data
-- AUTO INCREMENT ensures unique data is automatically inserted 
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
-- 6 row(s) returnes
SELECT * FROM countries;




