SELECT products.category AS Category, 
COALESCE(SUM(orders.quantity), 0) AS Product_Total 
FROM products 
LEFT JOIN orders ON products.product_id = orders.product_id
AND orders.order_date LIKE '%-07-04'
GROUP BY products.category
ORDER BY Product_Total DESC;