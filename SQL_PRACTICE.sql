SELECT first_name,last_name, city FROM customers;

SELECT city FROM customers;

SELECT DISTINCT city FROM customers;

SELECT COUNT(DISTINCT city) FROM customers;

SELECT state_province FROM customers;


SELECT * FROM customers LIMIT 3;

CREATE DATABASE TEST;
SHOW DATABASES;
DROP DATABASE TEST;
SHOW DATABASES;