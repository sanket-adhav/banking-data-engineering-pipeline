-- Branch-wise transaction performance
SELECT
    branch,
    total_deposits,
    total_withdrawals,
    transaction_count
FROM workspace.banking_data.branch_performance
ORDER BY total_deposits DESC;
