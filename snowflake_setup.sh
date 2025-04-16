#!/bin/bash

# Step 1: Install the Snowflake connector
echo "Installing Snowflake connector..."
pip install --quiet snowflake-connector-python

# Step 2: Create a temporary Python script to connect and query Snowflake
cat <<EOF > snowflake_connect.py
import snowflake.connector

# Replace with your actual credentials
conn = snowflake.connector.connect(
    user='bharathc',
    password='Snowflake@12345',
    account='VFQTPWE-QF45178',
    warehouse='COMPUTE_wH',
    database='SNOWFLAKE_PRACTICE',
    schema='SNOWFLAKE'
)

print("✅ Connected to Snowflake")

# Optional: Run a query
try:
    cur = conn.cursor()
    cur.execute("SELECT CURRENT_VERSION()")
    for row in cur:
        print("Snowflake version:", row[0])
finally:
    cur.close()
    conn.close()
EOF

# Step 3: Run the Python script
echo "Connecting to Snowflake and running query..."
python3 snowflake_connect.py

# Step 4: Clean up (optional)
rm snowflake_connect.py