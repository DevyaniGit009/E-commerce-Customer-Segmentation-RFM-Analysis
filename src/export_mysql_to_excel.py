
import pandas as pd
from sqlalchemy import create_engine, URL

# MySQL connection
connection_url = URL.create(
    drivername="mysql+pymysql",
    username="root",
    password="Devyani@999",
    host="localhost",
    port=3306,
    database="ecommerce_rfm"
)

engine = create_engine(connection_url)

# MySQL tables and Excel sheet names
tables = {
    "retail_transactions": "Transactions",
    "customer_rfm": "Customer_RFM",
    "customer_rfm_ml": "Customer_RFM_ML",
    "ml_cluster_profile": "ML_Cluster_Profile",
    "segment_summary": "Segment_Summary",
    "rfm_ml_comparison": "RFM_ML_Comparison"
}

# Output Excel file
output_file = "powerbi/ecommerce_rfm_powerbi.xlsx"

with pd.ExcelWriter(output_file, engine="openpyxl") as writer:

    for table, sheet in tables.items():

        print(f"Exporting {table}...")

        df = pd.read_sql(
            f"SELECT * FROM `{table}`",
            engine
        )

        df.to_excel(
            writer,
            sheet_name=sheet,
            index=False
        )

        print(f"{table}: {len(df):,} rows exported")

engine.dispose()

print("\nAll six tables exported successfully!")
print("Excel file:", output_file)
