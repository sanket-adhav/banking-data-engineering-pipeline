-- bronze vs silver transaction count
SELECT
  (SELECT COUNT(*) FROM bronze.raw_transactions) AS bronze_count,
  (SELECT COUNT(*) FROM silver.cleaned_transactions) AS silver_count;

-- duplicate transactions check
SELECT
  txn_id,
  COUNT(*) AS cnt
FROM silver.cleaned_transactions
GROUP BY txn_id
HAVING COUNT(*) > 1;

-- null key check in silver transactions
SELECT *
FROM silver.cleaned_transactions
WHERE txn_id IS NULL
   OR account_id IS NULL
   OR customer_id IS NULL;

-- invalid amount check
SELECT *
FROM silver.cleaned_transactions
WHERE amount <= 0;

-- transaction type check
SELECT DISTINCT txn_type
FROM silver.cleaned_transactions;

-- high value transaction rule check
SELECT *
FROM gold.high_value_transactions
WHERE amount <= 100000;

-- dormant account sanity check
SELECT d.account_id
FROM gold.dormant_accounts d
JOIN silver.cleaned_transactions t
  ON d.account_id = t.account_id
WHERE t.transaction_date >= date_sub(current_date(), 90);

-- gold table data availability check
SELECT COUNT(*) AS total_records
FROM gold.total_transaction_amount_per_day;
