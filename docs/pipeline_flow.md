# Pipeline Flow

## Step 1: Source to Bronze
- Source CSV files are stored in S3
- Data is ingested as-is into the bronze layer
- No transformation is applied

## Step 2: Bronze to Silver
- Duplicate records are removed
- Invalid and null values are filtered
- Transaction types are standardized
- Cleaned data is written back to S3 as CSV

## Step 3: Silver to Gold
- Business-level aggregations are created
- Daily totals and customer summaries are calculated
- Final outputs are stored as CSV in S3

## Step 4: Analytics
- External tables are created on gold CSV data
- Databricks SQL dashboards are built on top of gold tables
