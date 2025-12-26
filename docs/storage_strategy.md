# Storage Strategy

All data in this project is stored in AWS S3 as CSV files.

## Layer-wise Storage

- Bronze Layer: Raw CSV files
- Silver Layer: Cleaned CSV files
- Gold Layer: Aggregated CSV files

## Why CSV

- Simple and easy to understand
- Suitable for learning and demonstration
- Easy to migrate to Parquet or Delta in future

Databricks is used only for processing and querying.
No data is stored inside Databricks itself.
