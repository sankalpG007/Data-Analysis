# Task 6 - Sales Trend Analysis Using Aggregations 📊

## 📁 Project Overview

This project is part of a Data Analyst Internship and focuses on analyzing sales trends using SQL. The goal is to calculate **monthly revenue** and **order volume** by performing SQL aggregations on a sample `orders` dataset.

---

## 🛠 Tools & Technologies Used

- **MySQL Workbench**
- **SQL (Structured Query Language)**
- **Git & GitHub**

---

## 📄 Dataset

A mock dataset was created manually using SQL:
- Table: `orders`
- Columns:
  - `order_id` (INT)
  - `order_date` (DATE)
  - `amount` (DECIMAL)
  - `product_id` (INT)

The dataset includes multiple sales records across different months and years.

---

## 🧠 Tasks Performed

1. **Create and Insert Data into Orders Table**
2. **Analyze Monthly Revenue and Order Volume**
   - Grouped by Year and Month
   - Aggregated using `SUM()` and `COUNT(DISTINCT)`
3. **Identify Top 3 Months by Revenue**
   - Sorted in descending order

---

## 🧾 SQL Queries Used

### 1️⃣ Monthly Revenue and Order Volume

```sql
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    orders
GROUP BY 
    order_year, order_month
ORDER BY 
    order_year, order_month;
