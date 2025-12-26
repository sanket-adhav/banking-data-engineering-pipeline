# Data Validation

Basic SQL-based validations are applied after pipeline execution.

## Validation Checks

- Bronze vs Silver record counts
- Duplicate transaction checks
- Null key checks
- Invalid amount checks
- Business rule validation for high value transactions

Validation queries are stored in sql/validation_queries.sql.
