-- Retail Sales Analytics Project
-- Author: Roshan Rizana
-- Description: SQL queries to analyze retail sales by region, product, and sales rep.

-- 1. Total Sales by Region
SELECT 
    r.region_name, 
    SUM(s.sale_amount) AS total_sales
FROM 
    sales s
JOIN 
    regions r ON s.region_id = r.region_id
GROUP BY 
    r.region_name
ORDER BY 
    total_sales DESC;

-- 2. Monthly Sales Trend (YYYY-MM format)
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
    SUM(s.sale_amount) AS monthly_sales
FROM 
    sales
GROUP BY 
    month
ORDER BY 
    month;

-- 3. Top 5 Best-Selling Products
SELECT 
    p.product_name, 
    SUM(s.sale_amount) AS revenue
FROM 
    sales s
JOIN 
    products p ON s.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    revenue DESC
LIMIT 5;

-- 4. Sales Performance by Rep (with Region)
SELECT 
    sr.rep_name, 
    r.region_name, 
    SUM(s.sale_amount) AS total_sales
FROM 
    sales s
JOIN 
    sales_reps sr ON s.rep_id = sr.rep_id
JOIN 
    regions r ON sr.region_id = r.region_id
GROUP BY 
    sr.rep_name, r.region_name
ORDER BY 
    total_sales DESC;

-- 5. Low-Performing Regions (less than 100 transactions)
SELECT 
    r.region_name, 
    COUNT(*) AS num_transactions
FROM 
    sales s
JOIN 
    regions r ON s.region_id = r.region_id
GROUP BY 
    r.region_name
HAVING 
    num_transactions < 100;

-- 6. Find Sales Reps with Sales Above Average
SELECT 
    rep_id, 
    SUM(sale_amount) AS total_sales
FROM 
    sales
GROUP BY 
    rep_id
HAVING 
    total_sales > (
        SELECT AVG(total_sales)
        FROM (
            SELECT SUM(sale_amount) AS total_sales
            FROM sales
            GROUP BY rep_id
        ) AS avg_sales
    );

-- 7. Check for Null Sale Amounts
SELECT 
    COUNT(*) AS null_sales_count
FROM 
    sales
WHERE 
    sale_amount IS NULL;

-- 8. Oldest and Newest Sale Dates
SELECT 
    MIN(sale_date) AS first_sale,
    MAX(sale_date) AS last_sale
FROM 
    sales;

-- 9. Total Revenue by Product Category
SELECT 
    p.category,
    SUM(s.sale_amount) AS total_revenue
FROM 
    sales s
JOIN 
    products p ON s.product_id = p.product_id
GROUP BY 
    p.category
ORDER BY 
    total_revenue DESC;
