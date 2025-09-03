import pandas as pd
from datetime import datetime

df = pd.read_csv("superstore.csv", encoding="latin1")

#selects only the neccessary columns
df_clean = df [["Order ID", "Order Date", "Ship Date", "Ship Mode", "Customer ID", "Country", "City", "State", "Postal Code", "Region"]].copy()

# rename columns to match your database table
df_clean.columns = ["order_id", "order_date", "ship_date", "ship_mode", "customer_id", "country", "city", "state", "postal_code", "region"]


# Remove duplicates based on product_id
df_clean = df_clean.drop_duplicates(subset="order_id")

# Remove extra spaces from strings (just in case)
df_clean = df_clean.apply(lambda x: x.str.strip() if x.dtype == "object" else x)

# Convert 'order_date' and 'ship_date' to ISO 8601 format YYYY-MM-DD
df_clean['order_date'] = pd.to_datetime(df_clean['order_date'], errors='coerce').dt.strftime('%Y-%m-%d')
df_clean['ship_date'] = pd.to_datetime(df_clean['ship_date'], errors='coerce').dt.strftime('%Y-%m-%d')

# Save to new clean CSV
df_clean.to_csv("cleaned_orders.csv", index=False)

print("Done! Clean file saved as cleaned_orders.csv")
