SELECT customers.city AS City,
COUNT(customers.customer_id) AS Customer_Total
FROM customers 
INNER JOIN orders ON orders.customer_id = customers.customer_id 
INNER JOIN products ON products.product_id = orders.product_id 
WHERE orders.quantity >= 3 
AND orders.order_date LIKE '2023-05-%'
AND products.category = 'Beauty'
GROUP BY customers.city
ORDER BY customers.city ASC;
