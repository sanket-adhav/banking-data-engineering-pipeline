SELECT
  account_id,
  amount,
  transaction_date
FROM workspace.banking_data.high_value_transactions
ORDER BY amount DESC;
