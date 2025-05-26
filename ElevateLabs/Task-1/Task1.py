import pandas as pd

# Load dataset
df = pd.read_csv("Mall_Customers.csv")

# 1. View the data
print(df.head())
print(df.info())

# 2. Check and handle missing values
print(df.isnull().sum())
df = df.dropna()  # OR df.fillna(value)

# 3. Remove duplicates
df = df.drop_duplicates()

# 4. Standardize text data
df['Gender'] = df['Gender'].str.lower().str.strip()

# 5. Rename columns to clean format
df.columns = df.columns.str.lower().str.replace(' ', '_')

# 6. Check data types
print(df.dtypes)
# For example: Ensure age is int
df['age'] = df['age'].astype(int)

# Save cleaned dataset
df.to_csv("cleaned_mall_customers.csv", index=False)
