# 🛍️ Retail Sales Analytics – SQL & IBM Cognos Project

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

### 🔹 Step 4 – Perform Data Analysis (SQL)

--  1. Total Sales by Region

SELECT r.region_name, SUM(s.sale_amount) AS total_sales
FROM sales s
JOIN regions r ON s.region_id = r.region_id
GROUP BY r.region_name
ORDER BY total_sales DESC;

--  2. Monthly Sales Trend

SELECT DATE_FORMAT(s.sale_date, '%Y-%m') AS month, SUM(s.sale_amount) AS monthly_sales
FROM sales s
GROUP BY month
ORDER BY month;

--  3. Top 5 Best-Selling Products

SELECT p.product_name, SUM(s.sale_amount) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

--  4. Sales Rep Performance

SELECT sr.rep_name, SUM(s.sale_amount) AS total_sales
FROM sales s
JOIN sales_reps sr ON s.rep_id = sr.rep_id
GROUP BY sr.rep_name
ORDER BY total_sales DESC;

--  5. Regions with Low Sales Activity

SELECT r.region_name, COUNT(*) AS transaction_count
FROM sales s
JOIN regions r ON s.region_id = r.region_id
GROUP BY r.region_name
HAVING transaction_count < 100;

---

### 🔹 Step 5 – Create Visualizations
-- Tool Used: IBM Cognos Analytics

-- 📊 Dashboard Highlights
Insight	Visualization Type
Total Sales by Region	Bar Chart
Monthly Sales Trend	Line Chart
Top 5 Best-Selling Products	Horizontal Bar Chart
Sales Rep Performance Pie Chart
Low-Sales Regions	Colored Bar 

-- 🔘 Filters/Slicers Used
Region

Product Category

Year

-- 🎨 Dashboard Features
Clean and consistent formatting

Interactive visuals with slicers

Titles, color coding, and labels

Exported as .pdf

---

### 🔹 Step 6 – Insights Summary
📈 North region has the highest total sales.

📉 Central region shows the lowest transaction volume.

📊 Sales peak in November and December; dip in February.

🥇 Product A and Product B are top performers.

👩‍💼 Rep Priya is the top-performing sales rep.

These insights can support strategic decisions in sales, marketing, and staffing.

---

### 🔹 Step 7 – Upload to GitHub & Final Presentation

After completing all analysis and visualizations, I organized and uploaded the project files to GitHub to showcase the complete workflow of a Data Analyst project.

---

### 📁 Project Folder Structure
-- 🧾 What Each File Contains

| File                          | Purpose                                                         |
|-------------------------------|-----------------------------------------------------------------|
| `README.md`                   | Full explanation of the project steps, queries, and outcomes    |
| `sales_analysis.sql`          | SQL scripts for answering key business questions                |
| `Retail-Sales-SQL-Project.zip`| Dataset used for queries and dashboard                          |
| `Dashboard.pdf`               | Dashboard with charts                                           |


---

### ✅ Status

- [x] Data Cleaning Completed  
- [x] SQL Queries Executed  
- [x] Insights Generated  
- [x] Dashboard Created  
- [x] Project Documented on GitHub  


---

### 🧰 Tools Used
SQL (MySQL)

IBM Cognos Analytics

Excel (optional)


---

### 🏁 Conclusion
This project follows a complete data analysis lifecycle:

Define → Understand → Clean → Analyze → Visualize → Summarize → Present

It demonstrates the ability to turn raw data into actionable business insights using real-world analyst tools.

---

### 📬 Contact
Author: Roshan Rizana Ayub Khan
Email: roshanririzana@gmail.com
LinkedIn: https://www.linkedin.com/in/roshan-rizana/



