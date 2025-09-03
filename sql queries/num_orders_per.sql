SELECT * FROM orders;
SELECT * FROM order_items; 
SELECT * FROM customers; 
SELECT * FROM products;

-- total number of order ITEMS per city, not neccessarily the number of ORDERS 
-- if an order contains multiple items, it will appear multiple times in order_items

SELECT  
	o.city, 
	COUNT(oi.order_id) AS orders_items_per_city
FROM order_items oi
JOIN orders o
	ON oi.order_id = o.order_id 
GROUP BY 1
ORDER BY 2 desc; 
	
-- total number of orders per city
SELECT  
	city, 
	COUNT(*) 
FROM orders
GROUP BY 1
ORDER BY 2 desc; 
	
-- OR
SELECT  
	o.city, 
	COUNT(DISTINCT oi.order_id) AS orders_per_city
FROM order_items oi
JOIN orders o
	ON oi.order_id = o.order_id 
GROUP BY 1
ORDER BY 2 desc; 

-- total number of orders per region
SELECT  
	region, 
	COUNT(*) orders_per_region
FROM orders
GROUP BY 1
ORDER BY 2 desc;
-- west ordered the most, could do a targeted marketing campaign for those customers that live in western states 


--total number of orders per state
SELECT  
	state, 
	COUNT(*) orders_per_region
FROM orders
GROUP BY 1
ORDER BY 2 desc;

-- total number of orders per customer 
SELECT 
	c.customer_name, 
	o.customer_id,
	COUNT(*) 
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY 2
ORDER BY 3 DESC; -- emily phan ordered the most

-- find emily phan
SELECT * FROM customers WHERE customer_name = 'Emily Phan';

CREATE VIEW most_frequent_buyer AS -- based on customer who buys the most 
SELECT 
	c.customer_id, 
	c.customer_name, 
	c.segment, 
	o.city, 
	o.state, 
	o.region,
	oi.order_id, 
	oi.quantity, 
	p.product_name, 
	p.category, 
	p.sub_category
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p 
	ON oi.product_id = p.product_id
WHERE customer_name = 'Emily Phan'; -- emily phan has 31 order items 

select DISTINCT order_id FROM most_frequent_buyer; -- this is just to check that emily phan had the most orders per customer
	