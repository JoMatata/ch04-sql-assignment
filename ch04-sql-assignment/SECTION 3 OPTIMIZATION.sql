--SECTION 3:OPTIMIZATION

--Q11: Optimize slow query (SELECT * FROM sales WHERE total_sales > 5000).

--Change 1: Avoid SELECT * → specify needed columns.
--Change 2: Add an index on total_sales.
CREATE INDEX idx_total_sales ON sales(total_sales);
SELECT sales_id, total_sales FROM sales WHERE total_sales > 5000; -- Optimized


--Q12: Index on customer_info(location) + test query.

CREATE INDEX idx_location ON customer_info(location);
-- Test query
EXPLAIN SELECT * FROM customer_info WHERE location = '