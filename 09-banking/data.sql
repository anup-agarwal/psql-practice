-- Clean up if you re-run
DROP TABLE IF EXISTS transactions, accounts, customers, branches CASCADE;

-- Branches
CREATE TABLE branches (
  id SERIAL PRIMARY KEY,
  branch_code TEXT UNIQUE NOT NULL,
  branch_name TEXT NOT NULL,
  city TEXT NOT NULL,
  address TEXT,
  phone TEXT
);

-- Customers
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  phone TEXT,
  date_of_birth DATE,
  city TEXT,
  account_opened_date DATE NOT NULL,
  kyc_status TEXT DEFAULT 'pending'  -- pending / verified / rejected
);

-- Accounts
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  account_number TEXT UNIQUE NOT NULL,
  customer_id INT REFERENCES customers(id),
  branch_id INT REFERENCES branches(id),
  account_type TEXT,  -- savings / current / fixed_deposit
  balance NUMERIC(15,2) DEFAULT 0,
  opened_date DATE NOT NULL,
  status TEXT DEFAULT 'active'  -- active / closed / frozen
);

-- Transactions
CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  account_id INT REFERENCES accounts(id),
  transaction_type TEXT,  -- deposit / withdrawal / transfer / interest
  amount NUMERIC(15,2) NOT NULL,
  transaction_date TIMESTAMP NOT NULL,
  description TEXT,
  balance_after NUMERIC(15,2)
);

--------------------------------------------------
-- Seed Data
--------------------------------------------------

-- Branches
INSERT INTO branches (id, branch_code, branch_name, city, address, phone) VALUES
  (1, 'DL001', 'Connaught Place Branch', 'Delhi', 'Connaught Place', '011-12345678'),
  (2, 'MU001', 'Marine Drive Branch', 'Mumbai', 'Marine Drive', '022-87654321'),
  (3, 'BL001', 'MG Road Branch', 'Bangalore', 'MG Road', '080-11223344'),
  (4, 'CH001', 'T Nagar Branch', 'Chennai', 'T Nagar', '044-55667788');

-- Customers
INSERT INTO customers (id, full_name, email, phone, date_of_birth, city, account_opened_date, kyc_status) VALUES
  (1, 'Rajesh Kumar', 'rajesh@example.com', '9876543210', '1985-05-15', 'Delhi', '2024-01-05', 'verified'),
  (2, 'Priya Sharma', 'priya@example.com', '9876543211', '1990-08-22', 'Mumbai', '2024-01-10', 'verified'),
  (3, 'Amit Patel', 'amit@example.com', '9876543212', '1978-12-05', 'Bangalore', '2024-02-01', 'verified'),
  (4, 'Sneha Reddy', 'sneha@example.com', '9876543213', '1995-03-18', 'Chennai', '2024-02-15', 'pending'),
  (5, 'Vikram Singh', 'vikram@example.com', '9876543214', '1988-07-30', 'Delhi', '2024-03-01', 'verified'),
  (6, 'Anjali Mehta', 'anjali@example.com', '9876543215', '2000-11-12', 'Pune', '2024-03-05', 'rejected');

-- Accounts
INSERT INTO accounts (id, account_number, customer_id, branch_id, account_type, balance, opened_date, status) VALUES
  (1, 'ACC001', 1, 1, 'savings', 50000.00, '2024-01-05', 'active'),
  (2, 'ACC002', 2, 2, 'savings', 75000.00, '2024-01-10', 'active'),
  (3, 'ACC003', 1, 1, 'current', 120000.00, '2024-01-20', 'active'),
  (4, 'ACC004', 3, 3, 'savings', 30000.00, '2024-02-01', 'active'),
  (5, 'ACC005', 4, 4, 'savings', 15000.00, '2024-02-15', 'frozen'),
  (6, 'ACC006', 5, 1, 'fixed_deposit', 200000.00, '2024-03-01', 'active'),
  (7, 'ACC007', 2, 2, 'current', 50000.00, '2024-01-15', 'active');

-- Transactions
INSERT INTO transactions (id, account_id, transaction_type, amount, transaction_date, description, balance_after) VALUES
  (1, 1, 'deposit', 50000.00, '2024-01-05 10:00:00', 'Initial deposit', 50000.00),
  (2, 2, 'deposit', 75000.00, '2024-01-10 11:00:00', 'Initial deposit', 75000.00),
  (3, 1, 'deposit', 100000.00, '2024-01-20 09:00:00', 'Account opening', 150000.00),
  (4, 3, 'deposit', 120000.00, '2024-01-20 09:30:00', 'Initial deposit', 120000.00),
  (5, 1, 'withdrawal', 50000.00, '2024-02-01 14:00:00', 'ATM withdrawal', 100000.00),
  (6, 1, 'withdrawal', 50000.00, '2024-02-05 16:00:00', 'Transfer to ACC003', 50000.00),
  (7, 3, 'deposit', 50000.00, '2024-02-05 16:00:00', 'Transfer from ACC001', 170000.00),
  (8, 4, 'deposit', 30000.00, '2024-02-01 10:00:00', 'Initial deposit', 30000.00),
  (9, 5, 'deposit', 15000.00, '2024-02-15 11:00:00', 'Initial deposit', 15000.00),
  (10, 6, 'deposit', 200000.00, '2024-03-01 10:00:00', 'FD opening', 200000.00),
  (11, 7, 'deposit', 50000.00, '2024-01-15 12:00:00', 'Initial deposit', 50000.00),
  (12, 2, 'withdrawal', 10000.00, '2024-03-10 15:00:00', 'ATM withdrawal', 65000.00),
  (13, 1, 'interest', 500.00, '2024-03-31 23:59:59', 'Monthly interest', 50500.00),
  (14, 2, 'interest', 750.00, '2024-03-31 23:59:59', 'Monthly interest', 65750.00);

