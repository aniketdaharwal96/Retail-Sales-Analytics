-- Project: Retail Sales Analytics (RSA)
-- File: queries.sql
-- Description: Analytical queries using Joins, Aggregations & Subqueries

-- 1. Customer Lifetime Value (Top Spenders Analysis)
-- Calculates total money spent by each customer across all orders
SELECT 
    c.customer_name,
    c.city,
    SUM(oi.quantity * p.price) AS total_spent
FROM RSA_CUSTOMERS c
JOIN RSA_ORDERS o ON c.customer_id = o.customer_id
JOIN RSA_ORDER_ITEMS oi ON o.order_id = oi.order_id
JOIN RSA_PRODUCTS p ON oi.product_id = p.product_id
GROUP BY c.customer_name, c.city
ORDER BY total_spent DESC;

-- 2. Category-wise Sales Performance
-- Shows total units sold and revenue generated per product category
SELECT 
    p.category,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * p.price) AS total_revenue
FROM RSA_PRODUCTS p
JOIN RSA_ORDER_ITEMS oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 3. Standard Subquery: Products Priced Above Overall Average
-- Identifies premium products priced higher than the overall store average
SELECT product_name, category, price
FROM RSA_PRODUCTS
WHERE price > (SELECT AVG(price) FROM RSA_PRODUCTS);

-- 4. Correlated Subquery: Products Priced Above Their Category Average
-- Compares each product's price against the average price of its own category
SELECT p1.product_name, p1.category, p1.price
FROM RSA_PRODUCTS p1
WHERE p1.price > (
    SELECT AVG(p2.price)
    FROM RSA_PRODUCTS p2
    WHERE p2.category = p1.category
);