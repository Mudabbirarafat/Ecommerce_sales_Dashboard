# E-commerce Sales Analytics Dashboard (SQL + Power BI)

This is a complete **Data Analyst portfolio project** demonstrating an end-to-end workflow:
- Raw data → Cleaning/Modeling → SQL Analysis → Power BI Dashboard → Business Insights

## Project Overview
**Goal:** Build an executive dashboard that tracks:
- Revenue, Profit, Profit Margin %
- Orders, Average Order Value (AOV)
- Category & product performance
- Customer segmentation
- Regional performance
- Returns analysis

## Tools Used
- **SQL** (KPI queries + analysis)
- **Power BI** (dashboard + DAX measures)
- **Excel/Python** (data exploration & validation)

## Folder Structure
```
Ecommerce_Sales_Dashboard_Project/
├── data/                  # CSV datasets
├── sql/                   # SQL queries for analysis
├── powerbi/               # DAX measures + dashboard layout
├── python/                # optional python cleaning/eda script
└── docs/                  # project summary + resume bullets
```

## Data Tables
- `orders.csv` (order header)
- `order_items.csv` (line items)
- `products.csv`
- `customers.csv`
- `returns.csv` (some orders returned)

## Power BI Dashboard Pages
1. **Executive Summary**
   - Cards: Total Sales, Total Profit, Profit Margin, Orders, AOV
   - Line chart: Monthly Sales & Profit
   - Bar chart: Sales by Category
2. **Product Analysis**
   - Top 10 Products by Sales & Profit
   - Sub-category performance
3. **Customer & Region**
   - Sales by Region/State
   - Segment-wise Sales/Profit
4. **Returns**
   - Return Rate
   - Return Reasons

## How to Run
1) Import CSVs from `/data` into Power BI
2) Create relationships:
   - orders[order_id] → order_items[order_id]
   - products[product_id] → order_items[product_id]
   - customers[customer_id] → orders[customer_id]
   - returns[order_id] → orders[order_id] (left join)
3) Copy measures from `/powerbi/dax_measures.txt`
4) Build visuals using `/powerbi/dashboard_layout.md`

## Author
Mohd Mudabbir Arafat
