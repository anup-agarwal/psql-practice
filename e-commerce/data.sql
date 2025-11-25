-- Clean up if you re-run
DROP TABLE IF EXISTS shipments, payments, order_items, orders, products, categories, customers CASCADE;

-- Customers
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  full_name   TEXT NOT NULL,
  email       TEXT UNIQUE,
  city        TEXT,
  created_at  DATE NOT NULL
);

-- Categories
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Products
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  category_id INT REFERENCES categories(id),
  price       NUMERIC(10,2) NOT NULL
);

-- Orders
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id  INT REFERENCES customers(id),
  status       TEXT,                 -- placed / shipped / delivered / cancelled
  order_date   DATE NOT NULL,
  total_amount NUMERIC(12,2)
);

-- Order items (many-to-many orders <-> products)
CREATE TABLE order_items (
  order_id    INT REFERENCES orders(id),
  product_id  INT REFERENCES products(id),
  quantity    INT,
  unit_price  NUMERIC(10,2),
  PRIMARY KEY (order_id, product_id)
);

-- Payments
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  order_id       INT REFERENCES orders(id),
  payment_method TEXT,               -- card / upi / cod / etc.
  amount         NUMERIC(12,2),
  status         TEXT,               -- success / failed / refunded
  paid_at        DATE
);

-- Shipments
CREATE TABLE shipments (
  id SERIAL PRIMARY KEY,
  order_id        INT REFERENCES orders(id),
  carrier         TEXT,
  tracking_number TEXT,
  shipped_at      DATE,
  delivered_at    DATE,
  status          TEXT               -- shipped / delivered
);

--------------------------------------------------
-- Seed Data
--------------------------------------------------

-- Customers
INSERT INTO customers (id, full_name, email, city, created_at) VALUES
  (1, 'Rahul Sharma',  'rahul@example.com',  'Delhi',     '2024-01-05'),
  (2, 'Priya Verma',   'priya@example.com',  'Mumbai',    '2024-01-10'),
  (3, 'Amit Patel',    'amit@example.com',   'Bangalore', '2024-02-01'),
  (4, 'Sara Khan',     'sara@example.com',   'Delhi',     '2024-02-15'),
  (5, 'Vikram Singh',  'vikram@example.com', 'Chennai',   '2024-03-01'),
  (6, 'Guest User',    'guest@example.com',  NULL,        '2024-03-10');

-- Categories
INSERT INTO categories (id, name) VALUES
  (1, 'Electronics'),
  (2, 'Books'),
  (3, 'Fashion');

-- Products
INSERT INTO products (id, name, category_id, price) VALUES
  (1, 'Smartphone X',         1, 30000.00),
  (2, 'Wireless Earbuds',     1, 5000.00),
  (3, 'Laptop Air',           1, 60000.00),
  (4, 'Novel - The Journey',  2, 800.00),
  (5, 'T-Shirt - Plain',      3, 500.00),
  (6, 'Jeans - Slim Fit',     3, 1500.00);

-- Orders
INSERT INTO orders (id, customer_id, status, order_date, total_amount) VALUES
  (1, 1, 'placed',    '2024-03-05', 35000.00),  -- Smartphone + Earbuds
  (2, 2, 'shipped',   '2024-03-06',  4100.00),  -- Books + Clothes
  (3, 3, 'placed',    '2024-03-07', 60000.00),  -- Laptop
  (4, 1, 'delivered', '2024-03-09',  1500.00),  -- T-Shirts
  (5, 4, 'shipped',   '2024-03-10',  8000.00),  -- Jeans + Earbuds
  (6, 5, 'cancelled', '2024-03-11',   800.00);  -- Novel

-- Order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
  -- Order 1: Rahul - Smartphone + Earbuds
  (1, 1, 1, 30000.00),
  (1, 2, 1,  5000.00),

  -- Order 2: Priya - 2 Novels, 2 T-Shirts, 1 Jeans
  (2, 4, 2,   800.00),
  (2, 5, 2,   500.00),
  (2, 6, 1,  1500.00),

  -- Order 3: Amit - 1 Laptop
  (3, 3, 1, 60000.00),

  -- Order 4: Rahul - 3 T-Shirts
  (4, 5, 3,   500.00),

  -- Order 5: Sara - 2 Jeans + 1 Earbuds
  (5, 6, 2,  1500.00),
  (5, 2, 1,  5000.00),

  -- Order 6: Vikram - 1 Novel (cancelled)
  (6, 4, 1,   800.00);

-- Payments
INSERT INTO payments (id, order_id, payment_method, amount, status, paid_at) VALUES
  (1, 1, 'card', 35000.00, 'success',  '2024-03-05'),
  (2, 2, 'upi',   4100.00, 'success',  '2024-03-06'),
  (3, 3, 'card', 60000.00, 'failed',   '2024-03-07'),
  (4, 4, 'cod',   1500.00, 'success',  '2024-03-10'),
  (5, 6, 'card',   800.00, 'refunded', '2024-03-08');

-- Shipments
INSERT INTO shipments (id, order_id, carrier, tracking_number, shipped_at, delivered_at, status) VALUES
  (1, 1, 'Bluedart',    'TRK1', '2024-03-06', '2024-03-08', 'delivered'),
  (2, 2, 'Delhivery',   'TRK2', '2024-03-07', NULL,         'shipped'),
  (3, 4, 'Bluedart',    'TRK3', '2024-03-11', '2024-03-13', 'delivered'),
  (4, 5, 'EcomExpress', 'TRK4', '2024-03-12', NULL,         'shipped');
