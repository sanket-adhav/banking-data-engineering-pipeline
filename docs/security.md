# Security

- AWS IAM Roles are used for secure access
- Databricks cluster is attached to IAM role
- No AWS access keys are stored in code
- S3 permissions are restricted to required paths only

This ensures secure access without exposing credentials.
