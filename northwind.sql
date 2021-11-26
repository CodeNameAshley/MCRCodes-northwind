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

-- crea
CREATE TABLE countries (
country_id INT NOT NULL,
country_name VARCHAR(100) NOT NULL,
region_id INT NOT NULL
);