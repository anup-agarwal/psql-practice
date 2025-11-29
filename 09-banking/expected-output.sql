-- =====================================
-- BANKING DATASET — EXPECTED OUTPUT SUMMARY
-- =====================================

-- Q1. List all customers with their city and KYC status.
-- customer_id | customer_name | city      | kyc_status
-- ------------ | ------------- | --------- | -----------
-- 1            | Rajesh Kumar  | Delhi     | verified
-- 2            | Priya Sharma  | Mumbai    | verified
-- 3            | Amit Patel    | Bangalore | verified
-- 4            | Sneha Reddy   | Chennai   | pending
-- 5            | Vikram Singh  | Delhi     | verified
-- 6            | Anjali Mehta  | Pune      | rejected


-- Q2. List all accounts with customer name, branch name, and account type.
-- account_id | account_number | customer_name | branch_name            | account_type
-- ---------- | -------------- | ------------- | ---------------------- | -------------
-- 1          | ACC001         | Rajesh Kumar  | Connaught Place Branch | savings
-- 2          | ACC002         | Priya Sharma  | Marine Drive Branch   | savings
-- 3          | ACC003         | Rajesh Kumar  | Connaught Place Branch | current
-- 4          | ACC004         | Amit Patel    | MG Road Branch        | savings
-- 5          | ACC005         | Sneha Reddy   | T Nagar Branch        | savings
-- 6          | ACC006         | Vikram Singh  | Connaught Place Branch | fixed_deposit
-- 7          | ACC007         | Priya Sharma  | Marine Drive Branch   | current


-- Q3. List all transactions with account number, transaction type, amount, and description.
-- transaction_id | account_number | transaction_type | amount    | description
-- -------------- | -------------- | ----------------- | --------- | -------------------
-- 1              | ACC001         | deposit           | 50000.00  | Initial deposit
-- 2              | ACC002         | deposit           | 75000.00  | Initial deposit
-- 3              | ACC001         | deposit           | 100000.00 | Account opening
-- 4              | ACC003         | deposit           | 120000.00 | Initial deposit
-- 5              | ACC001         | withdrawal        | 50000.00  | ATM withdrawal
-- 6              | ACC001         | withdrawal        | 50000.00  | Transfer to ACC003
-- 7              | ACC003         | deposit           | 50000.00  | Transfer from ACC001
-- 8              | ACC004         | deposit           | 30000.00  | Initial deposit
-- 9              | ACC005         | deposit           | 15000.00  | Initial deposit
-- 10             | ACC006         | deposit           | 200000.00 | FD opening
-- 11             | ACC007         | deposit           | 50000.00  | Initial deposit
-- 12             | ACC002         | withdrawal        | 10000.00  | ATM withdrawal
-- 13             | ACC001         | interest          | 500.00    | Monthly interest
-- 14             | ACC002         | interest          | 750.00    | Monthly interest


-- Q4. For each branch, show how many accounts belong to it.
-- branch_id | branch_name            | account_count
-- --------- | ---------------------- | --------------
-- 1         | Connaught Place Branch | 3
-- 2         | Marine Drive Branch   | 2
-- 3         | MG Road Branch        | 1
-- 4         | T Nagar Branch        | 1


-- Q5. For each account type, show how many accounts exist.
-- account_type    | account_count
-- --------------- | --------------
-- savings         | 4
-- current         | 2
-- fixed_deposit   | 1


-- Q6. List all accounts that are NOT active.
-- account_id | account_number | customer_name | status
-- ---------- | -------------- | ------------- | --------
-- 5          | ACC005         | Sneha Reddy   | frozen


-- Q7. List all customers who have NO accounts.
-- customer_id | customer_name
-- ------------ | -------------
-- 6            | Anjali Mehta


-- Q8. List all transactions of type 'withdrawal'.
-- transaction_id | account_number | amount    | description
-- -------------- | -------------- | --------- | -------------------
-- 5              | ACC001         | 50000.00  | ATM withdrawal
-- 6              | ACC001         | 50000.00  | Transfer to ACC003
-- 12             | ACC002         | 10000.00  | ATM withdrawal


-- Q9. For each customer, show total balance across all active accounts.
-- customer_id | customer_name | total_balance
-- ------------ | ------------- | --------------
-- 1            | Rajesh Kumar  | 170500.00
-- 2            | Priya Sharma  | 125750.00
-- 3            | Amit Patel    | 30000.00
-- 5            | Vikram Singh  | 200000.00


