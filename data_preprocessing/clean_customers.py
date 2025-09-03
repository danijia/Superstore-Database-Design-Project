import pandas as pd

df = pd.read_csv("superstore.csv", encoding="latin1")

#selects only the neccessary columns
df_clean = df [["Customer ID", "Customer Name", "Segment"]].copy()

# rename columns to match your database table
df_clean.columns = ["customer_id", "customer_name", "segment"]


# Remove duplicates based on product_id
df_clean = df_clean.drop_duplicates(subset="customer_id")

# Remove extra spaces from strings (just in case)
df_clean = df_clean.apply(lambda x: x.str.strip() if x.dtype == "object" else x)


# Save to new clean CSV
df_clean.to_csv("cleaned_customers.csv", index=False)

print("Done! Clean file saved as cleaned_customers.csv")
