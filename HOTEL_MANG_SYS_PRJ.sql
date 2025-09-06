-------------------------------------------------
-- 🛒 SQL Retail Sales Analysis - Oracle Version
-- Author: Kiran Kumar Reddy SAREDDY
-------------------------------------------------

-- Drop table if exists
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE retail_sales CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
-- Create table
CREATE TABLE retail_sales (
    transaction_id   NUMBER PRIMARY KEY,
    sale_date        DATE,
    sale_time        DATE, -- Oracle has no TIME, use DATE or TIMESTAMP
    customer_id      NUMBER,
    gender           VARCHAR2(15),
    age              NUMBER,
    category         VARCHAR2(15),
    quantity         NUMBER,
    price_per_unit   NUMBER(10,2),
    cogs             NUMBER(10,2),
    total_sale       NUMBER(10,2)
);
-------------------------------------------------
-- Insert 50 Sample Records into retail_sales (Oracle Format)
-------------------------------------------------
INSERT ALL
    INTO retail_sales (transaction_id, sale_date, sale_time, customer_id, gender, age, category, quantity, price_per_unit, cogs, total_sale)
    VALUES (1, DATE '2022-01-05', TO_DATE('09:15:00','HH24:MI:SS'), 101, 'Male', 25, 'Clothing', 2, 500, 800, 1000)
    INTO retail_sales VALUES (2, DATE '2022-01-07', TO_DATE('14:30:00','HH24:MI:SS'), 102, 'Female', 32, 'Electronics', 1, 1200, 900, 1200)
    INTO retail_sales VALUES (3, DATE '2022-01-12', TO_DATE('18:45:00','HH24:MI:SS'), 103, 'Male', 40, 'Beauty', 5, 200, 600, 1000)
    INTO retail_sales VALUES (4, DATE '2022-02-01', TO_DATE('10:05:00','HH24:MI:SS'), 104, 'Female', 29, 'Clothing', 3, 700, 1500, 2100)
    INTO retail_sales VALUES (5, DATE '2022-02-11', TO_DATE('16:00:00','HH24:MI:SS'), 105, 'Male', 35, 'Electronics', 2, 1500, 2500, 3000)
    INTO retail_sales VALUES (6, DATE '2022-02-18', TO_DATE('19:30:00','HH24:MI:SS'), 106, 'Female', 27, 'Beauty', 4, 250, 600, 1000)
    INTO retail_sales VALUES (7, DATE '2022-03-03', TO_DATE('11:10:00','HH24:MI:SS'), 107, 'Male', 42, 'Clothing', 6, 400, 1800, 2400)
    INTO retail_sales VALUES (8, DATE '2022-03-05', TO_DATE('13:40:00','HH24:MI:SS'), 108, 'Female', 30, 'Electronics', 1, 2000, 1500, 2000)
    INTO retail_sales VALUES (9, DATE '2022-03-15', TO_DATE('20:20:00','HH24:MI:SS'), 109, 'Male', 38, 'Beauty', 7, 150, 700, 1050)
    INTO retail_sales VALUES (10, DATE '2022-03-22', TO_DATE('09:25:00','HH24:MI:SS'), 110, 'Female', 26, 'Clothing', 5, 350, 1200, 1750)
    INTO retail_sales VALUES (11, DATE '2022-04-02', TO_DATE('15:15:00','HH24:MI:SS'), 111, 'Male', 33, 'Electronics', 3, 1800, 4000, 5400)
    INTO retail_sales VALUES (12, DATE '2022-04-06', TO_DATE('19:50:00','HH24:MI:SS'), 112, 'Female', 37, 'Beauty', 2, 500, 600, 1000)
    INTO retail_sales VALUES (13, DATE '2022-04-12', TO_DATE('10:35:00','HH24:MI:SS'), 113, 'Male', 41, 'Clothing', 4, 600, 1500, 2400)
    INTO retail_sales VALUES (14, DATE '2022-04-19', TO_DATE('17:25:00','HH24:MI:SS'), 114, 'Female', 28, 'Electronics', 2, 2200, 3000, 4400)
    INTO retail_sales VALUES (15, DATE '2022-04-25', TO_DATE('12:00:00','HH24:MI:SS'), 115, 'Male', 36, 'Beauty', 3, 300, 500, 900)
    INTO retail_sales VALUES (16, DATE '2022-05-03', TO_DATE('11:45:00','HH24:MI:SS'), 116, 'Female', 24, 'Clothing', 1, 450, 300, 450)
    INTO retail_sales VALUES (17, DATE '2022-05-08', TO_DATE('14:10:00','HH24:MI:SS'), 117, 'Male', 39, 'Electronics', 2, 1750, 2500, 3500)
    INTO retail_sales VALUES (18, DATE '2022-05-15', TO_DATE('18:00:00','HH24:MI:SS'), 118, 'Female', 31, 'Beauty', 5, 220, 800, 1100)
    INTO retail_sales VALUES (19, DATE '2022-05-20', TO_DATE('20:10:00','HH24:MI:SS'), 119, 'Male', 44, 'Clothing', 7, 300, 1800, 2100)
    INTO retail_sales VALUES (20, DATE '2022-05-27', TO_DATE('09:05:00','HH24:MI:SS'), 120, 'Female', 29, 'Electronics', 1, 2500, 2000, 2500)
    INTO retail_sales VALUES (21, DATE '2022-06-04', TO_DATE('10:30:00','HH24:MI:SS'), 121, 'Male', 26, 'Beauty', 6, 180, 900, 1080)
    INTO retail_sales VALUES (22, DATE '2022-06-09', TO_DATE('15:40:00','HH24:MI:SS'), 122, 'Female', 34, 'Clothing', 3, 550, 1200, 1650)
    INTO retail_sales VALUES (23, DATE '2022-06-16', TO_DATE('13:00:00','HH24:MI:SS'), 123, 'Male', 40, 'Electronics', 1, 3000, 2000, 3000)
    INTO retail_sales VALUES (24, DATE '2022-06-22', TO_DATE('19:20:00','HH24:MI:SS'), 124, 'Female', 25, 'Beauty', 2, 600, 700, 1200)
    INTO retail_sales VALUES (25, DATE '2022-06-29', TO_DATE('09:55:00','HH24:MI:SS'), 125, 'Male', 37, 'Clothing', 4, 700, 1600, 2800)
    INTO retail_sales VALUES (26, DATE '2022-07-03', TO_DATE('11:05:00','HH24:MI:SS'), 126, 'Female', 33, 'Electronics', 2, 2100, 3200, 4200)
    INTO retail_sales VALUES (27, DATE '2022-07-11', TO_DATE('14:20:00','HH24:MI:SS'), 127, 'Male', 29, 'Beauty', 5, 250, 1000, 1250)
    INTO retail_sales VALUES (28, DATE '2022-07-18', TO_DATE('16:45:00','HH24:MI:SS'), 128, 'Female', 41, 'Clothing', 6, 480, 2000, 2880)
    INTO retail_sales VALUES (29, DATE '2022-07-25', TO_DATE('20:25:00','HH24:MI:SS'), 129, 'Male', 35, 'Electronics', 1, 2800, 2000, 2800)
    INTO retail_sales VALUES (30, DATE '2022-07-30', TO_DATE('10:15:00','HH24:MI:SS'), 130, 'Female', 28, 'Beauty', 3, 400, 900, 1200)
    INTO retail_sales VALUES (31, DATE '2022-08-04', TO_DATE('11:55:00','HH24:MI:SS'), 131, 'Male', 32, 'Clothing', 2, 600, 1000, 1200)
    INTO retail_sales VALUES (32, DATE '2022-08-12', TO_DATE('15:30:00','HH24:MI:SS'), 132, 'Female', 36, 'Electronics', 2, 1950, 2700, 3900)
    INTO retail_sales VALUES (33, DATE '2022-08-18', TO_DATE('18:10:00','HH24:MI:SS'), 133, 'Male', 42, 'Beauty', 4, 300, 700, 1200)
    INTO retail_sales VALUES (34, DATE '2022-08-23', TO_DATE('20:40:00','HH24:MI:SS'), 134, 'Female', 27, 'Clothing', 5, 420, 1500, 2100)
    INTO retail_sales VALUES (35, DATE '2022-08-30', TO_DATE('09:35:00','HH24:MI:SS'), 135, 'Male', 30, 'Electronics', 1, 2500, 2200, 2500)
    INTO retail_sales VALUES (36, DATE '2022-09-05', TO_DATE('10:50:00','HH24:MI:SS'), 136, 'Female', 38, 'Beauty', 6, 200, 1000, 1200)
    INTO retail_sales VALUES (37, DATE '2022-09-11', TO_DATE('12:20:00','HH24:MI:SS'), 137, 'Male', 26, 'Clothing', 3, 650, 1500, 1950)
    INTO retail_sales VALUES (38, DATE '2022-09-18', TO_DATE('14:45:00','HH24:MI:SS'), 138, 'Female', 31, 'Electronics', 2, 2200, 3100, 4400)
    INTO retail_sales VALUES (39, DATE '2022-09-25', TO_DATE('19:10:00','HH24:MI:SS'), 139, 'Male', 29, 'Beauty', 2, 550, 800, 1100)
    INTO retail_sales VALUES (40, DATE '2022-09-30', TO_DATE('09:10:00','HH24:MI:SS'), 140, 'Female', 34, 'Clothing', 4, 500, 1600, 2000)
    INTO retail_sales VALUES (41, DATE '2022-10-06', TO_DATE('11:25:00','HH24:MI:SS'), 141, 'Male', 28, 'Electronics', 1, 3000, 2100, 3000)
    INTO retail_sales VALUES (42, DATE '2022-10-12', TO_DATE('16:30:00','HH24:MI:SS'), 142, 'Female', 35, 'Beauty', 5, 250, 1100, 1250)
    INTO retail_sales VALUES (43, DATE '2022-10-19', TO_DATE('18:55:00','HH24:MI:SS'), 143, 'Male', 40, 'Clothing', 6, 400, 1900, 2400)
    INTO retail_sales VALUES (44, DATE '2022-10-24', TO_DATE('20:50:00','HH24:MI:SS'), 144, 'Female', 27, 'Electronics', 2, 2600, 3500, 5200)
    INTO retail_sales VALUES (45, DATE '2022-10-30', TO_DATE('09:45:00','HH24:MI:SS'), 145, 'Male', 33, 'Beauty', 3, 320, 900, 960)
    INTO retail_sales VALUES (46, DATE '2022-11-05', TO_DATE('10:20:00','HH24:MI:SS'), 146, 'Female', 31, 'Clothing', 4, 580, 1500, 2320)
    INTO retail_sales VALUES (47, DATE '2022-11-10', TO_DATE('13:35:00','HH24:MI:SS'), 147, 'Male', 39, 'Electronics', 1, 2700, 2000, 2700)
    INTO retail_sales VALUES (48, DATE '2022-11-15', TO_DATE('15:55:00','HH24:MI:SS'), 148, 'Female', 28, 'Beauty', 2, 500, 800, 1000)
    INTO retail_sales VALUES (49, DATE '2022-11-20', TO_DATE('18:25:00','HH24:MI:SS'), 149, 'Male', 36, 'Clothing', 5, 450, 1600, 2250)
    INTO retail_sales VALUES (50, DATE '2022-11-28', TO_DATE('20:40:00','HH24:MI:SS'), 150, 'Female', 30, 'Electronics', 2, 2400, 3000, 4800)
