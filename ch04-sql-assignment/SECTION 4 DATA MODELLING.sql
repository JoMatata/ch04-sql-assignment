SECTION 4: DATA MODELLING 
--Q13: 3NF REDESIGN
--PROBLEM - Products stores customer_id violates 3NF 
--SOLUTION - MOVE PURCHASE DATA TO SALES 

CREATE TABLE products (
product_id INT PRIMARY KEY
product_name VARCHAR(120)
price FLOAT
);

--Remove customer_id from products and link via sales

--Q14 STAR SCHEMA

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(120),
    price FLOAT
);
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(120),
    location VARCHAR(90)
);
-- Fact table
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    customer_id INT REFERENCES dim_customer(customer_id),
    product_id INT REFERENCES dim_product(product_id),
    total_sales FLOAT
);

Q15: DENORMALIZATION EXAMPLE 
--Scenario: Frequent reports needing customer + product + sales data.
--Denormalized table: Combine key fields into one table.
CREATE TABLE denorm_sales_report (
    sales_id INT PRIMARY KEY,
    total_sales FLOAT,
    customer_id INT,
    full_name VARCHAR(120),
    location VARCHAR(90),
    product_id INT,
    product_name VARCHAR(120),
    price FLOAT
);

