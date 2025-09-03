import pandas as pd

df = pd.read_csv("superstore.csv", encoding="latin1")

# selects only the neccessary columns
df_clean = df [["Row ID", "Order ID", "Product ID", "Sales", "Quantity", "Discount", "Profit"]].copy()

# rename columns to match your database table
df_clean.columns = ["row_id", "order_id", "product_id", "sales", "quantity", "discount", "profit"]


# Remove extra spaces from strings (just in case)
df_clean = df_clean.apply(lambda x: x.str.strip() if x.dtype == "object" else x)

# Save to new clean CSV
df_clean.to_csv("cleaned_order_items.csv", index=False)

print("Done! Clean file saved as cleaned_order_items.csv")