SELECT * FROM dual;

COMMIT;
-------------------------------------------------
-- 4. Data Cleaning
-------------------------------------------------
-- Check for nulls in important fields
SELECT * FROM retail_sales
WHERE transaction_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

-- Remove bad rows if any
DELETE FROM retail_sales
WHERE transaction_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

COMMIT;
-------------------------------------------------
-- 5. Data Exploration
-------------------------------------------------
-- How many sales?
SELECT COUNT(*) AS total_sales FROM retail_sales;

-- Unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM retail_sales;

-- Distinct categories
SELECT DISTINCT category FROM retail_sales;
-------------------------------------------------
-- 6. Business Analysis Queries
-------------------------------------------------

-- Q1. Sales on 2022-11-05
SELECT * FROM retail_sales
WHERE sale_date = DATE '2022-11-05';

-- Q2. Clothing sales >4 qty in Nov-2022
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND TO_CHAR(sale_date,'YYYY-MM') = '2022-11'
  AND quantity > 4;

-- Q3. Total sales per category
SELECT category, SUM(total_sale) AS net_sales, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;
-- Q4. Avg age of Beauty customers
SELECT ROUND(AVG(age),2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q5. Transactions >1000
SELECT * FROM retail_sales
WHERE total_sale > 1000;

-- Q6. Transactions by gender & category
SELECT category, gender, COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY category;
-- Q7. Avg sale per month, best month per year
SELECT year, month, avg_sale
FROM (
   SELECT EXTRACT(YEAR FROM sale_date) AS year,
          EXTRACT(MONTH FROM sale_date) AS month,
          AVG(total_sale) AS avg_sale,
          RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rnk
   FROM retail_sales
   GROUP BY EXTRACT(YEAR FROM sale_date), EXTRACT(MONTH FROM sale_date)
)
WHERE rnk = 1;
-- Q8. Top 5 customers by sales
SELECT *
FROM (
    SELECT customer_id, SUM(total_sale) AS total_sales
    FROM retail_sales
    GROUP BY customer_id
    ORDER BY total_sales DESC
)
WHERE ROWNUM <= 5;
-- Q9. Unique customers per category
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Q10. Shifts by orders

WITH hourly_sales AS (
  SELECT rs.*,
         CASE
           WHEN TO_NUMBER(TO_CHAR(rs.sale_time,'HH24')) < 12 THEN 'Morning'
           WHEN TO_NUMBER(TO_CHAR(rs.sale_time,'HH24')) BETWEEN 12 AND 17 THEN 'Afternoon'
           ELSE 'Evening'
         END AS shift
  FROM retail_sales rs
)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sales
GROUP BY shift
ORDER BY shift;
-------------------------------------------------
-- ✅ End of Project
-------------------------------------------------



