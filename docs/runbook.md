# Runbook

## How to Run the Pipeline

1. Upload source CSV files to S3
2. Run Databricks bronze notebook
3. Run Databricks silver notebook
4. Run Databricks gold notebook
5. Execute validation queries
6. Refresh Databricks dashboards

## Failure Handling

- Jobs can be safely re-run
- Duplicate records are handled in silver layer
- Gold outputs are recalculated from clean data
