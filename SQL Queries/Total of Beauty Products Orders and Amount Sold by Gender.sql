SELECT customers.gender AS Gender, 
COUNT(orders.order_id) AS Order_Count,
SUM(orders.quantity) AS Total_Products
FROM customers 
INNER JOIN orders ON orders.customer_id = customers.customer_id
INNER JOIN products ON products.product_id = orders.product_id
WHERE products.category = 'Beauty'
GROUP BY customers.gender; 