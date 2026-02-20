# Power BI Dashboard Layout (E-commerce Sales Analytics)

## Data Model
Import these CSVs:
- orders.csv
- order_items.csv
- products.csv
- customers.csv
- returns.csv

### Relationships
- orders[order_id] 1 → * order_items[order_id]
- products[product_id] 1 → * order_items[product_id]
- customers[customer_id] 1 → * orders[customer_id]
- returns[order_id] * → 1 orders[order_id] (left join behavior)

---

## Page 1: Executive Summary
### KPIs (Cards)
- Total Sales
- Total Profit
- Profit Margin %
- Total Orders
- AOV

### Charts
- Line chart: Month vs Total Sales + Total Profit
- Bar chart: Sales by Category
- Donut: Segment-wise Sales
- Map / Filled map: Sales by State

Slicers:
- Date (order_date)
- Region
- Category
- Segment

---

## Page 2: Product Analysis
Visuals:
- Top 10 Products (bar): Sales
- Top 10 Products (bar): Profit
- Matrix: Category > Sub-category with Sales/Profit/Profit%
- Scatter: Sales vs Profit by Sub-category (size = Quantity)

Slicers:
- Category
- Sub-category
- Region

---

## Page 3: Customer & Region
Visuals:
- Bar: Sales by Region
- Bar: Profit by Region
- Table: Top 20 Customers by Sales (with Orders count)
- Donut: Payment Method split
- Line: Monthly Orders trend

---

## Page 4: Returns
Visuals:
- Card: Returned Orders
- Card: Return Rate %
- Bar: Return Reason counts
- Bar: Returned Orders by Category (use product relationship)