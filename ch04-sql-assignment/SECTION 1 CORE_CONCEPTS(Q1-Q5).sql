--SECTION 1 - CORE SQL CONCEPTS 
--Q1 LIST CUSTOMERS LOCATEDIN NAIROBI AND SHOW FULL NAME AND LOCATION ONLY
--A1
SELECT full_name, location
FROM customer_info 
WHERE location = 'Nairobi';

--Q2 DISPLAY EACH CUSTOMER ALONG WITH THE PRODUCTS THEY PURCHASED, INCLUDE FULL NAME, PRODUCT NAME AND PRICE
--A2
SELECT ci.full_name, p.product_name, p.price 
FROM customer_info ci 
INNER JOIN products p ON ci.customer_id = p.customer_id;

--Q3 TOTAL SALES AMOUNT PER CUSTOMER(DESCENDING ORDER)
--A3
SELECT ci.full_name, SUM(s.total_sales) AS total_amount_spent
FROM customer_info ci 
JOIN sales s ON ci.customer_id = s.customer_id 
GROUP BY ci.full_name 
ORDER BY total_amount_spent 
DESC;

--Q4 CUSTOMERS WHO PURCHASED PRODUCTS PRICED ABOVE 10,000
--A4 NO CUSTOMERS PURCHASED PRODUCTS PRICED ABOVE 10000
SELECT DISTINCT ci.full_name
FROM customer_info ci 
JOIN products p ON ci.customer_id = p.customer_id 
WHERE p.price>10000;

--Q5 TOP 3 CUSTOMERS WITH HIGHEST TOTAL SALES
--A5 Amelia White, Thomas Thomas and Jane Robinson
SELECT ci.full_name, SUM(s.total_sales) AS total_sales
FROM customer_info ci 
JOIN sales s on ci.customer_id = s.customer_id 
GROUP BY ci.full_name 
ORDER BY total_sales DESC 
LIMIT 3;



--SECTION 3: OPTIMIZATION
Q11: OPTIMIZE SLOW QUERY 

--Specify needed columns and avoid SELECT * 
--ADD INDEX ON TOTAL_SALES

CREATE INDEX indx_total_sales ON sales(total_sales);
SELECT sales_id, total_sales FROM sales WHERE total_sales > 5000;

--Q12 INDEX ON customer_info(location) and a test query
CREATE INDEX idx_location ON customer_info(location);
--TEST QUERY
EXPLAIN SELECT * FROM customer_info WHERE location = 'Nairobi';


