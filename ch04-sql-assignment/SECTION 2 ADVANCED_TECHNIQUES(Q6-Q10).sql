--SECTION 2 ADVANCED TECHNIQUES 
--Q6: CTE for customers with above average sales
WITH avg_sales AS (
SELECT AVG(total_sales) AS avg_total
FROM sales 
)
SELECT ci.full_name , SUM(s.total_sales) AS total_spent
FROM customer_info ci 
JOIN sales s ON ci.customer_id = s.customer_id 
GROUP BY ci.full_name 
HAVING total_spent > (SELECT avg_total FROM avg_sales);

--Q7 WINDOW FUNCTION TO RANK PRODUCTS
SELECT p.product_name,
SUM(s.total_sales) AS total_sales,
RANK() OVER (ORDER BY SUM(s.total_sales) DESC) AS sales_rank
FROM products p 
JOIN sales s ON p.product_id = s.product_id 
GROUP BY p.product_name ;

--Q8 VIEW FOR HIGH-VALUE CUSTOMERS
CREATE VIEW high_value_customers AS
SELECT ci.full_name, SUM(s.total_sales) AS total_spent
FROM customer_info ci 
JOIN sales s ON ci.customer_id = s.customer_id
GROUP BY ci.full_name
HAVING total_spent > 15000;

--Q9 STORED PROCEDURE FOR LOCATION-BASED SPENDING

CREATE PROCEDURE Get_Location_Spending(IN location_name VARCHAR(90) )
BEGIN
	SELECT ci.full_name, SUM(s.total_sales) AS total_spent
	FROM customer_info ci
	JOIN sales s ON ci.customer_id = s.customer_id
	WHERE ci.location = location_name
	GROUP BY ci.full_name;
END
CALL Get_Location_Spending('Nairobi');

--Q10 RECURSIVE RUNNING TOTAL(USING A RECURSIVE CTE)
WITH RECURSIVE running_total AS (
    SELECT 
        sales_id, 
        total_sales, 
        total_sales AS cumulative_sales
    FROM sales
    WHERE sales_id = 1 
    UNION ALL
    SELECT 
        s.sales_id,
        s.total_sales,
        rt.cumulative_sales + s.total_sales
    FROM sales s
    JOIN running_total rt ON s.sales_id = rt.sales_id + 1
)
SELECT * FROM running_total;
