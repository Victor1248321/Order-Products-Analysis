SELECT orders.payment_method AS Payment_Method, 
COUNT(orders.order_id) AS Total_Orders,
ROUND(SUM(products.price)) AS 'Amount_Spent in $'
FROM customers 
INNER JOIN orders ON orders.customer_id = customers.customer_id
INNER JOIN products ON products.product_id = orders.product_id
GROUP BY orders.payment_method; 