# ch04-sql-assignment
## Project Overview
This repository contains my solutions to the 15 SQL tasks covering:
- Core SQL concepts
- Advanced techniques
- Query optimization
- Data modeling
- ## Approach & Explanations

### Section 1: Core SQL Concepts
**Q1: List Nairobi customers**  
Used simple filtering with `WHERE` to extract only customers from Nairobi, selecting only requested columns.

**Q2: Customer purchases**  
Employed `INNER JOIN` to combine customer and product information while preserving relationships.

**Q3: Total sales per customer**  
Utilized `SUM()` aggregation with `GROUP BY` to calculate spending per customer, sorted descending.

**Q4: High-value purchases**  
Implemented `JOIN` with conditional filtering to identify customers purchasing premium products.

**Q5: Top 3 customers**  
Extended Q3 solution with `LIMIT` to efficiently identify highest spenders.

### Section 2: Advanced Techniques
**Q6: Above-average sales (CTE)**  
Created Common Table Expression to store average value, then filtered exceeding sales.

**Q7: Product ranking**  
Used `RANK()` window function with aggregation to order products by sales performance.

**Q8: High-value customers view**  
Created reusable database view encapsulating customer spending threshold logic.

**Q9: Location-based spending procedure**  
Designed parameterized stored procedure for flexible location analysis.

**Q10: Running sales total**  
Implemented recursive CTE to calculate cumulative sales sequentially.

### Section 3: Query Optimization
**Q11: Slow query optimization**  
1. Replaced `SELECT *` with specific columns  
2. Added index on `total_sales` column  
3. Verified improvement using `EXPLAIN`

**Q12: Location query optimization**  
Created index on `location` column to accelerate customer searches by location.

### Section 4: Data Modeling
**Q13: 3NF Schema Redesign**  
Eliminated transitive dependencies by:  
- Removing `customer_id` from products table  
- Ensuring all attributes fully depend on primary keys  
- Using sales as associative table

**Q14: Star Schema Design**  
Created analytics-optimized structure with:  
- Fact table for sales metrics  
- Product dimension table  
- Customer dimension table

**Q15: Denormalization**  
Demonstrated performance-focused denormalization for reporting:  
- Combined frequently accessed columns  
- Eliminated runtime joins  
- Prioritized query speed over storage efficiency

---