-- Q10. Show the TOP 3 accounts by balance.
-- account_id | account_number | customer_name | balance
-- ---------- | -------------- | ------------- | -----------
-- 6          | ACC006         | Vikram Singh  | 200000.00
-- 3          | ACC003         | Rajesh Kumar  | 170000.00
-- 2          | ACC002         | Priya Sharma  | 65750.00


-- Q11. List all transactions that occurred in March 2024.
-- transaction_id | account_number | transaction_type | amount    | transaction_date
-- -------------- | -------------- | ----------------- | --------- | -------------------
-- 10             | ACC006         | deposit           | 200000.00 | 2024-03-01 10:00:00
-- 12             | ACC002         | withdrawal        | 10000.00  | 2024-03-10 15:00:00
-- 13             | ACC001         | interest          | 500.00    | 2024-03-31 23:59:59
-- 14             | ACC002         | interest          | 750.00    | 2024-03-31 23:59:59


-- Q12. List all accounts with their customer name and current balance.
-- account_id | account_number | customer_name | balance
-- ---------- | -------------- | ------------- | -----------
-- 1          | ACC001         | Rajesh Kumar  | 50500.00
-- 2          | ACC002         | Priya Sharma  | 65750.00
-- 3          | ACC003         | Rajesh Kumar  | 170000.00
-- 4          | ACC004         | Amit Patel    | 30000.00
-- 5          | ACC005         | Sneha Reddy   | 15000.00
-- 6          | ACC006         | Vikram Singh  | 200000.00
-- 7          | ACC007         | Priya Sharma  | 50000.00


-- Q13. List all branches that have NO accounts.
-- branch_id | branch_name
-- --------- | ------------
-- (None - all branches have accounts)


-- Q14. For each account type, show the average balance.
-- account_type    | avg_balance
-- --------------- | -----------
-- savings         | 40281.25
-- current         | 110000.00
-- fixed_deposit   | 200000.00


-- Q15. List all customers whose KYC status is 'pending' or 'rejected'.
-- customer_id | customer_name | kyc_status
-- ------------ | ------------- | -----------
-- 4            | Sneha Reddy   | pending
-- 6            | Anjali Mehta  | rejected


-- Q16. Show all branches with total balance of all accounts.
-- branch_id | branch_name            | total_balance
-- --------- | ---------------------- | --------------
-- 1         | Connaught Place Branch | 420500.00
-- 2         | Marine Drive Branch   | 115750.00
-- 3         | MG Road Branch        | 30000.00
-- 4         | T Nagar Branch        | 15000.00


-- Q17. List all accounts that have transactions but have balance = 0.
-- account_id | account_number
-- ---------- | --------------
-- (None - no account has balance = 0)


-- Q18. For each customer, show total number of transactions across all accounts.
-- customer_id | customer_name | transaction_count
-- ------------ | ------------- | ------------------
-- 1            | Rajesh Kumar  | 5
-- 2            | Priya Sharma  | 3
-- 3            | Amit Patel    | 2
-- 4            | Sneha Reddy   | 1
-- 5            | Vikram Singh  | 1


-- Q19. List all customers who have accounts in 'Delhi' branches.
-- customer_id | customer_name
-- ------------ | -------------
-- 1            | Rajesh Kumar
-- 5            | Vikram Singh


-- Q20. Accounts with more than 3 transactions (using CTE).
-- account_id | account_number | transaction_count
-- ---------- | -------------- | ------------------
-- 1          | ACC001         | 5


-- Q21. List all accounts that have been involved in 'transfer' transactions.
-- account_id | account_number | customer_name
-- ---------- | -------------- | -------------
-- 1          | ACC001         | Rajesh Kumar
-- 3          | ACC003         | Rajesh Kumar


-- Q22. Show the branch with the highest total balance.
-- branch_id | branch_name            | total_balance
-- --------- | ---------------------- | --------------
-- 1         | Connaught Place Branch | 420500.00


-- Q23. List all customers who have accounts but have NEVER made any withdrawal.
-- customer_id | customer_name
-- ------------ | -------------
-- 3            | Amit Patel
-- 4            | Sneha Reddy
-- 5            | Vikram Singh


-- Q24. For each transaction type, show how many transactions are of that type.
-- transaction_type | transaction_count
-- ----------------- | ------------------
-- deposit           | 7
-- withdrawal        | 3
-- interest          | 2
-- transfer          | 0


-- Q25. List all accounts that are active but have NO transactions.
-- account_id | account_number
-- ---------- | --------------
-- (None - all active accounts have transactions)

