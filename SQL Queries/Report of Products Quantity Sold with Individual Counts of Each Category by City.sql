SELECT customers.city AS City,
SUM(orders.quantity) AS Total_Sold,
SUM(CASE WHEN products.category = 'Beauty' THEN orders.quantity ELSE 0 END) AS Beauty_Products,
SUM(CASE WHEN products.category = 'Electronics' THEN orders.quantity ELSE 0 END) AS Electronics_Products,
SUM(CASE WHEN products.category = 'Sports' THEN orders.quantity ELSE 0 END) AS Sports_Products,
SUM(CASE WHEN products.category = 'Home' THEN orders.quantity ELSE 0 END) AS Home_Products,
SUM(CASE WHEN products.category = 'Clothing' THEN orders.quantity ELSE 0 END) AS Clothing_Products
FROM customers
INNER JOIN orders ON orders.customer_id = customers.customer_id
INNER JOIN products ON products.product_id = orders.product_id
WHERE orders.order_date LIKE '2024-%'
GROUP BY customers.city
ORDER BY City ASC, Total_Sold DESC; 