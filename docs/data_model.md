# Data Model

## Core Entities

### Customer
- customer_id
- customer_name
- branch
- kyc_status

### Account
- account_id
- customer_id
- balance
- status

### Transaction
- txn_id
- account_id
- customer_id
- transaction_date
- amount
- txn_type

## Relationships

- One customer can have multiple accounts
- One account can have multiple transactions

## Gold Layer Outputs

- Total transaction amount per day
- High value transactions
- Dormant accounts
- Total balance per customer
- Account transaction count
