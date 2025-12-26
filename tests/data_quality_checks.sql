-- record count check between layers
SELECT
  (SELECT COUNT(*) FROM bronze.raw_transactions)  AS bronze_txn_count,
  (SELECT COUNT(*) FROM silver.cleaned_transactions) AS silver_txn_count,
  (SELECT COUNT(*) FROM gold.total_transaction_amount_per_day) AS gold_day_count;

-- duplicate transaction id check
SELECT
  txn_id,
  COUNT(*) AS cnt
FROM silver.cleaned_transactions
GROUP BY txn_id
HAVING COUNT(*) > 1;

-- null check on important columns
SELECT *
FROM silver.cleaned_transactions
WHERE txn_id IS NULL
   OR account_id IS NULL
   OR customer_id IS NULL
   OR transaction_date IS NULL;

-- invalid amount check
SELECT *
FROM silver.cleaned_transactions
WHERE amount <= 0;

-- transaction type domain check
SELECT DISTINCT txn_type
FROM silver.cleaned_transactions;

-- account balance check
SELECT *
FROM silver.cleaned_accounts
WHERE balance < 0;

-- customer id null check
SELECT *
FROM silver.cleaned_customers
WHERE customer_id IS NULL;

-- high value transaction threshold check
SELECT *
FROM gold.high_value_transactions
WHERE amount <= 100000;

-- dormant account logic check
SELECT d.account_id
FROM gold.dormant_accounts d
JOIN silver.cleaned_transactions t
  ON d.account_id = t.account_id
WHERE t.transaction_date >= date_sub(current_date(), 90);

-- gold data availability check
SELECT COUNT(*) AS gold_records
FROM gold.total_balance_per_customer;
