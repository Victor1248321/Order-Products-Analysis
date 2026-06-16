WITH Customer_Total AS (
	SELECT COUNT(customer_id) AS total, 
	city 
	FROM customers 
	WHERE loyalty_member = 'Yes'
	GROUP BY city
)

SELECT city AS Cities,
total AS Average_Loyalty_Tier_Customers
FROM Customer_Total 
GROUP BY city
ORDER BY Cities ASC;