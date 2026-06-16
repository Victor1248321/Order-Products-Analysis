SELECT products.category AS Category, 
SUM(orders.quantity) AS Products_Ordered 
FROM customers 
INNER JOIN orders ON orders.customer_id = customers.customer_id
INNER JOIN products ON products.product_id = orders.product_id
WHERE customers.gender = 'Male'
AND orders.order_date LIKE '2024-%' 
AND customers.age >= 50 
GROUP BY products.category
ORDER BY Products_Ordered DESC; 