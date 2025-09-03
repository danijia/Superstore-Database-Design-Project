SELECT * FROM customers;
SELECT * FROM orders; 
SELECT * FROM order_items; 
SELECT * FROM products;

SELECT 
	c.customer_id, 
	c.customer_name, 
	o.order_id, 
	o.order_date, 
	o.ship_date, 
	o.ship_mode, 
	oi.sales, 
	oi.quantity, 
	oi.discount, 
	oi.profit
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id;