import pandas as pd
from sqlalchemy import create_engine

# Step 1: Load CSV into a pandas DataFrame
csv_file_path = 'PATH_TO_YOUR_CSV/Marketing.csv'  # Replace with your relative or absolute path
df = pd.read_csv(csv_file_path)

# Step 2: Convert date column to datetime format
df['c_date'] = pd.to_datetime(df['c_date'], format='%m/%d/%y')

# Step 3: Create a connection to PostgreSQL
# Format: 'postgresql://username:password@localhost:port/dbname'
DATABASE_URL = 'postgresql://username:password@localhost:5432/database_name'  # Replace with your credentials
engine = create_engine(DATABASE_URL)

# Step 4: Load the data into PostgreSQL (table must already exist)
df.to_sql('marketing', engine, if_exists='append', index=False)

print("✅ Data successfully loaded into PostgreSQL!")
