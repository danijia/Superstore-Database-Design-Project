SELECT * 
FROM orders
WHERE order_id = 'CA-2016-152156'

SELECT * 
FROM order_items 
WHERE order_id = 'CA-2016-152156';

SELECT COUNT(DISTINCT order_id)
FROM order_items; -- 5000 order_items;


-- to find the total sales per order_id
SELECT
	oi.order_id, 
	ROUND(SUM(oi.sales), 2) AS total_sales, 
	c.customer_id
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN customers c 
ON o.customer_id = c.customer_id
GROUP BY 1
ORDER BY 2 DESC;
-- join customers table + order table? 

SELECT * FROM order_items LIMIT 10;

SELECT * FROM customers WHERE customer_id = 'SM-20320'
SELECT * FROM orders WHERE customer_id = 'SM-20320' -- CA-2014-145317

SELECT * FROM order_items WHERE order_id IN ('CA-2017-149146', 'CA-2017-145128', 'CA-2014-145317', 'CA-2015-144890', 'US-2015-130512');

SELECT * 
FROM order_items 
WHERE order_id = 'CA-2014-145317';


-- total sales per customer_id 
SELECT 
	SUM(oi.sales) AS total_sales, 
	c.customer_id, 
	c.segment
FROM order_items oi
JOIN orders o 
ON oi.order_id = o.order_id
JOIN customers c 
ON o.customer_id = c.customer_id
GROUP BY 2
ORDER BY 1 DESC;

SELECT *
FROM order_items oi
JOIN orders o 
ON oi.order_id = o.order_id
JOIN customers c 
ON o.customer_id = c.customer_id
WHERE segment = 'Corporate';

SELECT * FROM orders o JOIN customers c ON o.customer_id = c.customer_id  WHERE c.customer_id = 'SM-20320'