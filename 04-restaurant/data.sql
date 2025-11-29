-- Clean up if you re-run
DROP TABLE IF EXISTS order_items, reservations, orders, menu_items, categories, customers, tables CASCADE;

-- Tables (seating capacity)
CREATE TABLE tables (
  id SERIAL PRIMARY KEY,
  table_number INT UNIQUE NOT NULL,
  capacity INT NOT NULL,
  location TEXT,  -- window / corner / center / outdoor
  status TEXT DEFAULT 'available'  -- available / occupied / reserved
);

-- Customers
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  phone TEXT,
  city TEXT,
  created_at DATE NOT NULL
);

-- Categories for menu items
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT
);

-- Menu Items
CREATE TABLE menu_items (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  category_id INT REFERENCES categories(id),
  price NUMERIC(10,2) NOT NULL,
  is_available BOOLEAN DEFAULT true,
  preparation_time_minutes INT
);

-- Orders
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id),
  table_id INT REFERENCES tables(id),
  order_date TIMESTAMP NOT NULL,
  status TEXT,  -- pending / preparing / ready / served / cancelled
  total_amount NUMERIC(12,2),
  payment_status TEXT  -- paid / unpaid / refunded
);

-- Order Items (many-to-many orders <-> menu_items)
CREATE TABLE order_items (
  order_id INT REFERENCES orders(id),
  menu_item_id INT REFERENCES menu_items(id),
  quantity INT NOT NULL,
  unit_price NUMERIC(10,2),
  special_instructions TEXT,
  PRIMARY KEY (order_id, menu_item_id)
);

-- Reservations
CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id),
  table_id INT REFERENCES tables(id),
  reservation_date DATE NOT NULL,
  reservation_time TIME NOT NULL,
  party_size INT NOT NULL,
  status TEXT,  -- confirmed / cancelled / completed
  special_requests TEXT
);

--------------------------------------------------
-- Seed Data
--------------------------------------------------

-- Tables
INSERT INTO tables (id, table_number, capacity, location, status) VALUES
  (1, 1, 2, 'window', 'available'),
  (2, 2, 4, 'window', 'occupied'),
  (3, 3, 4, 'center', 'available'),
  (4, 4, 6, 'corner', 'reserved'),
  (5, 5, 2, 'outdoor', 'available'),
  (6, 6, 8, 'center', 'available');

-- Customers
INSERT INTO customers (id, full_name, email, phone, city, created_at) VALUES
  (1, 'Rajesh Kumar',    'rajesh@example.com',  '9876543210', 'Delhi',     '2024-01-05'),
  (2, 'Priya Sharma',    'priya@example.com',   '9876543211', 'Mumbai',    '2024-01-10'),
  (3, 'Amit Patel',      'amit@example.com',    '9876543212', 'Bangalore', '2024-02-01'),
  (4, 'Sneha Reddy',     'sneha@example.com',   '9876543213', 'Chennai',   '2024-02-15'),
  (5, 'Vikram Singh',    'vikram@example.com',  '9876543214', 'Delhi',     '2024-03-01'),
  (6, 'Walk-in Customer', NULL,                NULL,         NULL,        '2024-03-10');

-- Categories
INSERT INTO categories (id, name, description) VALUES
  (1, 'Appetizers', 'Starters and small plates'),
  (2, 'Main Course', 'Main dishes'),
  (3, 'Desserts', 'Sweet treats'),
  (4, 'Beverages', 'Drinks and refreshments');

-- Menu Items
INSERT INTO menu_items (id, name, category_id, price, is_available, preparation_time_minutes) VALUES
  (1, 'Spring Rolls',           1, 250.00, true,  15),
  (2, 'Chicken Wings',          1, 350.00, true,  20),
  (3, 'Caesar Salad',          1, 280.00, true,  10),
  (4, 'Butter Chicken',        2, 450.00, true,  30),
  (5, 'Biryani',               2, 380.00, true,  35),
  (6, 'Pasta Carbonara',       2, 420.00, true,  25),
  (7, 'Grilled Fish',          2, 550.00, false, 40),  -- Not available
  (8, 'Chocolate Cake',        3, 200.00, true,  5),
  (9, 'Ice Cream Sundae',      3, 180.00, true,  5),
  (10, 'Fresh Lime Soda',      4, 80.00,  true,  5),
  (11, 'Mango Lassi',          4, 120.00, true,  5),
  (12, 'Coffee',               4, 100.00, true,  3);

-- Orders
INSERT INTO orders (id, customer_id, table_id, order_date, status, total_amount, payment_status) VALUES
  (1, 1, 2, '2024-03-05 19:30:00', 'served',    700.00, 'paid'),    -- Rajesh: Spring Rolls + Butter Chicken
  (2, 2, 1, '2024-03-05 20:00:00', 'preparing', 830.00, 'paid'),   -- Priya: Wings + Biryani + Lassi
  (3, 3, 3, '2024-03-06 12:30:00', 'ready',     500.00, 'paid'),   -- Amit: Pasta + Salad
  (4, 1, 2, '2024-03-06 19:45:00', 'served',    680.00, 'paid'),   -- Rajesh: Biryani + Soda + Cake
  (5, 4, 4, '2024-03-07 13:00:00', 'pending',   350.00, 'unpaid'), -- Sneha: Wings only
  (6, 5, 5, '2024-03-07 14:00:00', 'cancelled', 450.00, 'refunded'); -- Vikram: Butter Chicken (cancelled)

-- Order Items
INSERT INTO order_items (order_id, menu_item_id, quantity, unit_price, special_instructions) VALUES
  -- Order 1: Rajesh - Spring Rolls + Butter Chicken
  (1, 1, 1, 250.00, 'Extra spicy'),
  (1, 4, 1, 450.00, NULL),

  -- Order 2: Priya - Wings + Biryani + Lassi
  (2, 2, 1, 350.00, NULL),
  (2, 5, 1, 380.00, 'Less spicy'),
  (2, 11, 1, 120.00, NULL),

  -- Order 3: Amit - Pasta + Salad
  (3, 6, 1, 420.00, NULL),
  (3, 3, 1, 280.00, 'No croutons'),

  -- Order 4: Rajesh - Biryani + Soda + Cake
  (4, 5, 1, 380.00, NULL),
  (4, 10, 1, 80.00, NULL),
  (4, 8, 1, 200.00, NULL),

  -- Order 5: Sneha - Wings only
  (5, 2, 1, 350.00, 'Extra sauce'),

  -- Order 6: Vikram - Butter Chicken (cancelled)
  (6, 4, 1, 450.00, NULL);

-- Reservations
INSERT INTO reservations (id, customer_id, table_id, reservation_date, reservation_time, party_size, status, special_requests) VALUES
  (1, 2, 4, '2024-03-08', '19:00:00', 4, 'confirmed', 'Birthday celebration'),
  (2, 3, 1, '2024-03-09', '20:00:00', 2, 'confirmed', NULL),
  (3, 4, 3, '2024-03-10', '12:30:00', 3, 'cancelled', NULL),
  (4, 5, 2, '2024-03-11', '19:30:00', 4, 'completed', 'Anniversary dinner');

