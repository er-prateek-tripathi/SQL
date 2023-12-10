USE sql_store;

-- SELECT 1, 2
-- FROM customers
-- WHERE customer_id = 1
-- ORDER BY first_name
-- This sytax should be followed always^

-- SELECT 
-- 	first_name, 
-- 	last_name, 
--     points, 
--     points+100 AS GST,
--     points * 100 +100 AS 'Discount Factor'
-- FROM customers; 

-- SELECT DISTINCT state
-- FROM customers;

-- SELECT name, unit_price,
-- unit_price*1.1  AS 'New Price'
-- FROM sql_store.products;

-- SELECT * FROM customers WHERE points > 3000
-- SELECT * FROM customers WHERE state != 'VA'
-- SELECT * FROM customers WHERE birth_date > '1990-01-01'

-- Get orders placed in the year 2018
-- SELECT * 
-- FROM orders WHERE order_date  >= '2018-01-01'

SELECT * FROM customers WHERE birth_date > '1990-01-01'OR points > 1000 AND state != 'va'

  




