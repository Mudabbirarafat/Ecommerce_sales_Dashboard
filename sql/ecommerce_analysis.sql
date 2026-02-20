-- E-commerce Sales Analytics (SQL Queries)
-- Works with PostgreSQL / MySQL (small syntax adjustments may be needed)

-- 1) Total KPIs
SELECT
  ROUND(SUM(oi.sales),2) AS total_sales,
  ROUND(SUM(oi.profit),2) AS total_profit,
  ROUND(100.0 * SUM(oi.profit) / NULLIF(SUM(oi.sales),0),2) AS profit_margin_pct,
  COUNT(DISTINCT o.order_id) AS total_orders,
  ROUND(SUM(oi.sales) / NULLIF(COUNT(DISTINCT o.order_id),0),2) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id;


-- 2) Monthly Sales Trend
SELECT
  DATE_TRUNC('month', o.order_date) AS month,
  ROUND(SUM(oi.sales),2) AS sales,
  ROUND(SUM(oi.profit),2) AS profit
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 1
ORDER BY 1;


-- 3) Sales by Category
SELECT
  p.category,
  ROUND(SUM(oi.sales),2) AS sales,
  ROUND(SUM(oi.profit),2) AS profit
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY 1
ORDER BY sales DESC;


-- 4) Top 10 Products
SELECT
  p.product_name,
  p.category,
  ROUND(SUM(oi.sales),2) AS sales,
  ROUND(SUM(oi.profit),2) AS profit,
  SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY 1,2
ORDER BY sales DESC
LIMIT 10;


-- 5) Customer Segment Performance
SELECT
  c.segment,
  ROUND(SUM(oi.sales),2) AS sales,
  ROUND(SUM(oi.profit),2) AS profit,
  COUNT(DISTINCT o.order_id) AS orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 1
ORDER BY sales DESC;


-- 6) Sales by Region/State
SELECT
  o.region,
  o.state,
  ROUND(SUM(oi.sales),2) AS sales,
  ROUND(SUM(oi.profit),2) AS profit
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 1,2
ORDER BY sales DESC;


-- 7) Returns Analysis (Return Rate)
SELECT
  ROUND(100.0 * COUNT(DISTINCT r.order_id) / NULLIF(COUNT(DISTINCT o.order_id),0), 2) AS return_rate_pct
FROM orders o
LEFT JOIN returns r ON o.order_id = r.order_id;


-- 8) Return Reasons
SELECT
  r.return_reason,
  COUNT(*) AS returns_count
FROM returns r
GROUP BY 1
ORDER BY returns_count DESC;