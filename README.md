# 🛒 Retail Sales Analysis (Oracle SQL Project)

## 📌 Project Overview
The "Retail Sales Analysis" project is built using "Oracle SQL" to simulate and analyze sales transactions in a retail store.  
It demonstrates the complete workflow of creating a database, inserting sample data, and writing analytical SQL queries to answer real-world business questions.

---

## ⚙️ Features
- Create a "Retail Sales Database" with structured schema.  
- Insert "50 sample sales records" covering different categories (Clothing, Electronics, Beauty, etc.).  
- Perform "sales analysis queries" such as:
  - Total sales and revenue trends
  - Customer purchase behavior
  - Top-selling categories
  - Time-based sales analysis (daily, monthly, shifts)
  - Identifying top customers and products

---

## 🗂️ Database Schema
"Table: retail_sales"

| Column Name     | Data Type       | Description |
|-----------------|----------------|-------------|
| transaction_id  | NUMBER         | Unique transaction ID |
| sale_date       | DATE           | Date of sale |
| sale_time       | DATE (time)    | Time of sale |
| customer_id     | NUMBER         | Unique customer ID |
| gender          | VARCHAR2(10)   | Gender of customer |
| age             | NUMBER         | Age of customer |
| category        | VARCHAR2(50)   | Product category |
| quantity        | NUMBER         | Quantity purchased |
| price_per_unit  | NUMBER(10,2)   | Price per unit |
| cogs            | NUMBER(10,2)   | Cost of goods sold |
| total_sale      | NUMBER(10,2)   | Total sale amount |

---

## 💾 Sample Data
- "50 rows" of sample sales data inserted using a single INSERT statement.  
- Covers "different dates, times, customers, categories, and sales amounts".  

---

## 🔍 Example Queries
Here are some of the analytical queries included in the project:

1. Total Sales by Category
   ```sql
   SELECT category, SUM(total_sale) AS total_sales
   FROM retail_sales
   GROUP BY category
   ORDER BY total_sales DESC;
2.Top 5 Customers by Sales
SELECT *
FROM (
    SELECT customer_id, SUM(total_sale) AS total_sales
    FROM retail_sales
    GROUP BY customer_id
    ORDER BY total_sales DESC
)
WHERE ROWNUM <= 5;
