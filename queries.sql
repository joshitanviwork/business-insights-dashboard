-- =====================================================
-- Business Insights & Sales Performance Analysis
-- Tool: SQL | Author: Tanvi Joshi
-- Dataset: Synthetic retail sales data
-- =====================================================


-- Query 1: Total Revenue, Orders, and Customers (KPI Overview)
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_name) AS total_customers,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data;


-- Query 2: Revenue by Region
SELECT 
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) * 100.0 / SUM(SUM(revenue)) OVER (), 1) AS revenue_share_pct
FROM sales_data
GROUP BY region
ORDER BY total_revenue DESC;


-- Query 3: Monthly Revenue Trend
SELECT 
    FORMAT(order_date, 'yyyy-MM') AS month,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM sales_data
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;


-- Query 4: Top 5 Customers by Revenue
SELECT TOP 5
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data
GROUP BY customer_name
ORDER BY total_revenue DESC;


-- Query 5: Revenue by Product Category
SELECT 
    product_category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) * 100.0 / SUM(SUM(revenue)) OVER (), 1) AS revenue_share_pct
FROM sales_data
GROUP BY product_category
ORDER BY total_revenue DESC;