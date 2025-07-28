# 🛍️ Retail Sales Analytics – SQL & Power BI Project

## 📌 Objective

Analyze retail sales data to help the business make informed decisions by identifying:

- Which regions generate the most revenue?
- What are the monthly sales trends?
- Who are the top-performing sales reps?
- What are the top 5 best-selling products?
- Which regions are underperforming?

---

## 📁 Dataset Overview

The project uses four related tables:

| Table Name   | Description                                      |
|--------------|--------------------------------------------------|
| `sales`      | Sales transactions with sale_date and amount     |
| `products`   | Product information including name and category  |
| `regions`    | List of sales regions                            |
| `sales_reps` | Sales representatives and the region they cover  |

### 🗃️ Table Relationships (ERD)

- `sales.product_id` → `products.product_id`
- `sales.region_id` → `regions.region_id`
- `sales.rep_id` → `sales_reps.rep_id`
- `sales_reps.region_id` → `regions.region_id`

---

## ✅ Project Steps

### 🔹 Step 1: Define the Objective

Understand sales performance across regions, products, and sales reps using historical data.

---

### 🔹 Step 2: Understand the Data

Explored data types, relationships, and structure of each table.

---

### 🔹 Step 3: Clean the Data

- Removed rows with null or zero `sale_amount`
- Checked for and removed any duplicate `sale_id`s
- Verified correct date format in `sale_date`
- Ensured all foreign key relationships joined successfully

---

### 🔹 Step 4: Perform Data Analysis (SQL)

```sql
-- Total Sales by Region
SELECT r.region_name, SUM(s.sale_amount) AS total_sales
FROM sales s
JOIN regions r ON s.region_id = r.region_id
GROUP BY r.region_name
ORDER BY total_sales DESC;

-- Monthly Sales Trend
SELECT DATE_FORMAT(s.sale_date, '%Y-%m') AS month, SUM(s.sale_amount) AS monthly_sales
FROM sales s
GROUP BY month
ORDER BY month;

-- Top 5 Best-Selling Products
SELECT p.product_name, SUM(s.sale_amount) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- Sales Rep Performance
SELECT sr.rep_name, SUM(s.sale_amount) AS total_sales
FROM sales s
JOIN sales_reps sr ON s.rep_id = sr.rep_id
GROUP BY sr.rep_name
ORDER BY total_sales DESC;

-- Regions with Low Sales Activity
SELECT r.region_name, COUNT(*) AS transaction_count
FROM sales s
JOIN regions r ON s.region_id = r.region_id
GROUP BY r.region_name
HAVING transaction_count < 100;
