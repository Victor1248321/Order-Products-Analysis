SELECT customers.city AS City,
COUNT(DISTINCT customers.customer_id) AS Customer_Total
FROM customers 
INNER JOIN orders ON orders.customer_id = customers.customer_id 
INNER JOIN products ON products.product_id = orders.product_id 
WHERE customers.loyalty_member = 'Yes'
AND orders.order_date LIKE '2023-%'
AND products.category = 'Electronics'
GROUP BY customers.city
ORDER BY customers.city ASC;