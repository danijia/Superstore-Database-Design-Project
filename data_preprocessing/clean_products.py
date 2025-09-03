import pandas as pd

df = pd.read_csv("superstore.csv", encoding="latin1")

#selects only the neccessary columns
df_clean = df [["Product ID", "Category", "Sub-Category", "Product Name"]].copy()

# rename columns to match your database table
df_clean.columns = ["product_id", "category", "sub-category", "product_name"]


# Remove duplicates based on product_id
df_clean = df_clean.drop_duplicates(subset="product_id")

# Remove extra spaces from strings (just in case)
df_clean = df_clean.apply(lambda x: x.str.strip() if x.dtype == "object" else x)

# Save to new clean CSV
df_clean.to_csv("cleaned_products.csv", index=False)

print("Done! Clean file saved as cleaned_products.csv")

# check everything is working: 
print("Original row count:", len(df))
print("After cleaning:", len(df_clean))
print("Unique product_ids:", df_clean['product_id'].nunique())
