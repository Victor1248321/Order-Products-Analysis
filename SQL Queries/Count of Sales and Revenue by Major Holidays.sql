SELECT products.category AS Category, 
COUNT(CASE WHEN orders.order_date = '2023-11-24' THEN orders.order_id END) AS Black_Friday_Orders,
SUM(CASE WHEN orders.order_date = '2023-11-24' THEN products.price ELSE 0 END) AS Black_Friday_Revenue,
COUNT(CASE WHEN orders.order_date = '2023-11-23' THEN orders.order_id END) AS Thanksgiving_Orders,
SUM(CASE WHEN orders.order_date = '2023-11-23' THEN products.price ELSE 0 END) AS Thanksgiving_Revenue,
COUNT(CASE WHEN orders.order_date = '2023-05-29' THEN orders.order_id END) AS Memorial_Day_Orders,
SUM(CASE WHEN orders.order_date = '2023-05-29' THEN products.price ELSE 0 END) AS Memorial_Day_Revenue,
COUNT(CASE WHEN orders.order_date = '2023-12-24' THEN orders.order_id END) AS Christmas_Day_Orders,
SUM(CASE WHEN orders.order_date = '2023-12-24' THEN products.price ELSE 0 END) AS Christmas_Day_Revenue
FROM customers 
INNER JOIN orders ON orders.customer_id = customers.customer_id
INNER JOIN products ON products.product_id = orders.product_id
GROUP BY products.category
ORDER BY Category ASC; 