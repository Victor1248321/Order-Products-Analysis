SELECT customers.age AS Age, 
SUM(orders.quantity) AS Product_Total 
FROM customers 
INNER JOIN orders ON orders.customer_id = customers.customer_id
GROUP BY customers.age;