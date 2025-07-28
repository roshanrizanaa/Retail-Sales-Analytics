# Retail Sales Analytics (SQL Project)

This project analyzes retail sales data using **pure SQL queries**. The goal is to gain useful business insights such as top-selling products, best-performing regions, monthly trends, and sales rep performance.

## 🔍 Project Objective
- Help business users understand sales performance across products, reps, and regions
- Use only SQL to clean, explore, and analyze the data
- Practice joins, aggregations, filters, subqueries, and date functions

## 🗂️ Datasets (Tables Used)
- **sales**: sale_id, product_id, sale_date, sale_amount, region_id, rep_id
- **products**: product_id, product_name, category
- **regions**: region_id, region_name
- **sales_reps**: rep_id, rep_name, region_id

## 🧠 Key SQL Tasks
- Total Sales by Region
- Monthly Sales Trends
- Top 5 Products by Revenue
- Performance of Sales Representatives
- Low-Performing Regions (less than 100 transactions)
- Sales above average by rep

All queries are saved in the file: `sales_analysis.sql`

## 🛠️ Tools Used
- SQL (MySQL syntax)
- DBeaver for query testing
- GitHub for project sharing

## 📊 Sample Query (Top 5 Products)
```sql
SELECT p.product_name, SUM(s.sale_amount) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;
