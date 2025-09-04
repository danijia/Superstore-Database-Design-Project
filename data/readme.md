# Data Folder

This folder contains both the original and pre-processed data used in the Superstore SQL project.

## Contents

| File Name             | Description                                                   |
|-----------------------|---------------------------------------------------------------|
|`superstore.csv`       | Flat dataset containing superstore data                       |
| `customers.csv`       | Cleaned table containing unique customer data.                |
| `orders.csv`          | Cleaned table containing order-level information.             |
| `order_items.csv`     | Line-item level transactions (one row per product per order). |
| `products.csv`        | Unique product-level data including category hierarchy.       |


## Data Source

The original dataset was downloaded from:
- Kaggle Superstore Dataset  
- [Link](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)


## Data Cleaning Notes

The raw data was processed using Python scripts found in the `data_preprocessing/` directory:
- `clean_customers.py`
- `clean_orders.py`
- `clean_order_items.py`
- `clean_products.py`

Steps included:
- Removing duplicates
- Splitting the flat dataset into normalized tables
- Converting date formats
- Standardizing column names


## Notes

- The `superstore.csv` is kept for reference only. All analysis uses the cleaned, separated CSVs.
- All fields such as `Sales`, `Quantity`, `Profit`, and `Discount` reflect transactional-level values.
- Discounts are stored as decimals (e.g., `0.2` for 20%).

