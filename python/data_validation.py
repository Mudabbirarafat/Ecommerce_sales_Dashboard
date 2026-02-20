"""E-commerce Sales Dashboard - Data Validation Script
This script is optional but helps your resume because it shows Python usage.
"""

import pandas as pd

DATA_DIR = "../data"

orders = pd.read_csv(f"{DATA_DIR}/orders.csv", parse_dates=["order_date"])
items = pd.read_csv(f"{DATA_DIR}/order_items.csv")
products = pd.read_csv(f"{DATA_DIR}/products.csv")
customers = pd.read_csv(f"{DATA_DIR}/customers.csv")
returns = pd.read_csv(f"{DATA_DIR}/returns.csv")

# Basic checks
assert orders["order_id"].is_unique
assert items["order_id"].isin(orders["order_id"]).all()
assert items["product_id"].isin(products["product_id"]).all()
assert orders["customer_id"].isin(customers["customer_id"]).all()

# KPIs quick compute
total_sales = items["sales"].sum()
total_profit = items["profit"].sum()
orders_count = orders["order_id"].nunique()
aov = total_sales / orders_count

print("Total Sales:", round(total_sales, 2))
print("Total Profit:", round(total_profit, 2))
print("Total Orders:", orders_count)
print("AOV:", round(aov, 2))

# Return Rate
returned_orders = returns["order_id"].nunique()
return_rate = returned_orders / orders_count
print("Returned Orders:", returned_orders)
print("Return Rate:", round(100*return_rate, 2), "%")