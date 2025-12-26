## Silver Layer

- Storage: AWS S3
- Format: CSV
- Purpose: Cleaned and validated data

### Transformations
- Removed duplicates
- Standardized transaction types
- Filtered invalid amounts

### S3 Paths
- s3://end-to-end-banking-data-pipeline/silver/cleaned_customers/
- s3://end-to-end-banking-data-pipeline/silver/cleaned_accounts/
- s3://end-to-end-banking-data-pipeline/silver/cleaned_transactions/
