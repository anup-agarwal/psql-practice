-- Clean up if you re-run
DROP TABLE IF EXISTS bookings, rooms, guests, hotels, amenities CASCADE;

-- Hotels
CREATE TABLE hotels (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL,
  address TEXT,
  star_rating INT CHECK (star_rating BETWEEN 1 AND 5),
  phone TEXT
);

-- Amenities
CREATE TABLE amenities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT
);

-- Guests
CREATE TABLE guests (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  phone TEXT,
  city TEXT,
  country TEXT,
  registered_at DATE NOT NULL
);

-- Rooms
CREATE TABLE rooms (
  id SERIAL PRIMARY KEY,
  hotel_id INT REFERENCES hotels(id),
  room_number TEXT NOT NULL,
  room_type TEXT,  -- single / double / suite / deluxe
  price_per_night NUMERIC(10,2) NOT NULL,
  max_occupancy INT,
  is_available BOOLEAN DEFAULT true,
  UNIQUE (hotel_id, room_number)
);

-- Many-to-many: rooms <-> amenities
CREATE TABLE room_amenities (
  room_id INT REFERENCES rooms(id),
  amenity_id INT REFERENCES amenities(id),
  PRIMARY KEY (room_id, amenity_id)
);

-- Bookings
CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  guest_id INT REFERENCES guests(id),
  room_id INT REFERENCES rooms(id),
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  booking_date DATE NOT NULL,
  status TEXT,  -- confirmed / cancelled / completed / checked_in
  total_amount NUMERIC(12,2),
  payment_status TEXT  -- paid / unpaid / refunded
);

--------------------------------------------------
-- Seed Data
--------------------------------------------------

-- Hotels
INSERT INTO hotels (id, name, city, address, star_rating, phone) VALUES
  (1, 'Grand Plaza', 'Delhi', 'Connaught Place', 5, '011-12345678'),
  (2, 'Seaside Resort', 'Mumbai', 'Marine Drive', 4, '022-87654321'),
  (3, 'City Center Hotel', 'Bangalore', 'MG Road', 3, '080-11223344'),
  (4, 'Heritage Inn', 'Jaipur', 'Old City', 4, '0141-55667788');

-- Amenities
INSERT INTO amenities (id, name, description) VALUES
  (1, 'WiFi', 'Free wireless internet'),
  (2, 'Swimming Pool', 'Outdoor pool'),
  (3, 'Gym', 'Fitness center'),
  (4, 'Spa', 'Wellness spa'),
  (5, 'Restaurant', 'On-site dining'),
  (6, 'Parking', 'Free parking'),
  (7, 'Room Service', '24/7 room service'),
  (8, 'AC', 'Air conditioning');

-- Guests
INSERT INTO guests (id, full_name, email, phone, city, country, registered_at) VALUES
  (1, 'Rajesh Kumar', 'rajesh@example.com', '9876543210', 'Delhi', 'India', '2024-01-05'),
  (2, 'Priya Sharma', 'priya@example.com', '9876543211', 'Mumbai', 'India', '2024-01-10'),
  (3, 'Amit Patel', 'amit@example.com', '9876543212', 'Bangalore', 'India', '2024-02-01'),
  (4, 'Sarah Johnson', 'sarah@example.com', '9876543213', 'New York', 'USA', '2024-02-15'),
  (5, 'Vikram Singh', 'vikram@example.com', '9876543214', 'Delhi', 'India', '2024-03-01'),
  (6, 'Anjali Mehta', 'anjali@example.com', '9876543215', 'Pune', 'India', '2024-03-05');

-- Rooms
INSERT INTO rooms (id, hotel_id, room_number, room_type, price_per_night, max_occupancy, is_available) VALUES
  (1, 1, '101', 'single', 3000.00, 1, false),
  (2, 1, '102', 'double', 5000.00, 2, true),
  (3, 1, '201', 'suite', 8000.00, 4, false),
  (4, 2, '101', 'double', 4500.00, 2, true),
  (5, 2, '102', 'deluxe', 6000.00, 3, false),
  (6, 3, '201', 'single', 2500.00, 1, true),
  (7, 3, '202', 'double', 4000.00, 2, true),
  (8, 4, '301', 'suite', 7000.00, 4, true);

-- Room Amenities
INSERT INTO room_amenities (room_id, amenity_id) VALUES
  (1, 1), (1, 8),  -- Room 1: WiFi, AC
  (2, 1), (2, 8), (2, 7),  -- Room 2: WiFi, AC, Room Service
  (3, 1), (3, 8), (3, 7), (3, 4),  -- Room 3: WiFi, AC, Room Service, Spa
  (4, 1), (4, 8), (4, 2),  -- Room 4: WiFi, AC, Pool
  (5, 1), (5, 8), (5, 7), (5, 4),  -- Room 5: WiFi, AC, Room Service, Spa
  (6, 1), (6, 8),  -- Room 6: WiFi, AC
  (7, 1), (7, 8), (7, 3),  -- Room 7: WiFi, AC, Gym
  (8, 1), (8, 8), (8, 7), (8, 4), (8, 2);  -- Room 8: WiFi, AC, Room Service, Spa, Pool

-- Bookings
INSERT INTO bookings (id, guest_id, room_id, check_in_date, check_out_date, booking_date, status, total_amount, payment_status) VALUES
  (1, 1, 1, '2024-03-10', '2024-03-12', '2024-03-05', 'completed', 6000.00, 'paid'),
  (2, 2, 4, '2024-03-15', '2024-03-18', '2024-03-10', 'confirmed', 13500.00, 'paid'),
  (3, 3, 6, '2024-03-20', '2024-03-22', '2024-03-15', 'confirmed', 5000.00, 'unpaid'),
  (4, 4, 3, '2024-03-08', '2024-03-10', '2024-03-01', 'completed', 16000.00, 'paid'),
  (5, 5, 5, '2024-03-12', '2024-03-14', '2024-03-08', 'cancelled', 12000.00, 'refunded'),
  (6, 1, 2, '2024-03-25', '2024-03-27', '2024-03-20', 'confirmed', 10000.00, 'paid'),
  (7, 6, 7, '2024-03-18', '2024-03-20', '2024-03-12', 'checked_in', 8000.00, 'paid');

