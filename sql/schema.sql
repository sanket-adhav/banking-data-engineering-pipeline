-- CREATE DATABASES

CREATE DATABASE IF NOT EXISTS bronze;
CREATE DATABASE IF NOT EXISTS silver;
CREATE DATABASE IF NOT EXISTS gold;

-- BRONZE LAYER (RAW CSV FILES IN S3)

CREATE TABLE IF NOT EXISTS bronze.raw_transactions (
    txn_id STRING,
    account_id STRING,
    customer_id STRING,
    transaction_date DATE,
    amount DOUBLE,
    txn_type STRING
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/bronze/raw_transactions/';

CREATE TABLE IF NOT EXISTS bronze.raw_accounts (
    account_id STRING,
    customer_id STRING,
    balance DOUBLE,
    status STRING
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/bronze/raw_accounts/';

CREATE TABLE IF NOT EXISTS bronze.raw_customers (
    customer_id STRING,
    customer_name STRING,
    branch STRING,
    kyc_status STRING
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/bronze/raw_customers/';

-- SILVER LAYER (CLEANED CSV FILES IN S3)

CREATE TABLE IF NOT EXISTS silver.cleaned_transactions (
    txn_id STRING,
    account_id STRING,
    customer_id STRING,
    transaction_date DATE,
    amount DOUBLE,
    txn_type STRING
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/silver/cleaned_transactions/';

CREATE TABLE IF NOT EXISTS silver.cleaned_accounts (
    account_id STRING,
    customer_id STRING,
    balance DOUBLE,
    status STRING
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/silver/cleaned_accounts/';

CREATE TABLE IF NOT EXISTS silver.cleaned_customers (
    customer_id STRING,
    customer_name STRING,
    branch STRING,
    kyc_status STRING
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/silver/cleaned_customers/';

-- GOLD LAYER (BUSINESS OUTPUTS AS CSV IN S3)


CREATE TABLE IF NOT EXISTS gold.total_transaction_amount_per_day (
    transaction_date DATE,
    total_amount DOUBLE
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/gold/total_transaction_amount_per_day/';

CREATE TABLE IF NOT EXISTS gold.high_value_transactions (
    txn_id STRING,
    account_id STRING,
    transaction_date DATE,
    amount DOUBLE
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/gold/high_value_transactions/';

CREATE TABLE IF NOT EXISTS gold.dormant_accounts (
    account_id STRING,
    last_transaction_date DATE
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/gold/dormant_accounts/';

CREATE TABLE IF NOT EXISTS gold.total_balance_per_customer (
    customer_id STRING,
    total_balance DOUBLE
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/gold/total_balance_per_customer/';

CREATE TABLE IF NOT EXISTS gold.account_transaction_count (
    account_id STRING,
    transaction_count INT
)
USING CSV
OPTIONS (
  header = "true",
  inferSchema = "true"
)
LOCATION 's3://end-to-end-banking-data-pipeline/gold/account_transaction_count/';
