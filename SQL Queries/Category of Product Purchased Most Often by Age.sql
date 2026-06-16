WITH sales_per_age_category AS (
    SELECT customers.age,
      products.category,
      SUM(orders.quantity) AS total_sold
    FROM orders
    INNER JOIN products ON products.product_id = orders.product_id
    INNER JOIN customers ON customers.customer_id = orders.customer_id
    GROUP BY customers.age, products.category
),

max_sales_per_age AS (
    SELECT sales_per_age_category.age,
      MAX(sales_per_age_category.total_sold) AS highest_sold
    FROM sales_per_age_category
    GROUP BY sales_per_age_category.age
)

SELECT sales_per_age_category.age,
	sales_per_age_category.category
FROM sales_per_age_category
INNER JOIN max_sales_per_age ON sales_per_age_category.age = max_sales_per_age.age 
AND sales_per_age_category.total_sold = max_sales_per_age.highest_sold;