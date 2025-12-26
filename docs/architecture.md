# Banking Data Engineering Architecture

This project implements an end-to-end banking data pipeline using AWS S3 and Databricks.

## High-Level Flow

Source CSV Files (S3)
→ Bronze Layer (Raw CSV)
→ Silver Layer (Cleaned CSV)
→ Gold Layer (Aggregated CSV)
→ Databricks SQL Dashboards

## Technology Used

- AWS S3 for storage
- Databricks for Spark processing
- Databricks SQL for analytics dashboards
- AWS IAM Roles for secure access

## Design Principles

- Layered architecture (Bronze / Silver / Gold)
- Incremental processing for transactions
- Separation of storage and compute
- Simple and scalable design
