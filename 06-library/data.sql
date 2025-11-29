-- Clean up if you re-run
DROP TABLE IF EXISTS book_loans, books, authors, members, genres CASCADE;

-- Genres
CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT
);

-- Authors
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  nationality TEXT,
  birth_year INT
);

-- Members
CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  phone TEXT,
  membership_type TEXT,  -- regular / premium / student
  joined_date DATE NOT NULL,
  city TEXT
);

-- Books
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  isbn TEXT UNIQUE,
  author_id INT REFERENCES authors(id),
  genre_id INT REFERENCES genres(id),
  published_year INT,
  total_copies INT DEFAULT 1,
  available_copies INT DEFAULT 1,
  price NUMERIC(10,2)
);

-- Book Loans
CREATE TABLE book_loans (
  id SERIAL PRIMARY KEY,
  book_id INT REFERENCES books(id),
  member_id INT REFERENCES members(id),
  loan_date DATE NOT NULL,
  due_date DATE NOT NULL,
  return_date DATE,
  status TEXT,  -- active / returned / overdue
  fine_amount NUMERIC(10,2) DEFAULT 0
);

--------------------------------------------------
-- Seed Data
--------------------------------------------------

-- Genres
INSERT INTO genres (id, name, description) VALUES
  (1, 'Fiction', 'Novels and stories'),
  (2, 'Non-Fiction', 'Factual books'),
  (3, 'Science', 'Scientific literature'),
  (4, 'History', 'Historical accounts'),
  (5, 'Biography', 'Life stories');

-- Authors
INSERT INTO authors (id, full_name, email, nationality, birth_year) VALUES
  (1, 'R.K. Narayan', 'rknarayan@example.com', 'Indian', 1906),
  (2, 'Arundhati Roy', 'aroy@example.com', 'Indian', 1961),
  (3, 'Stephen Hawking', 'shawking@example.com', 'British', 1942),
  (4, 'Yuval Noah Harari', 'yharari@example.com', 'Israeli', 1976),
  (5, 'J.K. Rowling', 'jkrowling@example.com', 'British', 1965);

-- Members
INSERT INTO members (id, full_name, email, phone, membership_type, joined_date, city) VALUES
  (1, 'Rajesh Kumar', 'rajesh@example.com', '9876543210', 'premium', '2024-01-05', 'Delhi'),
  (2, 'Priya Sharma', 'priya@example.com', '9876543211', 'regular', '2024-01-10', 'Mumbai'),
  (3, 'Amit Patel', 'amit@example.com', '9876543212', 'student', '2024-02-01', 'Bangalore'),
  (4, 'Sneha Reddy', 'sneha@example.com', '9876543213', 'regular', '2024-02-15', 'Chennai'),
  (5, 'Vikram Singh', 'vikram@example.com', '9876543214', 'premium', '2024-03-01', 'Delhi'),
  (6, 'Anjali Mehta', 'anjali@example.com', '9876543215', 'student', '2024-03-05', 'Pune');

-- Books
INSERT INTO books (id, title, isbn, author_id, genre_id, published_year, total_copies, available_copies, price) VALUES
  (1, 'The Guide', '978-0143039642', 1, 1, 1958, 3, 1, 350.00),
  (2, 'The God of Small Things', '978-0060977496', 2, 1, 1997, 2, 0, 450.00),
  (3, 'A Brief History of Time', '978-0553380163', 3, 3, 1988, 4, 2, 550.00),
  (4, 'Sapiens', '978-0062316097', 4, 2, 2011, 5, 3, 600.00),
  (5, 'Harry Potter and the Philosopher''s Stone', '978-0747532699', 5, 1, 1997, 6, 4, 500.00),
  (6, '21 Lessons for the 21st Century', '978-0525512172', 4, 2, 2018, 3, 2, 650.00),
  (7, 'The Malgudi Days', '978-0143039666', 1, 1, 1943, 2, 1, 300.00),
  (8, 'The Theory of Everything', '978-8179925911', 3, 3, 2002, 2, 1, 480.00);

-- Book Loans
INSERT INTO book_loans (id, book_id, member_id, loan_date, due_date, return_date, status, fine_amount) VALUES
  (1, 1, 1, '2024-03-01', '2024-03-15', '2024-03-12', 'returned', 0),
  (2, 2, 2, '2024-03-05', '2024-03-19', NULL, 'active', 0),
  (3, 3, 3, '2024-02-20', '2024-03-06', '2024-03-10', 'returned', 50.00),
  (4, 4, 1, '2024-03-10', '2024-03-24', NULL, 'active', 0),
  (5, 5, 4, '2024-03-08', '2024-03-22', NULL, 'active', 0),
  (6, 2, 5, '2024-02-25', '2024-03-11', NULL, 'overdue', 100.00),
  (7, 7, 3, '2024-03-12', '2024-03-26', NULL, 'active', 0),
  (8, 8, 2, '2024-03-01', '2024-03-15', '2024-03-14', 'returned', 0),
  (9, 6, 5, '2024-03-05', '2024-03-19', NULL, 'active', 0);

